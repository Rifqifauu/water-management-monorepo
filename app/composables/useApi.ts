export async function useApi<T = any>(endpoint: string, options: any = {}) {
  const config = useRuntimeConfig()
  const apiUrl = config.public.apiUrl
  const token = useCookie('token').value

  if (!apiUrl) throw new Error('API URL is undefined. Check your .env file.')

  // 1. Handle Query Parameters secara aman
  const queryParams = options.params ? `?${new URLSearchParams(options.params).toString()}` : ''
  const url = `${apiUrl}/${endpoint.replace(/^\//, '')}${queryParams}`

  // 2. Deteksi tipe request
  const isFormData = options.body instanceof FormData
  const isBlobRequest = options.responseType === 'blob'

  // 3. Setup Headers
  const headers = {
    'Accept': isBlobRequest ? '*/*' : 'application/json',
    ...(isFormData ? {} : { 'Content-Type': 'application/json' }),
    ...(token ? { 'Authorization': `Bearer ${token}` } : {}),
    ...options.headers,
  }

  // ================= DEBUG REQUEST =================
  if (process.dev) {
    console.groupCollapsed(`🚀 [API REQUEST] ${options.method || 'GET'} - ${endpoint}`);
    console.log('🔗 Full URL:', url);
    if (options.body) console.log('📦 Body:', options.body);
    console.groupEnd();
  }

  try {
    const response = await fetch(url, { ...options, headers })

    // 4. Handle Error (Status 4xx atau 5xx)
    if (!response.ok) {
      const contentType = response.headers.get('content-type')
      let errorDetail: any

      if (contentType && contentType.includes('application/json')) {
        // Jika error dalam format JSON (Validation error, etc)
        errorDetail = await response.json()
      } else {
        // Jika error dalam format HTML/Text (Laravel 500 error page)
        const textError = await response.text()
        errorDetail = { message: 'Server Error (HTML)', raw: textError.substring(0, 200) + '...' }
      }

      console.group(`❌ [API ERROR] ${response.status} - ${endpoint}`);
      console.error('Data:', errorDetail);
      console.groupEnd();

      throw {
        status: response.status,
        message: errorDetail.message || `Request failed with status ${response.status}`,
        errors: errorDetail.errors || null,
        raw: errorDetail
      }
    }

    // 5. Success Response
    if (isBlobRequest) {
      return await response.blob() as unknown as T
    }

    return await response.json() as Promise<T>

  } catch (error: any) {
    // Menangkap error network atau error throw dari blok di atas
    if (error.status) throw error // Re-throw error dari API

    console.error('🔥 [NETWORK/INTERNAL ERROR]', error);
    throw {
      status: 500,
      message: error.message || 'Koneksi ke server terputus.',
      errors: null
    }
  }
}