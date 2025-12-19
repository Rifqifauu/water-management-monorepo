<template>
  <div class="absolute inset-0 z-[1001] bg-slate-900/60 backdrop-blur-md flex items-center justify-center animate-in fade-in duration-300">
    <div class="bg-white dark:bg-gray-900 px-8 py-6 rounded-2xl shadow-2xl flex flex-col items-center gap-5 border border-gray-200 dark:border-gray-800 max-w-sm animate-in slide-in-from-bottom-4 duration-500">
      <!-- Animated Icon -->
      <div class="relative">
        <UIcon name="i-heroicons-map-pin" class="w-12 h-12 text-primary animate-bounce" />
        <div class="absolute -inset-2 bg-primary/20 rounded-full animate-ping"></div>
      </div>

      <!-- Text -->
      <div class="text-center space-y-2">
        <h3 class="text-base font-bold text-gray-800 dark:text-gray-100">
          Mencari Lokasi Anda
        </h3>
        <p class="text-sm text-gray-600 dark:text-gray-400">
          Menyinkronkan dengan GPS perangkat...
        </p>
      </div>

      <!-- Progress Bar -->
      <div class="w-full bg-gray-200 dark:bg-gray-800 rounded-full h-1.5 overflow-hidden">
        <div class="h-full bg-gradient-to-r from-primary to-blue-500 rounded-full animate-pulse" style="width: 70%"></div>
      </div>

      <!-- Tips -->
      <p class="text-xs text-gray-500 dark:text-gray-500 text-center max-w-xs">
        Pastikan GPS aktif dan izinkan akses lokasi
      </p>
    </div>
  </div>
</template>