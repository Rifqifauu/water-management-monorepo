<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>

<script setup>
// 1. Ambil config menggunakan composable Nuxt
const config = useRuntimeConfig()

// 2. Gunakan 'provide' untuk menurunkan data ke komponen di bawahnya
provide('apiUrl', config.public.apiUrl)
provide('storageUrl', config.public.storageUrl)
</script>