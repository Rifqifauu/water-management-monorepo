<template>
  <div class="form-card">
    <form @submit.prevent="handleSubmit">
      <div class="form-grid">  
        
        <div class="form-group">
          <label>ID Objek <span class="text-red">*</span></label>
          <input 
            v-model="form.id_object" 
            type="text" 
            placeholder="Contoh: WL 02, WL 01" 
            :class="{ 'border-red': errors.id_object }"
          />
          <span v-if="errors.id_object" class="error-msg">{{ errors.id_object[0] }}</span>
        </div>

        <div class="form-group">
          <label>Lokasi <span class="text-red">*</span></label>
          <SearchableSelect 
            :model-value="form.lokasi" 
            :options="lokasiOptions" 
            label-key="label" 
            value-key="value" 
            placeholder="Pilih Lokasi (Afdeling - Blok)" 
            :class="{ 'border-red': errors.lokasi }"
            @update:model-value="handleLokasiChange"
          />
          <span v-if="errors.lokasi" class="error-msg">{{ errors.lokasi[0] }}</span>
        </div>

        <div class="form-group">
          <label>Kategori <span class="text-red">*</span></label>
          <select 
            v-model="form.category" 
            :class="{ 'border-red': errors.category }"
          >
            <option value="">Pilih Kategori</option>
            <option value="NF">NF</option>
            <option value="JEMBATAN KAYU">JEMBATAN KAYU</option>
            <option value="PVC">PVC</option>
          </select>
          <span v-if="errors.category" class="error-msg">{{ errors.category[0] }}</span>
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
  id_object: '',
  lokasi: '',   // Akan menyimpan ID (Integer)
  category: ''
}

const form = ref({ ...defaultForm })

// --- FUNGSI BARU: Handle Perubahan Lokasi ---
// Memastikan kita mengambil ID-nya saja, meskipun component mengembalikan object
const handleLokasiChange = (selected) => {
  if (selected && typeof selected === 'object' && 'value' in selected) {
    form.value.lokasi = selected.value
  } else {
    form.value.lokasi = selected
  }
}

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
    const response = await useApi(`infrastructure-master/${id}`)
    
    // Normalisasi response data
    const data = response.data?.data || response.data || response

    // Logika mapping data dari backend ke form
    form.value = {
      id_object: data.id_object || '',
      // Cek berbagai kemungkinan nama field dari backend
      lokasi: data.id_lokasi || data.lokasi_id || data.lokasi || '', 
      category: data.category || ''
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
    const url = isEdit ? `infrastructure-master/${props.editId}` : 'infrastructure-master'
    const method = isEdit ? 'PUT' : 'POST'
    
    // --- PERBAIKAN PENTING DI SINI ---
    await useApi(url, {
      method: method,
      headers: {
        'Content-Type': 'application/json', // Wajib agar Laravel membaca JSON
        'Accept': 'application/json'
      },
      body: JSON.stringify(form.value) // Pastikan data di-stringify
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
.form-card {
  background: white;
  padding: 0;
  width: 100%;
}

.form-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
}

.form-group {
  display: flex;
  flex-direction: column;
}

.form-group label {
  font-weight: 600;
  margin-bottom: 5px;
  font-size: 0.9rem;
}

.form-group input, 
.form-group select {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  height: 40px; 
}

.border-red {
  border-color: red !important;
}

.text-red { color: red; }

.error-msg {
  color: red;
  font-size: 0.8rem;
  margin-top: 2px;
}

.form-actions {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.btn-save {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
}

.btn-cancel {
  background-color: #f44336;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
}

.btn-save:disabled {
  background-color: #ccc;
}

@media (max-width: 640px) {
  .form-grid {
    grid-template-columns: 1fr;
  }
}
</style>