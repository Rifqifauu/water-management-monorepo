<script setup>
import { useRoute, useRouter } from 'vue-router';
import { ref, watch, onMounted } from 'vue'; // Tambah ref, watch, onMounted

const route = useRoute();
const router = useRouter();

// State untuk melacak submenu mana yang sedang terbuka
const openSubmenu = ref(''); 

const menuItems = [
  { 
    name: 'Dashboard', 
    url: '/dashboard', 
    iconPath: 'M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0h6m-6 0h-2M9 21h6' 
  },
  { 
    name: 'Analytics', 
    url: '/dashboard/analytics', 
    iconPath: 'M13 7h8m0 0v8m0-8l-8 8-4-4-6 6' 
  },

  // ---------------------------------------------
  { 
    name: 'DCC', 
    url: '/dashboard/dcc', 
    iconPath: 'M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z' 
  },
  { 
    name: 'Data Records', 
    url: '/dashboard/data-records', 
    iconPath: 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01' 
  },
  { 
    name: 'New Entry', 
    url: '/dashboard/new-entry', 
    iconPath: 'M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z' 
  },
    { 
    name: 'Data Master', 
    iconPath: 'M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4',
    children: [
      { name: 'Employee', url: '/dashboard/master/karyawan' },
      { name: 'Location', url: '/dashboard/master/lokasi' },
      { name: 'Skoring', url: '/dashboard/master/skoring' },
   
    ]
  },
];

// Fungsi toggle submenu
const toggleSubmenu = (itemName) => {
  if (openSubmenu.value === itemName) {
    openSubmenu.value = ''; // Tutup jika sudah terbuka
  } else {
    openSubmenu.value = itemName; // Buka yang diklik
  }
};

// Cek apakah URL aktif ada di dalam submenu (untuk styling parent)
const isActiveParent = (item) => {
  if (!item.children) return false;
  return item.children.some(child => route.path === child.url);
};

// Auto open submenu jika kita refresh halaman dan sedang berada di child link
const checkActiveRoute = () => {
  menuItems.forEach(item => {
    if (isActiveParent(item)) {
      openSubmenu.value = item.name;
    }
  });
};

onMounted(() => {
  checkActiveRoute();
});

// Watch route changes (opsional, agar menu tetap sinkron saat navigasi)
watch(() => route.path, () => {
  checkActiveRoute();
});

const handleLogout = () => {
  console.log('Logging out...');
  // router.push('/login'); 
};
</script>

<template>
<div class="flex h-screen flex-col bg-blue-900 text-white">
  <div class="p-6 pt-8">
    <div class="flex items-center space-x-3">
      <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-white shadow-lg">
        <img src="/logo_triputra.png" alt="Triputra Agro Persada Logo" class="h-8 w-8 object-contain" />
      </div>
      <div>
        <h1 class="text-xl font-bold leading-tight">Water<br>Management</h1>
        <p class="mt-1 text-xs font-medium text-blue-200">Dashboard</p>
      </div>
    </div>
  </div>

  <nav class="flex-1 space-y-2 px-4 mt-4 overflow-y-auto">
    <template v-for="item in menuItems" :key="item.name">
      
      <div v-if="item.children" class="space-y-1">
        <button 
          @click="toggleSubmenu(item.name)"
          :class="[
            'group relative flex w-full items-center justify-between rounded-2xl px-4 py-4 font-medium transition-all duration-200 ease-in-out',
            isActiveParent(item) || openSubmenu === item.name
              ? 'bg-white/10 text-white' 
              : 'text-blue-100 hover:bg-white/5 hover:text-white'
          ]"
        >
          <div class="flex items-center space-x-4 ml-2">
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="item.iconPath"></path>
            </svg>
            <span class="text-base">{{ item.name }}</span>
          </div>
          
          <svg 
            class="h-4 w-4 transition-transform duration-200"
            :class="openSubmenu === item.name ? 'rotate-180' : ''"
            fill="none" stroke="currentColor" viewBox="0 0 24 24"
          >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
          </svg>

          <div 
            v-if="isActiveParent(item)"
            class="absolute left-0 top-1/2 h-8 w-1.5 -translate-y-1/2 rounded-r-full bg-blue-300 shadow-[0_0_10px_rgba(255,255,255,0.4)]"
          ></div>
        </button>

        <div v-show="openSubmenu === item.name" class="pl-4 space-y-1 transition-all duration-300">
          <NuxtLink
            v-for="child in item.children"
            :key="child.name"
            :to="child.url"
            :class="[
              'flex items-center rounded-xl px-4 py-3 text-sm font-medium transition-colors',
              route.path === child.url 
                ? 'bg-blue-800 text-white shadow-inner' 
                : 'text-blue-200 hover:bg-blue-800/50 hover:text-white'
            ]"
          >
            <span 
              class="mr-3 h-1.5 w-1.5 rounded-full"
              :class="route.path === child.url ? 'bg-white' : 'bg-blue-400'"
            ></span>
            {{ child.name }}
          </NuxtLink>
        </div>
      </div>

      <NuxtLink
        v-else
        :to="item.url" 
        :class="[
          'group relative flex items-center rounded-2xl px-4 py-4 font-medium transition-all duration-200 ease-in-out',
          route.path === item.url 
            ? 'bg-white/10 text-white shadow-lg' 
            : 'text-blue-100 hover:bg-white/5 hover:text-white'
        ]"
      >
        <div 
          v-if="route.path === item.url"
          class="absolute left-0 top-1/2 h-8 w-1.5 -translate-y-1/2 rounded-r-full bg-white shadow-[0_0_10px_rgba(255,255,255,0.4)]"
        ></div>

        <div class="flex items-center space-x-4 ml-2"> 
          <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="item.iconPath"></path>
          </svg>
          <span class="text-base">{{ item.name }}</span>
        </div>
      </NuxtLink>

    </template>
  </nav>

  <div class="px-4 pb-6 mt-4">
    <div class="rounded-2xl bg-blue-800/50 p-4 backdrop-blur-sm">
      <div class="flex items-center space-x-3">
        <img src="/logo_triputra.png" alt="Triputra Agro Persada Logo" class="h-8 w-8 object-contain" />
        <NuxtLink to="/">
          <div>
            <p class="text-xs font-bold text-white">TRIPUTRA AGRO</p>
            <p class="text-[10px] text-blue-200">PT. Etam Bersama Lestari</p>
          </div>
        </NuxtLink>
      </div>
    </div>
    <div class="mt-4 text-center">
      <p class="text-[10px] text-blue-300/80">
        © 2025 • All Rights Reserved
      </p>
    </div>
  </div>
</div>
</template>