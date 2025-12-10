<template>
  <div class="form-card">
    <div class="form-header">
      <h3>Input Data Kondisi</h3>
    </div>

    <form @submit.prevent="addToQueue">
      <div class="form-grid">
        
        <div class="form-group full-width">
          <label>Kategori Parameter <span class="text-red">*</span></label>
          <input 
            v-model="form.kategori_parameter" 
            type="text" 
            placeholder="Contoh: kedalaman_parit" 
            :class="{ 'border-red': errors.kategori_parameter }"
          />
          <span v-if="errors.kategori_parameter" class="error-msg">{{ errors.kategori_parameter }}</span>
        </div>

        <div class="form-group full-width">
          <label>Tipe Kondisi</label>
          <div class="radio-group">
            <label class="radio-label">
              <input type="radio" v-model="inputType" value="label"> Label (Teks)
            </label>
            <label class="radio-label">
              <input type="radio" v-model="inputType" value="range"> Range (Angka)
            </label>
          </div>
        </div>

        <div v-if="inputType === 'label'" class="form-group full-width">
          <label>Label Kondisi <span class="text-red">*</span></label>
          <input 
            v-model="form.label_kondisi" 
            type="text" 
            placeholder="Contoh: Baik, Buruk" 
            :class="{ 'border-red': errors.label_kondisi }"
          />
          <span v-if="errors.label_kondisi" class="error-msg">{{ errors.label_kondisi }}</span>
        </div>

        <template v-if="inputType === 'range'">
          <div class="form-group">
            <label>Min Value</label>
            <input 
              v-model="form.min_value" 
              type="number" 
              step="0.01" 
              :class="{ 'border-red': errors.min_value }"
            />
          </div>

          <div class="form-group">
            <label>Max Value</label>
            <input 
              v-model="form.max_value" 
              type="number" 
              step="0.01" 
              :class="{ 'border-red': errors.max_value }"
            />
          </div>
        </template>

        <div class="form-group">
          <label>Skor <span class="text-red">*</span></label>
          <input 
            v-model="form.skor" 
            type="number" 
            placeholder="Contoh: 10"
            :class="{ 'border-red': errors.skor }"
          />
          <span v-if="errors.skor" class="error-msg">{{ errors.skor }}</span>
        </div>

        <div class="form-group full-width">
          <label>Keterangan</label>
          <textarea v-model="form.keterangan" rows="2"></textarea>
        </div>

        <div class="form-actions full-width" style="justify-content: flex-start;">
          <button type="submit" class="btn-add">
            + Tambah ke Antrean
          </button>
        </div>

      </div>
    </form>

    <hr class="divider">

    <div class="queue-section">
      <h3>Daftar Antrean  ({{ queue.length }} item)</h3>
      
      <div v-if="queue.length === 0" class="empty-state">
        Belum ada data di antrean. Silakan input di atas.
      </div>

      <div v-else class="table-responsive">
        <table class="queue-table">
          <thead>
            <tr>
              <th>Kondisi</th>
              <th>Skor</th>
              <th>Keterangan</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in queue" :key="index">
              <td>
                <span v-if="item.label_kondisi">{{ item.label_kondisi }}</span>
                <span v-else>
                  {{ item.min_value ?? '...' }} - {{ item.max_value ?? '...' }}
                </span>
              </td>
              <td>{{ item.skor }}</td>
              <td>{{ item.keterangan }}</td>
              <td>
                <button @click="removeFromQueue(index)" class="btn-delete-sm" type="button" :disabled="isLoading">
                  Hapus
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="form-actions final-actions">
      <span v-if="isLoading" class="progress-text">
        <span class="spinner">⏳</span> {{ progressText }}
      </span>

      <div class="right-buttons">
        <button type="button" class="btn-cancel" @click="$emit('close')" :disabled="isLoading">
          Tutup
        </button>
        <button 
          type="button" 
          class="btn-save" 
          :disabled="isLoading || queue.length === 0"
          @click="handleBatchSubmit"
        >
          {{ isLoading ? 'Memproses...' : 'Simpan Semua (' + queue.length + ')' }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// Asumsi useApi sudah tersedia global atau di-import dari composable
// import { useApi } from '@/composables/useApi' 

const emit = defineEmits(['close', 'success'])

const isLoading = ref(false)
const progressText = ref('') // Diangkat ke top-level scope agar reaktif di template
const errors = ref({}) 
const inputType = ref('label')

// ARRAY UTAMA PENAMPUNG DATA
const queue = ref([])

const defaultForm = {
  kategori_parameter: '', 
  label_kondisi: '',
  min_value: null,
  max_value: null,
  skor: '',
  keterangan: ''
}

const form = ref({ ...defaultForm })

// --- 1. VALIDASI LOKAL ---
const validateLocal = () => {
  const err = {}
  if (!form.value.kategori_parameter) err.kategori_parameter = 'Kategori wajib diisi'
  if (!form.value.skor) err.skor = 'Skor wajib diisi'
  
  if (inputType.value === 'label' && !form.value.label_kondisi) {
    err.label_kondisi = 'Label kondisi wajib diisi'
  }
  
  errors.value = err
  return Object.keys(err).length === 0
}

// --- 2. TAMBAH KE QUEUE ---
const addToQueue = () => {
  if (!validateLocal()) return

  const payload = { ...form.value }
  
  // Bersihkan data yang tidak relevan dengan tipe input
  if (inputType.value === 'label') {
      payload.min_value = null
      payload.max_value = null
  } else {
      payload.label_kondisi = null
  }

  queue.value.push(payload)

  // Reset Form (Keep Kategori agar input cepat)
  form.value.label_kondisi = ''
  form.value.min_value = null
  form.value.max_value = null
  form.value.skor = ''
  form.value.keterangan = ''
  
  errors.value = {}
}

// --- 3. HAPUS DARI QUEUE ---
const removeFromQueue = (index) => {
  queue.value.splice(index, 1)
}

// --- 4. KIRIM SEMUA KE SERVER (Fixed) ---
const handleBatchSubmit = async () => {
  if (queue.value.length === 0) return

  isLoading.value = true
  const totalItems = queue.value.length
  let successCount = 0
  let failCount = 0
  
  const failedItems = []

  // Loop Sequential
  for (const [index, item] of queue.value.entries()) {
    
    progressText.value = `Menyimpan ${index + 1} dari ${totalItems}...`

    try {
      // Pastikan 'useApi' sudah terdefinisi/diimport
      // Jika pakai axios biasa: await axios.post('/api/skoring', item)
      await useApi('skoring', { 
        method: 'POST',
        body: JSON.stringify(item)
      })

      successCount++

    } catch (error) {
      console.error(`Gagal menyimpan item index ${index}`, error)
      failCount++
      failedItems.push(item)
    }
  }

  isLoading.value = false
  progressText.value = ''

  if (failCount === 0) {
    // Sukses Semua
    queue.value = [] 
    emit('success')
    emit('close')
  } else {
    // Ada yang Gagal
    alert(`Proses Selesai.\nBerhasil: ${successCount}\nGagal: ${failCount}\n\nData yang gagal akan tetap ada di antrean untuk dicoba lagi.`)
    queue.value = failedItems 
  }
}
</script>

<style scoped>
/* Style sebelumnya tetap sama, tambahkan ini: */
.form-card { background: white; width: 100%; padding: 20px; }
.divider { margin: 20px 0; border: 0; border-top: 1px solid #eee; }
.btn-add { background-color: #2196F3; color: white; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer; margin-top: 10px; font-weight: 500; }
.queue-section { margin-bottom: 20px; }
.empty-state { text-align: center; color: #888; padding: 20px; background: #f9f9f9; border-radius: 4px; }
.table-responsive { overflow-x: auto; }
.queue-table { width: 100%; border-collapse: collapse; margin-top: 10px; font-size: 0.9rem; }
.queue-table th, .queue-table td { border: 1px solid #ddd; padding: 8px; text-align: left; }
.queue-table th { background-color: #f2f2f2; }
.btn-delete-sm { background-color: #ff5252; color: white; border: none; padding: 4px 8px; border-radius: 3px; cursor: pointer; font-size: 0.8rem; }
.btn-delete-sm:disabled { background-color: #ffcccc; cursor: not-allowed; }

/* Layout tombol bawah diperbaiki */
.final-actions { 
  border-top: 2px solid #eee; 
  padding-top: 20px; 
  display: flex; 
  justify-content: space-between; /* Pisahkan progress text dan tombol */
  align-items: center;
}

.right-buttons {
  display: flex;
  gap: 10px;
}

.progress-text {
  font-size: 0.9rem;
  color: #2196F3;
  font-weight: bold;
  display: flex;
  align-items: center;
  gap: 5px;
}

.spinner {
  animation: spin 1s infinite linear;
  display: inline-block;
}

@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
.full-width { grid-column: span 2; }
.form-group { display: flex; flex-direction: column; margin-bottom: 10px;}
.form-group input, .form-group textarea { padding: 8px; border: 1px solid #ccc; border-radius: 4px;}
.text-red { color: red; }
.error-msg { color: red; font-size: 0.8rem; }
.btn-save { background-color: #4CAF50; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; }
.btn-save:disabled { background-color: #ccc; cursor: not-allowed; }
.btn-cancel { background-color: #777; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;}
.btn-cancel:disabled { opacity: 0.7; cursor: not-allowed; }
.radio-group { display: flex; gap: 20px; }
.radio-label { display: flex; align-items: center; gap: 5px; cursor: pointer; }
</style>