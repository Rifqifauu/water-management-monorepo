<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>

<script setup>
const config = useRuntimeConfig()

provide('apiUrl', config.public.apiUrl)
provide('storageUrl', config.public.storageUrl)

// Konfigurasi SEO
useSeoMeta({
  title: 'WM Monitoring ',
  ogTitle: 'WM Monitoring Dashboard',
  description: 'Sistem pemantauan kondisi air dan infrastruktur blok secara real-time.',
  ogDescription: 'Monitor status Baik, Sedang, dan Buruk dari setiap blok dan afdeling dalam satu dashboard.',
  ogImage: '/og-image.jpg', // Simpan di folder public
  twitterCard: 'summary_large_image',
})

useHead({
  htmlAttrs: {
    lang: 'id'
  },
  link: [
    {
      rel: 'icon',
      type: 'image/png',
      href: '/favicon.png' // Simpan di folder public
    }
  ]
})
</script>