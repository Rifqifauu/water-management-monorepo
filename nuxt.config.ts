export default defineNuxtConfig({
  runtimeConfig: {
    public: {
      apiUrl: process.env.NUXT_PUBLIC_API_URL || 'http://localhost:8000',
      storageUrl: process.env.NUXT_PUBLIC_STORAGE_URL || 'http://localhost:8000/storage'
    }
  },
routeRules: {
    '/login': { ssr: false },
    

  },
  modules: ['@nuxt/ui'],
  css: ['~/assets/css/main.css'],
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },
  features: {
    inlineStyles: false
  }

})