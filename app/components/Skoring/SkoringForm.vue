<template>
  <div class="form-card">
    <div class="form-header">
      <h3>Input Data Kondisi</h3>
    </div>

    <form @submit.prevent="addToQueue">
      <div class="form-grid">
        
        <div class="form-group full-width">
          <label>Unit Penilaian <span class="text-red">*</span></label>
          <select 
            v-model="form.unit" 
            :class="{ 'border-red': errors.unit }"
            class="form-select"
          >
            <option value="" disabled selected>-- Pilih Unit Penilaian --</option>
            <option value="Genangan">Genangan</option>
            <option value="Parit">Parit</option>
            <option value="Infrastruktur">Infrastruktur</option>
            <option value="Water Level">Water Level</option>
          </select>
          <span v-if="errors.unit" class="error-msg">{{ errors.unit }}</span>
        </div>

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
              placeholder="0.00"
              :class="{ 'border-red': errors.min_value }"
            />
          </div>

          <div class="form-group">
            <label>Max Value</label>
            <input 
              v-model="form.max_value" 
              type="number" 
              step="0.01" 
              placeholder="100.00"
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
          <textarea v-model="form.keterangan" rows="2" placeholder="Tambahkan catatan jika perlu..."></textarea>
        </div>

        <div class="form-actions-inline full-width">
          <button type="submit" class="btn-add">
            + Tambah ke Antrean
          </button>
        </div>
      </div>
    </form>

    <hr class="divider">

    <div class="queue-section">
      <div class="queue-header">
        <h3>Daftar Antrean</h3>
        <span class="badge">{{ queue.length }} Item</span>
      </div>
      
      <div v-if="queue.length === 0" class="empty-state">
        <p>Belum ada data di antrean. Silakan isi form di atas.</p>
      </div>

      <div v-else class="table-responsive">
        <table class="queue-table">
          <thead>
            <tr>
              <th>Unit</th>
              <th>Parameter</th>
              <th>Kondisi</th>
              <th>Skor</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in queue" :key="index">
              <td class="font-bold">{{ item.unit }}</td>
              <td>{{ item.kategori_parameter }}</td>
              <td>
                <span v-if="item.label_kondisi" class="label-badge">{{ item.label_kondisi }}</span>
                <span v-else class="range-text">
                  {{ item.min_value ?? 0 }} - {{ item.max_value ?? '∞' }}
                </span>
              </td>
              <td class="text-center">{{ item.skor }}</td>
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

    <div class="final-actions">
      <div class="progress-container">
        <span v-if="isLoading" class="progress-text">
          <span class="spinner">⏳</span> {{ progressText }}
        </span>
      </div>

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

const emit = defineEmits(['close', 'success'])

const isLoading = ref(false)
const progressText = ref('')
const errors = ref({}) 
const inputType = ref('label')
const queue = ref([])

const defaultForm = {
  unit: '',
  kategori_parameter: '', 
  label_kondisi: '',
  min_value: null,
  max_value: null,
  skor: '',
  keterangan: ''
}

const form = ref({ ...defaultForm })

const validateLocal = () => {
  const err = {}
  if (!form.value.unit) err.unit = 'Unit wajib dipilih'
  if (!form.value.kategori_parameter) err.kategori_parameter = 'Kategori wajib diisi'
  if (!form.value.skor) err.skor = 'Skor wajib diisi'
  
  if (inputType.value === 'label' && !form.value.label_kondisi) {
    err.label_kondisi = 'Label kondisi wajib diisi'
  }
  
  errors.value = err
  return Object.keys(err).length === 0
}

const addToQueue = () => {
  if (!validateLocal()) return

  const payload = { ...form.value }
  
  if (inputType.value === 'label') {
      payload.min_value = null
      payload.max_value = null
  } else {
      payload.label_kondisi = null
  }

  queue.value.push(payload)

  // Reset form kecuali unit & kategori untuk mempermudah input berulang
  form.value.label_kondisi = ''
  form.value.min_value = null
  form.value.max_value = null
  form.value.skor = ''
  form.value.keterangan = ''
  errors.value = {}
}

const removeFromQueue = (index) => {
  queue.value.splice(index, 1)
}

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
.form-card {
  background: #ffffff;
  width: 100%;
  max-width: 800px;
  margin: auto;
  padding: 24px;
  border-radius: 12px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
  font-family: 'Inter', sans-serif;
}

.form-header h3 {
  margin: 0 0 20px 0;
  color: #1a1a1a;
  font-size: 1.4rem;
  border-left: 5px solid #2196F3;
  padding-left: 15px;
}

.form-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 18px;
}

.full-width { grid-column: span 2; }

.form-group { display: flex; flex-direction: column; }

.form-group label {
  font-size: 0.85rem;
  font-weight: 600;
  color: #4b5563;
  margin-bottom: 6px;
}

.form-group input, 
.form-group select, 
.form-group textarea {
  padding: 10px 14px;
  border: 1px solid #d1d5db;
  border-radius: 8px;
  font-size: 0.95rem;
  transition: border-color 0.2s, box-shadow 0.2s;
}

.form-group input:focus, .form-group select:focus {
  border-color: #2196F3;
  box-shadow: 0 0 0 4px rgba(33, 150, 243, 0.1);
  outline: none;
}

.radio-group {
  display: flex;
  gap: 25px;
  padding: 8px 0;
}

.radio-label {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  font-weight: 500;
  color: #374151;
}

.error-msg { color: #dc2626; font-size: 0.75rem; margin-top: 4px; }
.border-red { border-color: #dc2626 !important; }
.text-red { color: #dc2626; }

.btn-add {
  background: #2196F3;
  color: white;
  border: none;
  padding: 12px 24px;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s;
}

.btn-add:hover { background: #1976D2; }

.divider { margin: 30px 0; border: 0; border-top: 2px solid #f3f4f6; }

.queue-header {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 15px;
}

.badge {
  background: #e0f2fe;
  color: #0369a1;
  padding: 4px 12px;
  border-radius: 99px;
  font-size: 0.8rem;
  font-weight: bold;
}

.table-responsive {
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  overflow: hidden;
}

.queue-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 0.9rem;
}

.queue-table th {
  background: #f9fafb;
  padding: 12px;
  text-align: left;
  color: #6b7280;
  border-bottom: 1px solid #e5e7eb;
}

.queue-table td { padding: 12px; border-bottom: 1px solid #f3f4f6; }

.label-badge {
  background: #f3f4f6;
  padding: 2px 8px;
  border-radius: 4px;
  font-size: 0.8rem;
}

.btn-delete-sm {
  background: transparent;
  color: #ef4444;
  border: 1px solid #ef4444;
  padding: 4px 10px;
  border-radius: 6px;
  cursor: pointer;
}

.btn-delete-sm:hover { background: #fee2e2; }

.final-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 30px;
}

.btn-save {
  background: #10b981;
  color: white;
  padding: 12px 24px;
  border-radius: 8px;
  border: none;
  font-weight: 600;
  cursor: pointer;
}

.btn-save:disabled { background: #d1d5db; }

.btn-cancel {
  background: white;
  border: 1px solid #d1d5db;
  padding: 12px 24px;
  border-radius: 8px;
  cursor: pointer;
}

.spinner { display: inline-block; animation: rotate 2s linear infinite; }
@keyframes rotate { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
</style>