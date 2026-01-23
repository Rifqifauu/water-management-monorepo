<template>
  <div class="flex h-screen overflow-hidden bg-gray-100">
    <Sidebar />

    <main class="flex-1 bg-gray-50 flex flex-col h-full relative">
      
      <div id="main-scroll-container" class="overflow-y-auto flex-1">
        <slot />
      </div>

    </main>
  </div>
</template>