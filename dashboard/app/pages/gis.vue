<template>
  <div class="min-h-screen bg-gray-50 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full text-center space-y-8 transform transition-all duration-1000 animate-in fade-in slide-in-from-bottom-10">
      
      <div class="flex justify-center">
        <div class="relative">
          <div class="absolute inset-0 rounded-full bg-emerald-400 animate-ping opacity-20"></div>
          <div class="relative bg-emerald-100 p-4 rounded-full shadow-md animate-bounce-slow">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-emerald-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" />
            </svg>
          </div>
        </div>
      </div>

      <div class="space-y-4">
        <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl tracking-tight">
          WEB GIS Water Management
        </h2>
        <p class="text-sm text-gray-600 sm:text-base leading-relaxed">
          Halaman ini telah berpindah. Anda akan dialihkan secara otomatis ke 
          <span class="font-semibold text-emerald-600">Sistem GIS Palm Water OS</span>.
        </p>
      </div>

      <div class="w-full bg-gray-200 rounded-full h-1.5 mt-4 overflow-hidden">
        <div 
          class="bg-emerald-500 h-full transition-all duration-[3000ms] ease-linear"
          :style="{ width: progressWidth + '%' }"
        ></div>
      </div>

      <div class="mt-8">
        <a 
          href="https://gis.palmwateros-tap.com" 
          class="group inline-flex items-center justify-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-emerald-600 hover:bg-emerald-700 transition duration-300 ease-in-out shadow-lg hover:shadow-emerald-200 hover:-translate-y-1"
        >
          Ke Sistem WEB GIS Sekarang
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-2 transform group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
          </svg>
        </a>
      </div>

    </div>
    
    <div class="mt-10 text-center text-xs text-gray-400">
      &copy; {{ new Date().getFullYear() }} Triputra Agro Persada. All rights reserved.
    </div>
  </div>
</template>

<script setup lang="ts">
const progressWidth = ref(0)

useHead({
  title: 'Redirecting to Sistem GIS',
})

definePageMeta({
    layout: 'guest'
})

onMounted(() => {
  // Mulai animasi progress bar
  setTimeout(() => {
    progressWidth.value = 100
  }, 100)

  // Redirect setelah 3 detik
  setTimeout(() => {
    window.location.href = 'https://gis.palmwateros-tap.com';
  }, 3000);
})
</script>

<style scoped>
/* Custom Animasi Bounce yang lebih halus */
@keyframes bounce-slow {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}
.animate-bounce-slow {
  animation: bounce-slow 3s infinite ease-in-out;
}

/* Standar Tailwind tidak selalu menyertakan animate-in secara default, 
   ini adalah fallback CSS jika Anda tidak memakai plugin tailwindcss-animate */
.fade-in { animation: fadeIn 0.8s ease-out forwards; }
.slide-in-from-bottom-10 { animation: slideIn 0.8s ease-out forwards; }

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideIn {
  from { transform: translateY(20px); }
  to { transform: translateY(0); }
}
</style>