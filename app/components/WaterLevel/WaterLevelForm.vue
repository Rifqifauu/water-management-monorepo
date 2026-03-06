<template>
  <div class="form-card">
    <form @submit.prevent="handleSubmit">
      <div class="form-grid">  
        <div class="form-group">
          <label>No WL <span class="text-red">*</span></label>
          <input 
            v-model="form.no_wl" 
            type="text" 
            placeholder="Contoh: WL 01" 
            :class="{ 'border-red': errors.no_wl }"
          />
          <span v-if="errors.no_wl" class="error-msg">{{ errors.no_wl[0] }}</span>
        </div>

        <div class="form-group">
          <label>Lokasi <span class="text-red">*</span></label>
          <SearchableSelect 
            v-model="form.id_lokasi" 
            :options="lokasiOptions" 
            label-key="label" 
            value-key="value" 
            placeholder="Pilih Lokasi (Afdeling - Blok)" 
            :class="{ 'border-red': errors.id_lokasi }"
          />
          <span v-if="errors.id_lokasi" class="error-msg">{{ errors.id_lokasi[0] }}</span>
        </div>
        <div class="form-group">
          <label>Latitude</label>
          <input v-model="form.latitude" type="text" placeholder="-6.123456" />
        </div>
        <div class="form-group">
          <label>Longitude</label>
          <input v-model="form.longitude" type="text" placeholder="106.123456" />
        </div>
      </div>
          <div class="mt-4 p-4 bg-gray-50 rounded-lg border border-dashed border-gray-300">
        <div class="flex flex-wrap items-center justify-between gap-4">
          <div class="flex items-center gap-2">
            <div class="bg-blue-600 p-1.5 rounded-full text-white">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </div>
            <span class="text-sm font-bold text-gray-700">Gunakan GPS Perangkat</span>
          </div>
          <button type="button" @click="getGeoLocation" class="text-xs bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
            Ambil Lokasi Saat Ini
          </button>
        </div>
      </div>
      <div class="form-actions">
        <button type="button" class="btn-cancel" @click="$emit('close')">
          Batal
        </button>
        <button type="submit" class="btn-save" :disabled="isLoading">
          {{ isLoading ? 'Menyimpan...' : 'Simpan Data' }}
        </button>
      </div>
    </form>
  </div>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue'
import Swal from 'sweetalert2'

const props = defineProps({
  editId: {
    type: [Number, String],
    default: null
  }
})

const emit = defineEmits(['close', 'success'])

const isLoading = ref(false)
const errors = ref({})
const lokasiOptions = ref([])

const defaultForm = {
  no_wl: '',
  id_lokasi: '',
  latitude:'',
  longitude:''

}

const form = ref({ ...defaultForm })

/**
 * Mengambil list lokasi untuk dropdown
 */
const fetchLokasi = async () => {
  try {
    const response = await useApi('/list/lokasi')
    const data = response.data || response
    
    lokasiOptions.value = data.map(item => ({
      value: item.id,
      label: `${item.afdeling} - ${item.blok}`
    }))
  } catch (error) {
    console.error("Gagal memuat list lokasi:", error)
  }
}
const getGeoLocation = () => {
  if (!navigator.geolocation) return Swal.fire('Error', 'GPS tidak didukung oleh browser Anda', 'error')
  
  Swal.fire({ 
    title: 'Mencari Koordinat...', 
    allowOutsideClick: false, 
    didOpen: () => Swal.showLoading() 
  })
  
  navigator.geolocation.getCurrentPosition(
    (pos) => {
      form.value.latitude = pos.coords.latitude.toFixed(8)
      form.value.longitude = pos.coords.longitude.toFixed(8)
      Swal.close()
      Swal.fire({ toast: true, position: 'top-end', icon: 'success', title: 'Lokasi berhasil diambil!', timer: 2000, showConfirmButton: false })
    }, 
    (err) => {
      Swal.close()
      Swal.fire('Gagal Ambil Lokasi', 'Pastikan izin lokasi aktif: ' + err.message, 'error')
    },
    { enableHighAccuracy: true }
  )
}

/**
 * Mengambil detail data saat mode Edit
 */
const loadDetailData = async (id) => {
  try {
    isLoading.value = true
    const response = await useApi(`water-level-master/${id}`)
    
    // Normalisasi response data
    const data = response.data?.data || response.data || response

    form.value = {
      no_wl: data.no_wl || '',
      id_lokasi: data.id_lokasi || '',
      latitude: data.latitude || null,
      longitude: data.longitude || null
    }
  } catch (error) {
    console.error("❌ ERROR SAAT LOAD DATA:", error)
    alert("Gagal memuat data detail")
  } finally {
    isLoading.value = false
  }
}

// Lifecycle hooks
onMounted(() => {
  fetchLokasi()
})

// Watcher untuk mendeteksi perubahan ID (Tambah vs Edit)
watch(() => props.editId, async (newId) => {
  errors.value = {}
  if (newId) {
    await loadDetailData(newId)
  } else {
    form.value = { ...defaultForm }
  }
}, { immediate: true })

/**
 * Handle Submit (Create & Update)
 */
const handleSubmit = async () => {
  isLoading.value = true
  errors.value = {} 

  try {
    const isEdit = !!props.editId
    const url = isEdit ? `water-level-master/${props.editId}` : 'water-level-master'
    const method = isEdit ? 'PUT' : 'POST'
    
    // PERBAIKAN DI SINI
    await useApi(url, {
      method: method,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify(form.value)
    })
    
    emit('success')
    emit('close')
  } catch (error) {
    if (error.status === 422 && error.errors) {
      errors.value = error.errors
    } else {
      alert(error.message || 'Terjadi kesalahan sistem')
    }
  } finally {
    isLoading.value = false
  }
}
</script>

<style scoped>
/* Style sama persis dengan form infrastruktur */
.form-card { background: white; padding: 0; width: 100%; }
.form-grid { display: grid; grid-template-columns: 1fr; gap: 15px; } /* 1 Kolom karena field sedikit */
.form-group { display: flex; flex-direction: column; }
.form-group label { font-weight: 600; margin-bottom: 5px; font-size: 0.9rem; }
.form-group input { padding: 8px; border: 1px solid #ccc; border-radius: 4px; height: 40px; }
.border-red { border-color: red !important; }
.text-red { color: red; }
.error-msg { color: red; font-size: 0.8rem; margin-top: 2px; }
.form-actions { margin-top: 20px; display: flex; justify-content: flex-end; gap: 10px; }
.btn-save { background-color: #4CAF50; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; }
.btn-cancel { background-color: #f44336; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; }
.btn-save:disabled { background-color: #ccc; }
</style>