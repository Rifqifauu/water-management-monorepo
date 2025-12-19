// composables/useLocation.ts
export const useLocation = () => {
  // Koordinat default: Kalimantan Timur (Area Industri Kayu)
  const defaultCoords = { lat: 1.252526, lng: 117.851787 };

  const savedCoords = import.meta.client ? localStorage.getItem('user_coords') : null
  
  // Jika tidak ada di localStorage, gunakan defaultCoords
  const coords = useState('global_coords', () => 
    savedCoords ? JSON.parse(savedCoords) : defaultCoords
  )
  
  const isLocating = useState('is_locating', () => false)

  const updateLocation = () => {
    if (!import.meta.client || !navigator.geolocation) return

    isLocating.value = true
    navigator.geolocation.getCurrentPosition(
      (pos: GeolocationPosition) => { // Tambahkan tipe untuk menghindari error 'any'
        const newCoords = {
          lat: pos.coords.latitude,
          lng: pos.coords.longitude
        }
        coords.value = newCoords
        localStorage.setItem('user_coords', JSON.stringify(newCoords))
        isLocating.value = false
      },
      (err) => {
        console.error("Gagal mengambil lokasi:", err)
        isLocating.value = false
      }
    )
  }

  return { coords, isLocating, updateLocation }
}