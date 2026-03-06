<template>
  <div class="form-card">
    <form @submit.prevent="handleSubmit">
      <div class="form-grid">
        
        <div class="form-group">
          <label>Nama <span class="text-red">*</span></label>
          <input 
            v-model="form.nama" 
            type="text" 
            :class="{ 'border-red': errors.nama }"
          />
          <span v-if="errors.nama" class="error-msg">{{ errors.nama[0] }}</span>
        </div>

        <div class="form-group">
          <label>Jabatan <span class="text-red">*</span></label>
          <div class="relative">
            <select 
              v-model="form.jabatan" 
              :class="[
                'w-full p-2 border rounded-lg bg-white appearance-none', 
                errors.jabatan ? 'border-red-500' : 'border-gray-300'
              ]"
            >
              <option value="" disabled selected>Pilih Jabatan</option>
              <option v-for="option in jabatanOptions" :key="option" :value="option">
                {{ option }}
              </option>
            </select>
            
            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
              <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
              </svg>
            </div>
          </div>
          <span v-if="errors.jabatan" class="error-msg">{{ errors.jabatan[0] }}</span>
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
import { ref, watch, computed } from 'vue'

const jabatanOptions = [
  'Mandau Air', 
  'Mandor', 
  'Asisten', 
  'Lainnya'
];
const props = defineProps({
  editId: {
    type: [Number, String],
    default: null
  }
})

const emit = defineEmits(['close', 'success'])

const isLoading = ref(false)
const errors = ref({})

const defaultForm = {
  afdeling: '',  
  blok: '',
  luas_ha: null,
  latitude: null,
  longitude: null,
  batas_area: '' 
}

const form = ref({ ...defaultForm })

// --- 1. DEFINISIKAN FUNGSI LOAD DATA DULU (SUPAYA TIDAK ERROR) ---
const loadDetailData = async (id) => {
  try {
    isLoading.value = true
    console.log("2. Memanggil API untuk ID:", id)

    const response = await useApi(`karyawan/${id}`)
    
    console.log("3. RESPONSE ASLI DARI SERVER:", response)
    
    let data = null
    
    if (response.data && response.data.afdeling) {
      console.log("-> Struktur A: response.data")
      data = response.data
    } else if (response.data && response.data.data && response.data.data.afdeling) {
      console.log("-> Struktur B: response.data.data")
      data = response.data.data
    } else if (response.afdeling) {
      console.log("-> Struktur C: response langsung")
      data = response
    } else {
      console.log("-> ⚠️ Menggunakan fallback ke response.data")
      data = response.data || response
    }

    console.log("4. DATA FINAL:", data)

    form.value = {
      nama: data.nama || '',
      jabatan: data.jabatan || ''
    }

  } catch (error) {
    console.error("❌ ERROR SAAT LOAD DATA:", error)
    alert("Gagal memuat data (Cek Console)")
  } finally {
    isLoading.value = false
  }
}

// --- 2. BARU JALANKAN WATCHER DI BAWAHNYA ---
watch(() => props.editId, async (newId) => {
  console.log("1. WATCHER JALAN. ID:", newId)
  errors.value = {}
  
  if (newId) {
    await loadDetailData(newId) // Sekarang fungsi ini sudah dikenali
  } else {
    console.log("Mode Tambah: Reset Form")
    form.value = { ...defaultForm }
  }
}, { immediate: true })


// --- 3. HANDLE SUBMIT ---
const handleSubmit = async () => {
  isLoading.value = true
  errors.value = {} 

  try {
    let url = 'karyawan'
    let method = 'POST'
    
    if (props.editId) {
      url = `karyawan/${props.editId}`
      method = 'PUT' 
    }
    
    await useApi(url, {
      method: method,
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
/* Style tetap sama seperti sebelumnya */
.form-card {
  background: white;
  padding: 0; /* Padding dihilangkan karena sudah ada di Modal Body */
  /* box-shadow & border-radius bisa dihilangkan jika sudah dihandle modal */
  width: 100%;
}

.form-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
}
.full-width {
  grid-column: span 2;
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
.form-group input, .form-group textarea {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.border-red {
  border-color: red !important;
}
.text-red { color: red; }
.text-gray { color: #666; font-size: 0.8rem; margin-top: 2px;}
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

/* Responsif Mobile */
@media (max-width: 640px) {
  .form-grid {
    grid-template-columns: 1fr;
  }
  .full-width {
    grid-column: span 1;
  }
}
</style>