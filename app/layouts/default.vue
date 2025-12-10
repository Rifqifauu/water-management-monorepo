<template>
  <div class="flex h-screen overflow-hidden bg-gray-100">

    <aside 
      class="bg-white border-r transition-[width] duration-300 ease-in-out "
      :class="isOpen ? 'w-full' : 'w-0 md:w-72'"
    >
      <div class="w-72 h-full overflow-y-auto">
        <Sidebar />
      </div>
    </aside>

    <main class="flex-1 bg-gray-50 flex flex-col h-full relative">
      <header class="">
        <button 
          @click="isOpen = !isOpen" 
          class="p-2 mr-4 rounded hover:bg-gray-100 md:hidden focus:outline-none"
        >
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path v-if="!isOpen" stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
            <path v-else stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
              </header>
      <div class="overflow-y-auto flex-1 ">
        <slot />
      </div>

    </main>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// State untuk mobile. Default false (tertutup) di mobile.
const isOpen = ref(false)
</script>