<template>
  <div class="min-h-screen flex bg-gray-50 font-sans">
    
<div 
  class="relative w-full lg:w-1/2 flex items-center justify-center p-8 bg-cover bg-center bg-no-repeat" 
  style="background-image: url('/login.jpg');"
>
  <div class="absolute inset-0 bg-white/70"></div>

  <div class="relative z-10 w-full max-w-md">
    
    <div class="mb-8">
      <div class="flex flex-col md:flex-row items-center gap-3 mb-2">
        <div class="w-12 h-12 bg-emerald-600 rounded-lg flex items-center justify-center">
          <img src="/logo_triputra.png" alt="Triputra Agro Persada Logo" class="h-8 w-8 object-contain" />
        </div>
        <div>
          <h1 class="text-xl font-semibold text-gray-900">PT TRIPUTRA AGRO PERSADA</h1>
          <p class="text-sm text-gray-500">Palm Water Operational System Water Management</p>
        </div>
      </div>
    </div>

    <div class="mb-8">
      <h2 class="text-2xl font-semibold text-gray-900 mb-2">Login</h2>
      <p class="text-gray-600">Masuk ke sistem Water Management</p>
    </div>

    <div v-if="errorMsg" class="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg transition-all duration-300">
      <p class="text-sm text-red-600">{{ errorMsg }}</p>
    </div>

    <form @submit.prevent="handleLogin" class="space-y-5">
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">Username</label>
        <input 
          v-model="form.username"
          type="text" 
          class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-transparent outline-none transition bg-white"
          placeholder="Masukkan username"
          required
        />
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">Password</label>
        <div class="relative">
          <input 
            v-model="form.password"
            :type="showPassword ? 'text' : 'password'" 
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-transparent outline-none transition bg-white"
            placeholder="Masukkan password"
            required
          />
          <button 
            type="button"
            @click="showPassword = !showPassword"
            class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 focus:outline-none"
          >
            <svg v-if="showPassword" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                   <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21"/>
                </svg>
                <svg v-else class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                </svg>
          </button>
        </div>
      </div>

      <div class="flex items-center justify-between">
        <label class="flex items-center cursor-pointer">
          <input 
            v-model="form.rememberMe"
            type="checkbox" 
            class="w-4 h-4 text-emerald-600 border-gray-300 rounded focus:ring-emerald-500"
          >
          <span class="ml-2 text-sm text-gray-600">Ingat saya</span>
        </label>
        <a href="#" class="text-sm text-emerald-600 hover:text-emerald-700 font-medium">Lupa password?</a>
      </div>

      <button 
        type="submit"
        :disabled="isLoading"
        class="w-full bg-emerald-600 text-white py-3 rounded-lg font-medium hover:bg-emerald-700 focus:ring-4 focus:ring-emerald-200 transition disabled:opacity-70 disabled:cursor-not-allowed"
      >
        <span v-if="isLoading">Memproses...</span>
        <span v-else>Masuk</span>
      </button>

    </form>

    <p class="mt-6 text-center text-sm text-gray-600">
      Belum punya akun? <a href="#" class="text-emerald-600 hover:text-emerald-700 font-medium">Hubungi Admin</a>
    </p>

  </div>
</div>

    <div class="hidden lg:block lg:w-1/2 bg-gradient-to-br from-emerald-600 to-teal-700 relative overflow-hidden">
      <div class="absolute inset-0 bg-black/10"></div>
     
      <div class="relative h-full flex flex-col justify-center p-12 text-white">
        <div class="py-4 flex  gap-4">
        <div class="bg-white/90 w-12 h-12 flex items-center justify-center rounded-lg">
            <UIcon name="i-lucide-square" class="w-10 h-10 text-green-600"></UIcon>
        </div>
        <div class="bg-white/90 w-12 h-12 flex items-center justify-center rounded-lg">
            <UIcon name="i-lucide-star" class="w-10 h-10 text-yellow-600"></UIcon>
        </div>
        <div class="bg-white/90 w-12 h-12 flex items-center justify-center rounded-lg">
            <UIcon name="i-lucide-heart" class="w-10 h-10 text-red-600"></UIcon>
        </div>
        <div class="bg-white/90 w-12 h-12 flex items-center justify-center rounded-lg">
            <UIcon name="i-lucide-circle" class="w-10 h-10 text-black"></UIcon>
        </div>
      </div>
        <h3 class="text-4xl font-bold mb-4">Smart Water,<br/>Smart Plantation</h3>
        <p class="text-lg text-emerald-50 mb-8">
          Integrated Smart Water Management System for Oil Palm Plantation.
          Satu platform terpadu untuk mengelola, memantau, dan mengoptimalkan sistem tata air perkebunan.
        </p>
        
        <div class="space-y-4">
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center flex-shrink-0">
                            <UIcon name="i-lucide-droplet" class="w-7 h-7" />

            </div>
            <div>
              <p class="font-medium">PalmWater OS Dashboard </p>
            </div>
          </div>
          
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center flex-shrink-0">
                              <UIcon name="i-heroicons-device-phone-mobile" class="w-7 h-7" />

            </div>
            <div>
               <p class="font-medium">PalmWater OS Apps</p>
            </div>
          </div>
          
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center flex-shrink-0">
                              <UIcon name="i-heroicons-map" class="w-7 h-7" />
            </div>
            <div>
               <p class="font-medium">PalmWater OS WebGis</p>
            </div>
          </div>
        </div>

        <div class="mt-12 pt-8 border-t border-white/20">
          <p class="text-sm text-emerald-50">© 2025 GIS & Survey Division. Triputra Agro Persada</p>
        </div>
      </div>

      <div class="absolute top-20 right-20 w-64 h-64 bg-white/5 rounded-full blur-3xl"></div>
      <div class="absolute bottom-20 left-20 w-80 h-80 bg-white/5 rounded-full blur-3xl"></div>
    </div>

  </div>
</template>

<script setup>
definePageMeta({
  layout: 'guest'
})

// State form
const form = reactive({
  username: '',
  password: '',
  rememberMe: false 
})

const isLoading = ref(false)
const errorMsg = ref('')
const showPassword = ref(false)

const HARDCODE_USER = 'admin'
const HARDCODE_PASS = 'admin123'

const handleLogin = async () => {
  errorMsg.value = ''
  isLoading.value = true

  try {
    await new Promise(r => setTimeout(r, 800))

    if (form.username === 'admin' && form.password === 'admin123') {
      // Simpan ke localStorage
      localStorage.setItem('status_login', 'true')
      
      // Opsional: Simpan data user jika perlu
      localStorage.setItem('user_info', JSON.stringify({
        username: form.username,
        login_at: new Date()
      }))

      return navigateTo('/', { replace: true })
    } else {
      errorMsg.value = 'Username atau Password salah!'
    }
  } finally {
    isLoading.value = false
  }
}
</script>