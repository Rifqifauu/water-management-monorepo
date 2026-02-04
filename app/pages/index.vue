<template>
<div v-if="isMounted" class="min-h-screen font-sans selection:bg-green-100 selection:text-green-800 relative w-full h-full">    
    <div class="fixed inset-0 z-0">
        <img 
          src="/login.jpg"
          alt="Background" 
          class="w-full h-full object-cover"
        />
        <div class="absolute inset-0 bg-white/70 backdrop-blur-xs"></div>
    </div>

    <div class="absolute top-6 right-6 z-50">
      <button 
        @click="handleLogout"
        class="flex items-center gap-2 px-4 py-2 bg-white/80 backdrop-blur-sm border border-red-100 text-red-600 rounded-xl hover:bg-red-50 hover:border-red-200 transition-all duration-300 shadow-sm group cursor-pointer"
      >
        <UIcon name="i-heroicons-arrow-right-on-rectangle" class="w-5 h-5 group-hover:-translate-x-1 transition-transform" />
        <span class="text-sm font-semibold">Keluar</span>
      </button>
    </div>

    <div class="relative z-10 max-w-7xl mx-auto px-6 py-12 flex flex-col min-h-screen">
      
      <header class="text-center mb-16 mt-8 space-y-4">
        <div class="inline-flex items-center justify-center p-3 bg-white/80 backdrop-blur rounded-2xl shadow-sm border border-gray-100 mb-4 animate-fade-in-up">
            <img src="/landing.png" alt="Triputra Agro Persada Logo" class="w-64 object-contain">
        </div>
        <h2 class="text-light text-gray-500 uppercase tracking-widest text-sm font-semibold">Water Management System</h2>
        <h1 class="text-4xl md:text-5xl font-extrabold text-gray-900 tracking-tight leading-tight">
          PALM WATER OPERATIONAL SYSTEM <span class="text-green-800" > <br>(PWOS)</span> 
        </h1>
       
        <p class="text-gray-600 italic max-w-2xl mx-auto mt-4 text-lg font-medium">
            "Smart Water, Smart Plantation"
        </p>
      </header>

      <main class="flex-grow flex items-center justify-center">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 w-full">
          
          <div 
            @click="goTo('/dashboard')" 
            class="group bg-white/80 backdrop-blur-md rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-2 transition-all duration-300 cursor-pointer border border-white/50 relative overflow-hidden"
          >
            <div class="absolute top-0 right-0 w-32 h-32 bg-green-50 rounded-bl-full -mr-8 -mt-8 transition-transform group-hover:scale-110"></div>
            
            <div class="relative z-10">
              <div class="w-14 h-14 bg-green-100 text-green-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-green-600 group-hover:text-white transition-colors duration-300">
                <UIcon name="i-lucide-droplet" class="w-7 h-7" />
              </div>
              
              <h3 class="text-xl font-bold text-gray-900 mb-3 group-hover:text-green-700 transition-colors">
               PalmWater OS Dashboard 
              </h3>
              <p class="text-gray-600 text-sm leading-relaxed mb-6">
                 PWOS Dashboard menyatukan data mobile dan WebGIS menjadi informasi yang mudah dibaca dan siap digunakan.
              </p>
              
              <div class="flex items-center text-green-600 font-semibold text-sm group-hover:translate-x-2 transition-transform">
                 <UBadge label="Dashboard" variant="subtle" />
              </div>
            </div>
          </div>

          <div 
            @click="goTo('/mobile')" 
            class="group bg-white/80 backdrop-blur-md rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-2 transition-all duration-300 cursor-pointer border border-white/50 relative overflow-hidden"
          >
            <div class="absolute top-0 right-0 w-32 h-32 bg-green-50 rounded-bl-full -mr-8 -mt-8 transition-transform group-hover:scale-110"></div>
            
            <div class="relative z-10">
              <div class="w-14 h-14 bg-green-100 text-green-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-green-600 group-hover:text-white transition-colors duration-300">
                <UIcon name="i-heroicons-device-phone-mobile" class="w-7 h-7" />
              </div>
              
              <h3 class="text-xl font-bold text-gray-900 mb-3 group-hover:text-green-700 transition-colors">
                PalmWater OS Apps
              </h3>
              <p class="text-gray-600 text-sm leading-relaxed mb-6">
                Aplikasi mobile offline-first yang dirancang khusus untuk pengamatan di lapangan secara cepat dan akurat.
              </p>
              
              <div class="flex items-center text-green-600 font-semibold text-sm group-hover:translate-x-2 transition-transform">
                  <UBadge label="Android" variant="subtle" />
              </div>
            </div>
          </div>

          <div 
            @click="goTo('/gis')" 
            class="group bg-white/80 backdrop-blur-md rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-2 transition-all duration-300 cursor-pointer border border-white/50 relative overflow-hidden"
          >
            <div class="absolute top-0 right-0 w-32 h-32 bg-green-50 rounded-bl-full -mr-8 -mt-8 transition-transform group-hover:scale-110"></div>
            
            <div class="relative z-10">
              <div class="w-14 h-14 bg-green-100 text-green-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-green-600 group-hover:text-white transition-colors duration-300">
                <UIcon name="i-heroicons-map" class="w-7 h-7" />
              </div>
              
              <h3 class="text-xl font-bold text-gray-900 mb-3 group-hover:text-green-700 transition-colors">
                PalmWater OS WebGIS
              </h3>
              <p class="text-gray-600 text-sm leading-relaxed mb-6">
                Visualisasi spasial yang kuat dengan peta interaktif berbasiskan data real-time dari lapangan.
              </p>
              
              <div class="flex items-center text-green-600 font-semibold text-sm group-hover:translate-x-2 transition-transform">
                 <UBadge label="Spatial Analysis" variant="subtle" />
              </div>
            </div>
          </div>

        </div>
      </main>

<footer class="mt-16 text-center border-t border-gray-300/50 pt-8">
  <p class="text-sm text-gray-500 font-medium">
    &copy; 
    <ClientOnly>
      {{ new Date().getFullYear() }}
    </ClientOnly> 
    GIS & Survey Division • Triputra Agro Persada
  </p>
</footer>

    </div>
  </div>
</template>

<script setup>
const router = useRouter();
const isMounted = ref(false);
onMounted(() => {
  // Cek login segera setelah masuk ke client
  if (localStorage.getItem('status_login') !== 'true') {
    return navigateTo('/login', { replace: true });
  }
    isMounted.value = true;
});
definePageMeta({
  layout: 'guest'
});

const goTo = (path) => {
    router.push(path);
}

// --- LOGIKA LOGOUT ---
const handleLogout = () => {
  localStorage.removeItem('status_login')
  localStorage.removeItem('user_info')
  navigateTo('/login')
}
</script>

<style scoped>
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translate3d(0, 20px, 0);
  }
  to {
    opacity: 1;
    transform: translate3d(0, 0, 0);
  }
}

.animate-fade-in-up {
  animation: fadeInUp 0.8s cubic-bezier(0.2, 0.8, 0.2, 1);
}
</style>