<template>
  <div class="min-h-screen bg-gray-50 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full text-center space-y-8">
      
      <div class="flex justify-center">
        <div class="bg-green-100 p-4 rounded-full">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
          </svg>
        </div>
      </div>

      <div>
        <h2 class="mt-6 text-3xl font-extrabold text-gray-900 sm:text-4xl">
          PWOS Mobile App
        </h2>
        <p class="text-green-600 font-semibold tracking-wide uppercase text-sm">
          Versi 1.1 - 02/2026 Release
        </p>
        <p class="mt-4 text-sm text-gray-600 sm:text-base px-4">
          Silakan unduh aplikasi PWOS melalui tombol di bawah ini untuk mendapatkan akses penuh ke fitur mobile kami.
        </p>
      </div>

      <div class="mt-8 flex flex-col space-y-4 sm:flex-row sm:space-y-0 sm:space-x-4 justify-center">
        <a 
          href="/pwos.apk" 
          download
          class="inline-flex items-center justify-center px-6 py-3 border border-transparent text-base font-bold rounded-lg text-white bg-green-600 hover:bg-green-700 transition duration-150 ease-in-out shadow-lg hover:shadow-xl transform hover:-translate-y-0.5"
        >
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
          </svg>
          Unduh PWOS v1.1
        </a>

        <NuxtLink 
          to="/" 
          class="inline-flex items-center justify-center px-6 py-3 border border-gray-300 text-base font-medium rounded-lg text-gray-700 bg-white hover:bg-gray-50 transition duration-150 ease-in-out"
        >
          Kembali
        </NuxtLink>
      </div>

    </div>
    
    <div class="mt-16 text-center">
      <p class="text-xs text-gray-400">
        &copy; {{ new Date().getFullYear() }} Triputra Agro Persada. All rights reserved.
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'Download PWOS Mobile App v1.1',
})

definePageMeta({
    layout : 'guest'
})
</script>