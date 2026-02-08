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
  id_lokasi: ''
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
      id_lokasi: data.id_lokasi || '' 
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