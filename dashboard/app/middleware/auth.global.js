export default defineNuxtRouteMiddleware((to) => {
  // Hanya jalankan di browser
  if (process.client) {
    const isAuthenticated = localStorage.getItem('status_login') === 'true'

    // Proteksi halaman selain login
    if (!isAuthenticated && to.path !== '/login') {
      return navigateTo('/login')
    }

    // Jika sudah login, dilarang masuk ke halaman login lagi
    if (isAuthenticated && to.path === '/login') {
      return navigateTo('/')
    }
  }
})