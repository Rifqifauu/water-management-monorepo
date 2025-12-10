export async function useApi<T = any>(endpoint: string, options: RequestInit = {}) {
  const config = useRuntimeConfig()
  const apiUrl = config.public.apiUrl 

  if (!apiUrl) throw new Error('API URL is undefined.')


  const isFormData = options.body instanceof FormData;

  options.headers = {
      'Accept': 'application/json',

      ...(isFormData ? {} : { 'Content-Type': 'application/json' }),
      ...options.headers, 
  }

  const url = `${apiUrl}/${endpoint}`
  const response = await fetch(url, options)

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    if (errorData) {
        throw {
            status: response.status,
            message: errorData.message || response.statusText, 
            errors: errorData.errors || null 
        }
    }
    throw new Error(`API request failed: ${response.status} ${response.statusText}`)
  }

  return response.json() as Promise<T>
}