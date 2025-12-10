<template>
  <div class="form-card">
    <form @submit.prevent="handleSubmit">
      <div class="form-grid">
        
        <div class="form-group">
          <label>Afdeling <span class="text-red">*</span></label>
          <input 
            v-model="form.afdeling" 
            type="text" 
            placeholder="Contoh: I, II, III" 
            :class="{ 'border-red': errors.afdeling }"
          />
          <span v-if="errors.afdeling" class="error-msg">{{ errors.afdeling[0] }}</span>
        </div>

        <div class="form-group">
          <label>Blok <span class="text-red">*</span></label>
          <input 
            v-model="form.blok" 
            type="text" 
            placeholder="Contoh: A12"
            :class="{ 'border-red': errors.blok }"
          />
          <span v-if="errors.blok" class="error-msg">{{ errors.blok[0] }}</span>
        </div>

        <div class="form-group">
          <label>Luas (Ha)</label>
          <input 
            v-model="form.luas_ha" 
            type="number" 
            step="0.01" 
            placeholder="0.00"
          />
          <span v-if="errors.luas_ha" class="error-msg">{{ errors.luas_ha[0] }}</span>
        </div>

        <div class="form-group">
          <label>Latitude</label>
          <input 
            v-model="form.latitude" 
            type="number" 
            step="any" 
            placeholder="-7.xxxxx"
          />
        </div>

        <div class="form-group">
          <label>Longitude</label>
          <input 
            v-model="form.longitude" 
            type="number" 
            step="any" 
            placeholder="110.xxxxx"
          />
        </div>

        <div class="form-group full-width">
          <label>Batas Area (JSON)</label>
          <textarea 
            v-model="form.batas_area" 
            rows="3" 
            placeholder='[{"lat":..., "long":...}]'
          ></textarea>
          <small class="text-gray">Format harus valid JSON (opsional)</small>
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

    const response = await useApi(`lokasi/${id}`)
    
    // --- LOGGING UNTUK CEK STRUKTUR DATA ---
    console.log("3. RESPONSE ASLI DARI SERVER:", response)
    
    let data = null
    
    // Cek berbagai kemungkinan struktur response
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
      afdeling: data.afdeling || '',
      blok: data.blok || '',
      luas_ha: data.luas_ha,
      latitude: data.latitude,
      longitude: data.longitude,
      batas_area: typeof data.batas_area === 'object' 
        ? JSON.stringify(data.batas_area) 
        : (data.batas_area ?? '')
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
    let url = 'lokasi'
    let method = 'POST'
    
    if (props.editId) {
      url = `lokasi/${props.editId}`
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