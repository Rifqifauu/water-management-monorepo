<template>
  <div class="min-h-screen bg-gray-50 p-6 font-sans">
    <div class="max-w-7xl mx-auto">
      <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900 tracking-tight">Drainage Channel Calculator</h1>
        <p class="text-sm text-gray-500 font-medium mt-1">Simulasi dan perhitungan kapasitas parit</p>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8" id="calculator-container">
        
        <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100">
          <h5 class="text-xl font-bold text-gray-900 mb-6">Parameter Parit & Hujan</h5>

          <div v-if="alert.message" :class="`p-3 rounded-lg mb-4 text-sm font-medium ${alert.classes}`">
            {{ alert.message }}
          </div>

          <div class="space-y-4">
            <div>
              <label class="block text-sm font-semibold mb-2 text-gray-700">Nama Parit</label>
              <input v-model="form.name" type="text" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium" maxlength="50">
            </div>

            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-semibold mb-2 text-gray-700">Lebar dasar b (m)</label>
                <input v-model.number="form.b" type="number" step="0.01" min="0.1" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium">
              </div>
              <div>
                <label class="block text-sm font-semibold mb-2 text-gray-700">Kedalaman h (m)</label>
                <input v-model.number="form.h" type="number" step="0.01" min="0.1" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium">
              </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-semibold mb-2 text-gray-700">Kemiringan z</label>
                <input v-model.number="form.z" type="number" step="0.1" min="0" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium">
              </div>
              <div>
                <label class="block text-sm font-semibold mb-2 text-gray-700">Panjang L (m)</label>
                <input v-model.number="form.L" type="number" step="1" min="1" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium">
              </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-semibold mb-2 text-gray-700">Slope S (m/m)</label>
                <input v-model.number="form.S" type="number" step="0.0001" min="0.0001" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium">
              </div>
              <div>
                <label class="block text-sm font-semibold mb-2 text-gray-700">Koefisien n</label>
                <input v-model.number="form.n" type="number" step="0.001" min="0.01" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium">
              </div>
            </div>

            <div>
              <label class="block text-sm font-semibold mb-2 text-gray-700">Curah hujan (mm/hari)</label>
              <input v-model.number="form.H" type="range" class="w-full accent-blue-600 h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer" min="0" max="400" step="1">
              <div class="flex justify-between text-sm mt-1">
                <span class="font-bold text-blue-600">{{ form.H }} mm/hari</span>
                <span class="text-gray-500">geser untuk simulasi</span>
              </div>
            </div>

            <div>
              <label class="block text-sm font-semibold mb-2 text-gray-700">Luas lahan (ha)</label>
              <input v-model.number="form.A_lahan" type="number" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium" step="0.01" min="0.01">
            </div>

            <div>
              <label class="block text-sm font-semibold mb-2 text-gray-700">Satuan debit</label>
              <select v-model="form.satuan" class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors font-medium bg-white">
                <option value="m3s">m³/s</option>
                <option value="ls">l/s</option>
              </select>
            </div>

            <div class="grid grid-cols-3 gap-3 pt-2">
              <button @click="calculate(false)" class="bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700 text-white py-3 rounded-xl font-semibold shadow-lg transition-all transform hover:-translate-y-0.5">
                Hitung
              </button>
              <button @click="calculate(true)" class="bg-green-600 hover:bg-green-700 text-white py-3 rounded-xl font-semibold shadow-lg transition-all transform hover:-translate-y-0.5">
                Tambah
              </button>
              <button @click="resetForm" class="border-2 border-gray-300 hover:bg-gray-50 text-gray-700 py-3 rounded-xl font-semibold transition-colors">
                Reset
              </button>
            </div>

            <div class="border-t-2 border-gray-100 pt-4 mt-4">
              <div class="flex justify-between gap-2">
                <button @click="exportCSV" class="flex-1 bg-blue-50 hover:bg-blue-100 text-blue-700 py-2 rounded-lg font-semibold text-sm transition-colors">
                  CSV
                </button>
                <button @click="exportPDF" class="flex-1 bg-red-50 hover:bg-red-100 text-red-700 py-2 rounded-lg font-semibold text-sm transition-colors">
                  PDF
                </button>
                <button @click="clearData" class="flex-1 bg-yellow-50 hover:bg-yellow-100 text-yellow-700 py-2 rounded-lg font-semibold text-sm transition-colors">
                  Clear
                </button>
              </div>
            </div>

            <div class="border-t-2 border-gray-100 pt-4">
              <h6 class="font-bold text-gray-900 mb-3">Daftar Parit ({{ savedParits.length }})</h6>
              <div class="max-h-60 overflow-y-auto pr-1">
                <table class="w-full text-sm">
                  <thead class="bg-gray-100 sticky top-0">
                    <tr>
                      <th class="p-2 text-left font-bold rounded-tl-lg">Nama</th>
                      <th class="p-2 text-left font-bold">V (³)</th>
                      <th class="p-2 text-left font-bold">Qh</th>
                      <th class="p-2 text-right font-bold rounded-tr-lg">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-if="savedParits.length === 0">
                      <td colspan="4" class="p-4 text-center text-gray-400 text-xs">Belum ada data disimpan</td>
                    </tr>
                    <tr v-for="item in savedParits" :key="item.id" class="border-b border-gray-50 hover:bg-blue-50/50 transition-colors">
                      <td class="p-2 font-medium">{{ item.name }}</td>
                      <td class="p-2 text-gray-600">{{ item.res.V.toFixed(2) }}</td>
                      <td class="p-2 text-gray-600">{{ item.res.Qh.toFixed(2) }}</td>
                      <td class="p-2 text-right space-x-1">
                        <button @click="loadItem(item)" class="text-blue-600 hover:text-blue-800 text-xs font-bold px-1">Load</button>
                        <button @click="deleteItem(item.id)" class="text-red-600 hover:text-red-800 text-xs font-bold px-1">Del</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

        <div class="lg:col-span-2 space-y-6">
          
          <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100">
            <div class="flex justify-between items-start mb-6">
              <div>
                <h5 class="text-xl font-bold text-gray-900">Hasil Analisis</h5>
                <div class="text-sm text-gray-500 mt-1">Visualisasi ketinggian air dalam parit</div>
              </div>
              <div class="text-right">
                <div 
                  class="inline-block px-4 py-2 rounded-full font-bold text-sm text-white shadow-sm transition-colors duration-300"
                  :style="{ backgroundColor: resultStatus.color }"
                >
                  {{ resultStatus.text }}
                </div>
                <div class="text-xs text-gray-500 mt-1">Status Kapasitas</div>
              </div>
            </div>

            <div class="relative rounded-xl overflow-hidden h-60 border-[3px] border-green-500 bg-gradient-to-b from-green-50 to-green-100 shadow-inner">
              <div 
                class="absolute left-0 bottom-0 w-[200%] bg-gradient-to-b from-blue-400 to-blue-700 opacity-85 transition-all duration-700 ease-in-out"
                :style="{ height: waterHeight + 'px', transform: 'translateX(-10%)' }"
              >
               <div class="wave-anim w-full h-full"></div>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 h-[280px]">
              <canvas ref="chartKapasitasRef"></canvas>
            </div>
            <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 h-[280px]">
              <canvas ref="chartHujanRef"></canvas>
            </div>
          </div>

          <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100">
            <h6 class="text-lg font-bold text-gray-900 mb-4">Detail Perhitungan</h6>
            
            <div v-if="!results" class="text-sm text-gray-500 italic">
              Masukkan parameter dan tekan tombol Hitung untuk melihat hasil.
            </div>

            <div v-else>
              <ul class="space-y-3 text-sm">
                <li class="flex justify-between border-b border-gray-50 pb-2">
                  <span class="text-gray-600">Luas penampang (A)</span>
                  <span class="font-bold text-gray-900">{{ results.A.toFixed(3) }} m²</span>
                </li>
                <li class="flex justify-between border-b border-gray-50 pb-2">
                  <span class="text-gray-600">Keliling basah (P)</span>
                  <span class="font-bold text-gray-900">{{ results.P.toFixed(3) }} m</span>
                </li>
                <li class="flex justify-between border-b border-gray-50 pb-2">
                  <span class="text-gray-600">Jari-jari hidrolik (R)</span>
                  <span class="font-bold text-gray-900">{{ results.R.toFixed(3) }} m</span>
                </li>
                <li class="flex justify-between border-b border-gray-50 pb-2">
                  <span class="text-gray-600">Debit parit (Q)</span>
                  <span class="font-bold text-blue-700">{{ results.Q_display.toFixed(4) }} {{ form.satuan === 'ls' ? 'l/s' : 'm³/s' }}</span>
                </li>
                <li class="flex justify-between border-b border-gray-50 pb-2">
                  <span class="text-gray-600">Volume parit (V)</span>
                  <span class="font-bold text-gray-900">{{ results.V.toFixed(2) }} m³</span>
                </li>
                <li class="flex justify-between border-b border-gray-50 pb-2">
                  <span class="text-gray-600">Debit hujan (Qh)</span>
                  <span class="font-bold text-gray-900">{{ results.Qh.toFixed(2) }} m³/hari</span>
                </li>
                <li class="flex justify-between">
                  <span class="text-gray-600">Kecepatan Aliran (v)</span>
                  <span class="font-bold text-gray-900">{{ results.speed.toFixed(4) }} m/s</span>
                </li>
              </ul>

              <div class="grid grid-cols-3 gap-4 mt-6 p-4 bg-gray-50 rounded-xl border border-gray-200">
                <div>
                  <p class="text-xs text-gray-500 font-semibold uppercase">Waktu Isi</p>
                  <p class="text-lg font-bold text-blue-700 truncate">
                    {{ results.timeFillHours === Infinity ? '∞' : results.timeFillHours.toFixed(2) + ' jam' }}
                  </p>
                </div>
                <div>
                  <p class="text-xs text-gray-500 font-semibold uppercase">Efisiensi</p>
                  <p class="text-lg font-bold text-green-700">{{ results.ef.toFixed(1) }}%</p>
                </div>
                <div>
                  <p class="text-xs text-gray-500 font-semibold uppercase">Status</p>
                  <p class="text-sm font-bold mt-1" :style="{ color: resultStatus.color }">{{ resultStatus.desc }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted, watch } from 'vue';
import Chart from 'chart.js/auto';

// --- State Management ---
const form = reactive({
  name: 'Parit CD C21',
  b: 0.5,
  h: 0.7,
  z: 1.5,
  L: 100,
  S: 0.002,
  n: 0.025,
  H: 30,
  A_lahan: 1,
  satuan: 'm3s'
});

const results = ref(null);
const savedParits = ref([]);
const alert = reactive({ message: '', classes: '' });
const waterHeight = ref(0);

// Refs for Chart Canvas
const chartKapasitasRef = ref(null);
const chartHujanRef = ref(null);
let chartKapasitasInstance = null;
let chartHujanInstance = null;

// --- Computed Properties ---
const resultStatus = computed(() => {
  if (!results.value) return { text: '—', desc: '—', color: '#9ca3af' };
  
  const cap = results.value.kapasitas;
  if (cap === Infinity) return { text: 'Ideal', desc: 'Tidak ada aliran masuk', color: '#1d4ed8' }; // blue-700
  if (cap >= 1) return { text: 'Cukup', desc: 'Parit mampu menampung', color: '#15803d' }; // green-700
  if (cap >= 0.7) return { text: 'Hampir Penuh', desc: 'Perlu monitoring', color: '#b45309' }; // amber-700
  return { text: 'Tidak Cukup', desc: 'Risiko overflow', color: '#b91c1c' }; // red-700
});

// --- Logic ---

const showAlert = (msg, type = 'info') => {
  const styles = {
    success: 'bg-green-100 text-green-700',
    danger: 'bg-red-100 text-red-700',
    warning: 'bg-yellow-100 text-yellow-700',
    info: 'bg-blue-100 text-blue-700'
  };
  alert.message = msg;
  alert.classes = styles[type] || styles.info;
  setTimeout(() => { alert.message = ''; }, 3000);
};

const validateInput = () => {
  return form.b >= 0.1 && form.h >= 0.1 && form.L >= 1 && form.S > 0;
};

const calculate = (save = false) => {
  if (!validateInput()) {
    showAlert('Mohon periksa input (nilai tidak boleh nol/negatif)', 'warning');
    return;
  }

  // Math Logic
  const b = parseFloat(form.b);
  const h = parseFloat(form.h);
  const z = parseFloat(form.z);
  const L = parseFloat(form.L);
  const S = parseFloat(form.S);
  const n = parseFloat(form.n);
  const H = parseFloat(form.H);
  const A_lahan = parseFloat(form.A_lahan);

  // Geometric properties
  const A = (b + z * h) * h;
  const P = b + 2 * h * Math.sqrt(1 + z * z);
  const R = P > 0 ? A / P : 0;

  // Manning Formula
  let Q = (1 / n) * A * Math.pow(R, 2/3) * Math.sqrt(S);
  const Q_display = (form.satuan === 'ls') ? Q * 1000 : Q;

  // Capacity & Rainfall
  const V = A * L;
  const H_m = H / 1000;
  const A_lahan_m2 = A_lahan * 10000;
  const Qh = H_m * A_lahan_m2; // Volume of rain per day
  const Q_day = Q * 86400; // Channel capacity per day

  const ef = Qh > 0 ? Math.min(100, (Q_day / Qh) * 100) : 0;
  const kapasitas = Qh > 0 ? V / Qh : Infinity;
  const timeFillHours = Qh > 0 ? (V / Qh) * 24 : Infinity;
  const speed = A > 0 ? Q / A : 0;

  // Set Results
  results.value = { A, P, R, Q, Q_display, V, Qh, Q_day, ef, kapasitas, timeFillHours, speed };

  // Update Visuals
  updateWaterVisual(kapasitas);
  updateCharts();

  // Save to List if requested
  if (save) {
    const newItem = {
      id: Date.now(),
      name: form.name || 'Tanpa Nama',
      params: { ...form },
      res: results.value
    };
    savedParits.value.push(newItem);
    saveToStorage();
    showAlert('Data berhasil ditambahkan', 'success');
  } else {
    // Just show result alert if needed, or keep silent for direct calc
    // showAlert('Perhitungan selesai', 'info');
  }
};

const updateWaterVisual = (kapasitasRatio) => {
  const maxPixelHeight = 240; // Height of container
  // Logic: if capacity is infinite (no rain), show low level. 
  // If ratio < 1 (Rain > Volume), it overflows (max height).
  // If ratio > 1 (Volume > Rain), water level is lower.
  
  let fillPercentage = 0;
  if (kapasitasRatio === Infinity) fillPercentage = 0.2;
  else if (kapasitasRatio >= 1) fillPercentage = 1 / kapasitasRatio; // E.g. Cap 2.0 means half full
  else fillPercentage = 1.0; // Overflow or full

  // Clamp
  fillPercentage = Math.min(Math.max(fillPercentage, 0.1), 1.0);
  
  waterHeight.value = fillPercentage * maxPixelHeight;
};

const updateCharts = () => {
  if (!results.value) return;

  // 1. Kapasitas Chart
  if (chartKapasitasInstance) chartKapasitasInstance.destroy();
  chartKapasitasInstance = new Chart(chartKapasitasRef.value, {
    type: 'bar',
    data: {
      labels: ['Volume Parit (m³)', 'Debit Hujan (m³/hari)'],
      datasets: [{
        label: 'Analisis Kapasitas',
        data: [results.value.V, results.value.Qh],
        backgroundColor: ['#16a34a', '#2563eb'],
        borderRadius: 8
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: { legend: { display: false }, title: { display: true, text: 'Volume vs Debit Hujan' } }
    }
  });

  // 2. Rain Simulation Chart
  if (chartHujanInstance) chartHujanInstance.destroy();
  const hours = Array.from({length: 24}, (_, i) => i);
  const baseRain = form.H;
  // Create a fake bell curve for rain distribution
  const series = hours.map(h => Math.max(0, baseRain * (0.5 + 0.5 * Math.sin((h/24) * 2 * Math.PI - Math.PI/2))));
  
  chartHujanInstance = new Chart(chartHujanRef.value, {
    type: 'line',
    data: {
      labels: hours.map(h => `${h}:00`),
      datasets: [{
        label: 'Intensitas (mm/jam)',
        data: series,
        fill: true,
        tension: 0.4,
        borderColor: '#2563eb',
        backgroundColor: 'rgba(37, 99, 235, 0.1)'
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: { legend: { display: false }, title: { display: true, text: 'Simulasi Hujan 24 Jam' } },
      scales: { y: { beginAtZero: true } }
    }
  });
};

// --- Storage & Data Management ---

const saveToStorage = () => {
  if (import.meta.client) {
    localStorage.setItem('dcc_saved_parits', JSON.stringify(savedParits.value));
  }
};

const loadFromStorage = () => {
  if (import.meta.client) {
    const data = localStorage.getItem('dcc_saved_parits');
    if (data) savedParits.value = JSON.parse(data);
  }
};

const loadItem = (item) => {
  Object.assign(form, item.params);
  calculate(false); // Re-calculate to refresh charts/visuals
  showAlert(`Memuat data: ${item.name}`, 'info');
};

const deleteItem = (id) => {
  if(confirm('Hapus data ini?')) {
    savedParits.value = savedParits.value.filter(x => x.id !== id);
    saveToStorage();
  }
};

const clearData = () => {
  if(confirm('Hapus semua data tersimpan?')) {
    savedParits.value = [];
    saveToStorage();
    showAlert('Semua data dihapus', 'info');
  }
};

const resetForm = () => {
  Object.assign(form, {
    name: 'Parit Baru', b: 0.5, h: 0.7, z: 1.5, L: 100, S: 0.002, n: 0.025, H: 30, A_lahan: 1, satuan: 'm3s'
  });
  results.value = null;
  waterHeight.value = 0;
  if(chartKapasitasInstance) chartKapasitasInstance.destroy();
  if(chartHujanInstance) chartHujanInstance.destroy();
};

// --- Exports ---

const exportCSV = () => {
  if (!savedParits.value.length) return showAlert('Tidak ada data untuk diekspor', 'warning');
  
  let csv = 'Nama,Lebar(b),Dalam(h),Panjang(L),Volume(m3),Hujan(m3/hari)\n';
  savedParits.value.forEach(d => {
    csv += `"${d.name}",${d.params.b},${d.params.h},${d.params.L},${d.res.V.toFixed(2)},${d.res.Qh.toFixed(2)}\n`;
  });
  
  const blob = new Blob([csv], { type: 'text/csv' });
  const url = window.URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'data_parit.csv';
  a.click();
  window.URL.revokeObjectURL(url);
};

const exportPDF = async () => {
  if(!import.meta.client) return;
  // Dynamic import to avoid SSR issues
  const html2canvas = (await import('html2canvas')).default;
  const { jsPDF } = await import('jspdf');
  
  const element = document.getElementById('calculator-container');
  showAlert('Sedang memproses PDF...', 'info');
  
  try {
    const canvas = await html2canvas(element, { scale: 1.5 });
    const imgData = canvas.toDataURL('image/png');
    const pdf = new jsPDF('l', 'mm', 'a4');
    const pdfWidth = pdf.internal.pageSize.getWidth();
    const pdfHeight = (canvas.height * pdfWidth) / canvas.width;
    
    pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
    pdf.save('Laporan_DCC.pdf');
    showAlert('PDF berhasil diunduh', 'success');
  } catch (err) {
    console.error(err);
    showAlert('Gagal membuat PDF', 'danger');
  }
};

// --- Lifecycle ---
onMounted(() => {
  loadFromStorage();
  // Live calculation on mount is optional, uncomment if needed
  // calculate(false); 
});

// Watch rainfall slider for real-time visual update (optional)
watch(() => form.H, () => {
  if (results.value) calculate(false);
});
</script>

<style scoped>
/* Custom animations that Tailwind doesn't have by default */
@keyframes wave {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}

/* Add any custom scrollbar styles if needed */
::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}
::-webkit-scrollbar-thumb {
  background: #cbd5e1;
  border-radius: 4px;
}
</style>