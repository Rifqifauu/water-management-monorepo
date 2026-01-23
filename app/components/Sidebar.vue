<script setup>
import { useRoute, useRouter } from 'vue-router';
import { ref, watch, onMounted } from 'vue';

const route = useRoute();
const router = useRouter();

const isSidebarCollapsed = ref(false);
const isMobileMenuOpen = ref(false);
const openSubmenu = ref('');
const isDownloadModalOpen = ref(false);
const downloadMonth = ref(new Date().getMonth() + 1); // Default bulan sekarang
const downloadYear = ref(new Date().getFullYear()); // Default tahun sekarang

const months = [
  { id: 1, name: 'Januari' }, { id: 2, name: 'Februari' }, { id: 3, name: 'Maret' },
  { id: 4, name: 'April' }, { id: 5, name: 'Mei' }, { id: 6, name: 'Juni' },
  { id: 7, name: 'Juli' }, { id: 8, name: 'Agustus' }, { id: 9, name: 'September' },
  { id: 10, name: 'Oktober' }, { id: 11, name: 'November' }, { id: 12, name: 'Desember' }
];

// List 5 tahun terakhir
const years = Array.from({ length: 5 }, (_, i) => new Date().getFullYear() - i);

const isDownloading = ref(false); // State loading baru

const handleDownloadReport = async () => {
  if (isDownloading.value) return; // Cegah eksekusi jika sedang download
  
  isDownloading.value = true;
  try {
    const response = await useApi(`export/monitoring-all`, {
      method: 'GET',
      params: { 
        month: downloadMonth.value, // Gunakan nilai dari modal, bukan route query agar sinkron
        year: downloadYear.value 
      },
      responseType: 'blob' 
    })

    const url = window.URL.createObjectURL(response)
    const link = document.createElement('a')
    link.href = url
    link.setAttribute('download', `Laporan_Monitoring_${downloadMonth.value}_${downloadYear.value}.xlsx`)
    document.body.appendChild(link)
    link.click()
    
    document.body.removeChild(link)
    window.URL.revokeObjectURL(url)
    
    // Tutup modal setelah berhasil
    isDownloadModalOpen.value = false;
  } catch (error) {
     console.error("Gagal mengunduh laporan:", error);
     alert("Gagal mengunduh laporan. Silakan coba lagi.");
  } finally {
     isDownloading.value = false; // Matikan loading apa pun hasilnya
  }
};

const openDownloadModal = () => {
  isDownloadModalOpen.value = true;
};

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

const toggleSidebar = () => {
  isSidebarCollapsed.value = !isSidebarCollapsed.value;
  if (isSidebarCollapsed.value) {
    openSubmenu.value = '';
  }
};

const toggleMobileMenu = () => {
  isMobileMenuOpen.value = !isMobileMenuOpen.value;
};

const closeMobileMenu = () => {
  isMobileMenuOpen.value = false;
};
const gotoLanding = () => {
  window.location.href = '/'
}

const toggleSubmenu = (itemName) => {
  if (isSidebarCollapsed.value) return;
  openSubmenu.value = openSubmenu.value === itemName ? '' : itemName;
};

const isActiveParent = (item) => {
  if (!item.children) return false;
  return item.children.some(child => route.path === child.url);
};

const checkActiveRoute = () => {
  if (isSidebarCollapsed.value) return;
  menuItems.forEach(item => {
    if (isActiveParent(item)) {
      openSubmenu.value = item.name;
    }
  });
};
const handleLogout = () => {
  localStorage.removeItem('status_login')
  localStorage.removeItem('user_info')
  navigateTo('/login')
}

onMounted(() => {
  checkActiveRoute();
});

watch(() => route.path, () => {
  checkActiveRoute();
  closeMobileMenu(); // Tutup mobile menu saat navigasi
});
</script>

<template>
  <Teleport to="body">
  <transition 
    enter-active-class="transition duration-300 ease-out"
    enter-from-class="opacity-0 scale-95"
    enter-to-class="opacity-100 scale-100"
    leave-active-class="transition duration-200 ease-in"
    leave-from-class="opacity-100 scale-100"
    leave-to-class="opacity-0 scale-95"
  >
    <div v-if="isDownloadModalOpen" class="fixed inset-0 z-[999] flex items-center justify-center p-4 bg-blue-950/40 backdrop-blur-md">
      <div class="w-full max-w-sm overflow-hidden rounded-[2.5rem] bg-white shadow-2xl border border-gray-100">
        
        <div class="bg-blue-900 p-8 text-white text-center">
          <div class="bg-white/10 w-16 h-16 rounded-3xl flex items-center justify-center mx-auto mb-4 border border-white/20">
            <svg class="w-8 h-8 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
          </div>
          <h3 class="text-xl font-black italic uppercase tracking-tighter">Export Report</h3>
          <p class="text-blue-200 text-xs font-medium opacity-80 mt-1">Pilih Periode Laporan</p>
        </div>

        <div class="p-8 space-y-6">
          <div class="grid grid-cols-2 gap-4">
            <div class="space-y-1.5">
              <label class="text-[10px] font-black uppercase text-gray-400 ml-1 tracking-widest">Bulan</label>
              <select v-model="downloadMonth" class="w-full rounded-2xl border-2 border-gray-50 bg-gray-50 px-4 py-3 text-sm font-bold text-gray-700 outline-none focus:border-blue-500 transition-all appearance-none cursor-pointer">
                <option v-for="m in months" :key="m.id" :value="m.id">{{ m.name }}</option>
              </select>
            </div>
            
            <div class="space-y-1.5">
              <label class="text-[10px] font-black uppercase text-gray-400 ml-1 tracking-widest">Tahun</label>
              <select v-model="downloadYear" class="w-full rounded-2xl border-2 border-gray-50 bg-gray-50 px-4 py-3 text-sm font-bold text-gray-700 outline-none focus:border-blue-500 transition-all appearance-none cursor-pointer">
                <option v-for="y in years" :key="y" :value="y">{{ y }}</option>
              </select>
            </div>
          </div>

          <div class="space-y-3 pt-2">
<button 
  @click="handleDownloadReport" 
  :disabled="isDownloading"
  class="w-full py-4 rounded-2xl bg-blue-900 text-white text-sm font-black uppercase tracking-widest shadow-xl shadow-blue-900/20 hover:bg-blue-800 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3 disabled:opacity-70 disabled:cursor-not-allowed disabled:hover:scale-100"
>
  <svg v-if="isDownloading" class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
  </svg>
  
  <span>{{ isDownloading ? 'Memproses...' : 'Unduh Sekarang' }}</span>
</button>

<button 
  @click="isDownloadModalOpen = false" 
  :disabled="isDownloading"
  class="w-full text-xs font-bold text-gray-400 hover:text-gray-600 transition-colors py-2 disabled:opacity-30"
>
  Batal
</button>
          </div>
        </div>

      </div>
    </div>
  </transition>
</Teleport>
  <div>
    <!-- Mobile Toggle Button (Fixed) -->
    <button @click="toggleMobileMenu"
      class="fixed top-10 right-4 z-50 flex h-12 w-12 items-center justify-center rounded-xl bg-blue-900 text-white shadow-lg transition-all duration-200 hover:scale-110 hover:shadow-xl md:hidden"
      :title="isMobileMenuOpen ? 'Close Menu' : 'Open Menu'">
      <svg class="h-6 w-6 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"
        stroke-width="2">
        <path v-if="!isMobileMenuOpen" stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
        <path v-else stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>

    <!-- Mobile Overlay -->
    <transition enter-active-class="transition-opacity duration-300" enter-from-class="opacity-0"
      enter-to-class="opacity-100" leave-active-class="transition-opacity duration-200" leave-from-class="opacity-100"
      leave-to-class="opacity-0">
      <div v-show="isMobileMenuOpen" @click="closeMobileMenu" class="fixed inset-0 z-40 bg-black/50 md:hidden"></div>
    </transition>

    <!-- Sidebar -->
    <transition enter-active-class="transition-transform duration-300 ease-out" enter-from-class="-translate-x-full"
      enter-to-class="translate-x-0" leave-active-class="transition-transform duration-200 ease-in"
      leave-from-class="translate-x-0" leave-to-class="-translate-x-full">
      <div v-show="isMobileMenuOpen" :class="[
        'fixed inset-y-0 left-0 z-40 w-72 flex flex-col bg-gradient-to-b from-blue-900 to-blue-950 text-white shadow-2xl md:hidden'
      ]">
        <!-- Header -->
        <div class="border-b border-white/10 p-6 pt-8">
          <div class="flex items-center space-x-3">
            <div class="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-xl bg-white shadow-lg">
              <img src="/logo_triputra.png" alt="Triputra Logo" class="h-8 w-8 object-contain" />
            </div>

            <div class="overflow-hidden transition-all duration-300">
              <h1 class="whitespace-nowrap text-xl font-bold leading-tight">
                Water<br>Management
              </h1>
              <p class="mt-0.5 text-xs font-medium text-blue-200">Dashboard</p>
            </div>
          </div>
        </div>

        <!-- Navigation -->
        <nav
          class="flex-1 space-y-1.5 overflow-y-auto px-3 py-4 scrollbar-thin scrollbar-thumb-blue-700 scrollbar-track-transparent">
          <template v-for="item in menuItems" :key="item.name">

            <!-- Menu with Submenu -->
            <div v-if="item.children">
              <button @click="toggleSubmenu(item.name)" :class="[
                'group relative flex w-full items-center justify-between rounded-xl px-3 py-3 font-medium transition-all duration-200',
                isActiveParent(item) || openSubmenu === item.name
                  ? 'bg-white/10 text-white shadow-lg'
                  : 'text-blue-100 hover:bg-white/5 hover:text-white'
              ]">
                <div v-if="isActiveParent(item)"
                  class="absolute left-0 top-1/2 h-8 w-1 -translate-y-1/2 rounded-r-full bg-white shadow-lg"></div>

                <div class="flex items-center space-x-3">
                  <svg class="h-5 w-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="item.iconPath"></path>
                  </svg>
                  <span class="text-sm">{{ item.name }}</span>
                </div>

                <svg class="h-4 w-4 transition-transform duration-200"
                  :class="openSubmenu === item.name ? 'rotate-180' : ''" fill="none" stroke="currentColor"
                  viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
              </button>

              <transition enter-active-class="transition-all duration-300 ease-out" enter-from-class="opacity-0 max-h-0"
                enter-to-class="opacity-100 max-h-96" leave-active-class="transition-all duration-200 ease-in"
                leave-from-class="opacity-100 max-h-96" leave-to-class="opacity-0 max-h-0">
                <div v-show="openSubmenu === item.name"
                  class="ml-3 mt-1.5 space-y-1 overflow-hidden border-l-2 border-blue-700/50 pl-3">
                  <NuxtLink v-for="child in item.children" :key="child.name" :to="child.url" :class="[
                    'flex items-center rounded-lg px-3 py-2.5 text-sm font-medium transition-all duration-200',
                    route.path === child.url
                      ? 'bg-blue-800 text-white shadow-md'
                      : 'text-blue-200 hover:bg-blue-800/50 hover:text-white'
                  ]">
                    <span class="mr-2.5 h-1.5 w-1.5 flex-shrink-0 rounded-full"
                      :class="route.path === child.url ? 'bg-white' : 'bg-blue-400'"></span>
                    {{ child.name }}
                  </NuxtLink>
                </div>
              </transition>
            </div>

            <!-- Regular Menu Item -->
            <NuxtLink v-else :to="item.url" :class="[
              'group relative flex items-center space-x-3 rounded-xl px-3 py-3 font-medium transition-all duration-200',
              route.path === item.url
                ? 'bg-white/10 text-white shadow-lg'
                : 'text-blue-100 hover:bg-white/5 hover:text-white'
            ]">
              <div v-if="route.path === item.url"
                class="absolute left-0 top-1/2 h-8 w-1 -translate-y-1/2 rounded-r-full bg-white shadow-lg"></div>

              <svg class="h-5 w-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="item.iconPath"></path>
              </svg>
              <span class="text-sm">{{ item.name }}</span>
            </NuxtLink>

          </template>
        </nav>
   <div 
  @click="openDownloadModal" 
  class="group flex cursor-pointer items-center space-x-3 rounded-xl px-3 py-3 font-medium text-blue-100 transition-all duration-200 hover:bg-white/5 hover:text-white"
>
  <svg class="h-5 w-5 flex-shrink-0 text-blue-300 transition-colors group-hover:text-emerald-400" 
    fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
  </svg>
  
  <span class="text-sm">Unduh Laporan</span>
</div>
        <!-- Footer -->
        <div class="border-t border-white/10 p-4">
          <div class="space-y-3">
            <div class="rounded-xl bg-gradient-to-br from-blue-800/50 to-blue-900/50 p-3.5 backdrop-blur-sm">
                <div class="flex justify-between ">
                <div class="flex items-center space-x-3 cursor-pointer" @click="gotoLanding">
<div class="bg-white p-1 rounded-lg">
                  <img src="/logo-tap.jpeg" alt="Triputra Logo" class="h-8 w-8 flex-shrink-0 object-contain" />
                  </div>                  <div class="min-w-0 flex-1">
                    <p class="truncate text-xs font-bold text-white">TRIPUTRA AGRO <br> PERSADA</p>
                    <p class="truncate text-[10px] text-blue-200">PT. Etam Bersama Lestari</p>
                  </div>
                </div>
                <div>
                  <button @click="handleLogout"
                    class="flex items-center gap-2 py-2 px-3  bg-white backdrop-blur-sm border   rounded-xl  shadow-sm group cursor-pointer">
                    <UIcon name="i-heroicons-arrow-right-on-rectangle" class="w-5 h-5 text-red-600 hover:text-black transition-all  " />
                  </button>
                </div>
              </div>
            </div>
            <p class="text-center text-[10px] text-blue-300/60">
              © 2025 • All Rights Reserved
            </p>
          </div>
        </div>
      </div>
    </transition>

    <div :class="[
      'relative hidden md:flex h-screen flex-col bg-gradient-to-b from-blue-900 to-blue-950 text-white transition-all duration-300 shadow-2xl',
      isSidebarCollapsed ? 'w-20' : 'w-72'
    ]">
      <button @click="toggleSidebar"
        class="absolute -right-2 z-50 flex h-12 w-12 items-center justify-center rounded-xl bg-white text-blue-900 shadow-lg transition-all duration-200 hover:scale-110 hover:shadow-xl"
        :class="isSidebarCollapsed ? 'top-2 left-4' : 'top-8'"
        :title="isSidebarCollapsed ? 'Expand Sidebar' : 'Collapse Sidebar'">
        <svg class="h-4 w-4 transition-transform duration-300" :class="isSidebarCollapsed ? 'rotate-180' : ''"
          fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2.5">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
        </svg>
      </button>

      <!-- Header -->
      <div class="border-b border-white/10 p-6 pt-8">
        <div v-show="!isSidebarCollapsed" class="flex items-center space-x-3">
          <div class="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-xl bg-white shadow-lg">
            <img src="/logo_triputra.png" alt="Triputra Logo" class="h-8 w-8 object-contain" />
          </div>

          <div class="overflow-hidden transition-all duration-300">
            <h1 class="whitespace-nowrap text-xl font-bold leading-tight">
              Water<br>Management
            </h1>
            <p class="mt-0.5 text-xs font-medium text-blue-200">Dashboard</p>
          </div>
        </div>

        <div v-show="isSidebarCollapsed" class="flex justify-center">
        </div>
      </div>

      <!-- Navigation -->
      <nav
        class="flex-1 space-y-1.5 overflow-y-auto px-3 py-4 scrollbar-thin scrollbar-thumb-blue-700 scrollbar-track-transparent">
        <template v-for="item in menuItems" :key="item.name">

          <!-- Menu with Submenu -->
          <div v-if="item.children">
            <button @click="toggleSubmenu(item.name)" :class="[
              'group relative flex w-full items-center rounded-xl px-3 py-3 font-medium transition-all duration-200',
              isSidebarCollapsed ? 'justify-center' : 'justify-between',
              isActiveParent(item) || openSubmenu === item.name
                ? 'bg-white/10 text-white shadow-lg'
                : 'text-blue-100 hover:bg-white/5 hover:text-white'
            ]" :title="isSidebarCollapsed ? item.name : ''">
              <div v-if="isActiveParent(item) && !isSidebarCollapsed"
                class="absolute left-0 top-1/2 h-8 w-1 -translate-y-1/2 rounded-r-full bg-white shadow-lg"></div>

              <div class="flex items-center" :class="isSidebarCollapsed ? '' : 'space-x-3'">
                <svg class="h-5 w-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="item.iconPath"></path>
                </svg>
                <span v-show="!isSidebarCollapsed" class="text-sm">{{ item.name }}</span>
              </div>

              <svg v-show="!isSidebarCollapsed" class="h-4 w-4 transition-transform duration-200"
                :class="openSubmenu === item.name ? 'rotate-180' : ''" fill="none" stroke="currentColor"
                viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>

            <transition enter-active-class="transition-all duration-300 ease-out" enter-from-class="opacity-0 max-h-0"
              enter-to-class="opacity-100 max-h-96" leave-active-class="transition-all duration-200 ease-in"
              leave-from-class="opacity-100 max-h-96" leave-to-class="opacity-0 max-h-0">
              <div v-show="openSubmenu === item.name && !isSidebarCollapsed"
                class="ml-3 mt-1.5 space-y-1 overflow-hidden border-l-2 border-blue-700/50 pl-3">
                <NuxtLink v-for="child in item.children" :key="child.name" :to="child.url" :class="[
                  'flex items-center rounded-lg px-3 py-2.5 text-sm font-medium transition-all duration-200',
                  route.path === child.url
                    ? 'bg-blue-800 text-white shadow-md'
                    : 'text-blue-200 hover:bg-blue-800/50 hover:text-white'
                ]">
                  <span class="mr-2.5 h-1.5 w-1.5 flex-shrink-0 rounded-full"
                    :class="route.path === child.url ? 'bg-white' : 'bg-blue-400'"></span>
                  {{ child.name }}
                </NuxtLink>
              </div>
            </transition>
          </div>

          <!-- Regular Menu Item -->
          <NuxtLink v-else :to="item.url" :class="[
            'group relative flex items-center rounded-xl px-3 py-3 font-medium transition-all duration-200',
            isSidebarCollapsed ? 'justify-center' : 'space-x-3',
            route.path === item.url
              ? 'bg-white/10 text-white shadow-lg'
              : 'text-blue-100 hover:bg-white/5 hover:text-white'
          ]" :title="isSidebarCollapsed ? item.name : ''">
            <div v-if="route.path === item.url && !isSidebarCollapsed"
              class="absolute left-0 top-1/2 h-8 w-1 -translate-y-1/2 rounded-r-full bg-white shadow-lg"></div>

            <svg class="h-5 w-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="item.iconPath"></path>
            </svg>
            <span v-show="!isSidebarCollapsed" class="text-sm">{{ item.name }}</span>
          </NuxtLink>

        </template>
      </nav>
     <div 
  @click="openDownloadModal" 
  class="group flex cursor-pointer items-center space-x-3 rounded-xl px-3 py-3 font-medium text-blue-100 transition-all duration-200 hover:bg-white/5 hover:text-white"
>
  <svg class="h-5 w-5 flex-shrink-0 text-blue-300 transition-colors group-hover:text-emerald-400" 
    fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
  </svg>
  
  <span class="text-sm">Unduh Laporan</span>
</div>
      <!-- Footer -->
      <div class="border-t border-white/10 p-4">
        <transition enter-active-class="transition-all duration-300" enter-from-class="opacity-0 scale-95"
          enter-to-class="opacity-100 scale-100" leave-active-class="transition-all duration-200"
          leave-from-class="opacity-100 scale-100" leave-to-class="opacity-0 scale-95">
          <div v-show="!isSidebarCollapsed" class="space-y-3">
            <div class="rounded-xl bg-gradient-to-br from-blue-800/50 to-blue-900/50 p-3.5 backdrop-blur-sm">
              <div class="flex justify-between ">
                <div class="flex items-center space-x-3 cursor-pointer" @click="gotoLanding">
                  <div class="bg-white p-1 rounded-lg">
                  <img src="/logo-tap.jpeg" alt="Triputra Logo" class="h-8 w-8 flex-shrink-0 object-contain" />
                  </div>
                  <div class="min-w-0 flex-1">
                    <p class="truncate text-xs font-bold text-white">TRIPUTRA AGRO <br> PERSADA</p>
                    <p class="truncate text-[10px] text-blue-200">PT. Etam Bersama Lestari</p>
                  </div>
                </div>
                <div>
                  <button @click="handleLogout"
                    class="flex items-center gap-2 py-2 px-3  bg-white backdrop-blur-sm border   rounded-xl  shadow-sm group cursor-pointer">
                    <UIcon name="i-heroicons-arrow-right-on-rectangle" class="w-5 h-5 text-red-600 hover:text-black transition-all  " />
                  </button>
                </div>
              </div>
            </div>
            <p class="text-center text-[10px] text-blue-300/60">
              © 2025 • All Rights Reserved
            </p>
          </div>
        </transition>

        <div v-show="isSidebarCollapsed" class="flex justify-center">
          <img src="/logo_triputra.png" alt="Triputra Logo" class="h-8 w-8 object-contain opacity-50" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.scrollbar-thin::-webkit-scrollbar {
  width: 4px;
}

.scrollbar-thin::-webkit-scrollbar-track {
  background: transparent;
}

.scrollbar-thin::-webkit-scrollbar-thumb {
  background: rgba(29, 78, 216, 0.5);
  border-radius: 10px;
}

.scrollbar-thin::-webkit-scrollbar-thumb:hover {
  background: rgba(29, 78, 216, 0.7);
}
</style>