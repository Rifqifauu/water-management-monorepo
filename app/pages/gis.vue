
<template>
  <div class="min-h-screen bg-gray-50 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full text-center space-y-8">
      
      <div class="flex justify-center">
        <div class="bg-blue-100 p-4 rounded-full">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.384-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z" />
          </svg>
        </div>
      </div>

      <div>
        <h2 class="mt-6 text-3xl font-extrabold text-gray-900 sm:text-4xl">
          Coming Soon
        </h2>
        <p class="mt-2 text-sm text-gray-600 sm:text-base">
          Aplikasi ini sedang dalam tahap pengembangan. Kami sedang bekerja keras untuk memberikan pengalaman terbaik bagi Anda.
        </p>
      </div>

      <div class="mt-8">
        <NuxtLink 
          to="/" 
          class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 transition duration-150 ease-in-out shadow-sm hover:shadow-md"
        >
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
          </svg>
          Kembali ke Landing Page
        </NuxtLink>
      </div>

    </div>
    
    <div class="mt-10 text-center text-xs text-gray-400">
      &copy; {{ new Date().getFullYear() }} Triputra Agro Persada. All rights reserved.
    </div>
  </div>
</template>
<script setup lang="ts">
// Mengatur meta title halaman
useHead({
  title: 'Coming Soon - Under Construction',
})
definePageMeta({
    layout : 'guest'
})
</script>   