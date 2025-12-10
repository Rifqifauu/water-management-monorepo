<template>
    <div class="w-full mt-6 px-2 md:px-0 max-w-[1100px] mx-auto">

        <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm mb-6">
            <div class="flex justify-between items-center mb-3">
                <h3 class="text-sm font-semibold text-gray-700">Filter Data</h3>
                <button @click="resetFilters" class="text-xs text-red-600 hover:text-red-800 underline transition">
                    Reset Filter
                </button>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4">
                
                <div class="col-span-1 md:col-span-2">
                    <label class="block text-xs text-gray-500 mb-1">Pencarian</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            </svg>
                        </div>
                        <input type="text" v-model="filters.search" @input="handleSearch" 
                            placeholder="Cari afdeling atau blok..."
                            class="w-full pl-9 pr-3 py-2 bg-gray-50 border border-gray-300 rounded text-sm focus:ring-1 focus:ring-blue-500 focus:border-blue-500 transition-colors" />
                    </div>
                </div>

                <div class="col-span-1">
                    <label class="block text-xs text-gray-500 mb-1">Tanggal</label>
                    <input type="date" v-model="filters.date" @change="handleFilterChange"
                        class="w-full px-3 py-2 bg-white border border-gray-300 rounded text-sm focus:ring-1 focus:ring-blue-500 focus:border-blue-500 cursor-pointer" />
                </div>

                <div class="col-span-1">
                    <label class="block text-xs text-gray-500 mb-1">Pengamat</label>
                    <select v-model="filters.id_karyawan" @change="handleFilterChange"
                        class="w-full px-3 py-2 bg-white border border-gray-300 rounded text-sm focus:ring-1 focus:ring-blue-500 focus:border-blue-500 cursor-pointer">
                        <option value="">Semua Pengamat</option>
                        <option v-for="k in options.karyawan" :key="k.id" :value="k.id">
                            {{ k.nama }}
                        </option>
                    </select>
                </div>

                <div class="col-span-1">
                    <label class="block text-xs text-gray-500 mb-1">Lokasi</label>
                    <select v-model="filters.id_lokasi" @change="handleFilterChange"
                        class="w-full px-3 py-2 bg-white border border-gray-300 rounded text-sm focus:ring-1 focus:ring-blue-500 focus:border-blue-500 cursor-pointer">
                        <option value="">Semua Lokasi</option>
                        <option v-for="loc in options.lokasi" :key="loc.id" :value="loc.id">
                            {{ loc.afdeling }} - {{ loc.blok }}
                        </option>
                    </select>
                </div>
            </div>
        </div>

        <div v-if="selectedIds.length > 0" class="mb-6 animate-fade-in">
            <div class="flex flex-wrap items-center gap-3 p-3 bg-red-50 border border-red-200 rounded-lg shadow-sm">
                <span class="text-sm text-red-700 font-medium whitespace-nowrap">{{ selectedIds.length }} Data terpilih</span>
                <div class="flex gap-2">
                    <button @click="bulkDelete" :disabled="isDeleting"
                        class="px-3 py-1.5 bg-red-600 text-white text-xs md:text-sm font-medium rounded hover:bg-red-700 transition shadow-sm disabled:opacity-50 flex items-center gap-2">
                        <span v-if="isDeleting"
                            class="animate-spin h-3 w-3 border-2 border-white border-t-transparent rounded-full"></span>
                        {{ isDeleting ? 'Hapus...' : 'Hapus' }}
                    </button>
                    <button @click="selectedIds = []" :disabled="isDeleting"
                        class="text-xs md:text-sm text-gray-600 hover:text-gray-800 underline disabled:opacity-50">
                        Batal
                    </button>
                </div>
            </div>
        </div>

        <div class="bg-white border border-gray-200 rounded-lg shadow-sm overflow-hidden">
            
            <div class="block md:hidden">
                <div class="p-4 border-b border-gray-100 flex items-center justify-between bg-gray-50">
                    <label class="flex items-center space-x-2 text-sm text-gray-600 font-medium">
                        <input type="checkbox" :checked="isAllSelected" @change="toggleSelectAll"
                            class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4" />
                        <span>Pilih Semua Halaman Ini</span>
                    </label>
                </div>

                <div v-if="isLoading" class="p-8 text-center">
                    <svg class="animate-spin h-8 w-8 text-blue-500 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                </div>

                <div v-else-if="!responseData.data || responseData.data.length === 0" class="p-8 text-center text-gray-500">
                    <p>Data tidak ditemukan.</p>
                </div>

                <div v-else class="divide-y divide-gray-100">
                    <div v-for="item in responseData.data" :key="item.id" class="p-4 hover:bg-gray-50 transition">
                        <div class="flex items-start justify-between mb-2">
                            <div class="flex items-start gap-3">
                                <input type="checkbox" v-model="selectedIds" :value="item.id"
                                    class="mt-1 rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4" />
                                <div>
                                    <p class="text-sm font-bold text-gray-900">{{ item.tanggal }}</p>
                                    <p class="text-xs text-gray-500">{{ item.karyawan.nama }}</p>
                                </div>
                            </div>
                            <span class="px-2 py-1 text-xs font-semibold rounded bg-blue-50 text-blue-700 border border-blue-100">
                                {{ item.lokasi.afdeling }} - {{ item.lokasi.blok }}
                            </span>
                        </div>

                        <div class="grid grid-cols-2 gap-x-4 gap-y-2 text-sm text-gray-600 ml-7">
                            <div>
                                <span class="text-xs text-gray-400 block">Kondisi Aliran</span>
                                {{ item.kondisi_aliran }}
                            </div>
                            <div>
                                <span class="text-xs text-gray-400 block">Tipe Infrastruktur</span>
                                {{ item.jenis_infrastruktur }}
                            </div>
                            <div>
                                <span class="text-xs text-gray-400 block">Penyebab</span>
                                <span class="font-medium text-gray-900">{{ item.penyebab }}</span>
                            </div>
                          
                        </div>

                        <div class="mt-3 ml-7 pt-3 border-t border-gray-100 flex justify-between items-center">
                            <div class="text-xs text-gray-500 truncate max-w-[150px]">
                                {{ item.keterangan || '-' }}
                            </div>
                            <a :href="storageUrl+ item.foto_path" target="_blank" class="text-xs font-medium text-blue-600 hover:text-blue-800">
                                Lihat Foto &rarr;
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="hidden md:block overflow-x-auto">
                <table class="w-full whitespace-nowrap">
                    <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th scope="col" class="px-6 py-4 text-left w-10">
                                <input type="checkbox" :checked="isAllSelected" @change="toggleSelectAll"
                                    class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4 cursor-pointer" />
                            </th>
                            <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Tanggal <br> / Pengamat</th>
                            <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Lokasi</th>
                            <th scope="col" class="px-6 py-4 text-center text-xs font-semibold text-gray-500 uppercase tracking-wider">Jenis</th>
                            <th scope="col" class="px-6 py-4 text-center text-xs font-semibold text-gray-500 uppercase tracking-wider">Aliran</th>
                            <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Penyebab</th>
                            <th scope="col" class="px-6 py-4 text-center text-xs font-semibold text-gray-500 uppercase tracking-wider">Foto</th>
                            <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Ket</th>
                        </tr>
                    </thead>

                    <tbody class="bg-white divide-y divide-gray-200">
                        <tr v-if="isLoading">
                            <td colspan="12" class="px-6 py-20 text-center">
                                <div class="flex flex-col items-center justify-center">
                                    <svg class="animate-spin h-8 w-8 text-blue-500 mb-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                    </svg>
                                    <p class="text-gray-500 text-sm">Memuat data...</p>
                                </div>
                            </td>
                        </tr>

                        <tr v-else-if="!responseData.data || responseData.data.length === 0">
                            <td colspan="12" class="px-6 py-24 text-center">
                                <div class="flex flex-col items-center justify-center text-gray-500">
                                    <p class="text-lg font-medium text-gray-600 mb-1">Data tidak ditemukan.</p>
                                    <p class="text-sm text-gray-400">Coba ubah filter atau kata kunci pencarian.</p>
                                </div>
                            </td>
                        </tr>

                        <tr v-else v-for="item in (responseData.data || [])" :key="item.id" class="hover:bg-gray-50 transition-colors">
                            <td class="px-6 py-4">
                                <input type="checkbox" v-model="selectedIds" :value="item.id"
                                    class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4 cursor-pointer" />
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-900">
                                <span class="font-medium block">{{ item.tanggal }}</span>
                                <span class="text-xs text-gray-500">{{ item.karyawan.nama }}</span>
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-500">
                                <span class="block">Afd: {{ item.lokasi.afdeling }}</span>
                                <span class="block">Blok: {{ item.lokasi.blok }}</span>
                            </td>
                            <td class="px-6 py-4 text-center text-sm text-gray-500">{{ item.jenis_infrastruktur }}</td>
                            <td class="px-6 py-4 text-center text-sm text-gray-500">{{ item.kondisi_aliran }}</td>
                            <td class="px-6 py-4 text-sm text-gray-500 max-w-[150px] truncate" :title="item.penyebab">{{ item.penyebab }}</td>
                            <td class="px-6 py-4 text-center text-sm text-blue-600">
                                <a :href="storageUrl+ item.foto_path" target="_blank" class="hover:underline">Foto</a>
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-500 max-w-[200px] truncate" :title="item.keterangan">{{ item.keterangan }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div v-if="responseData.total > 0" class="px-4 md:px-6 py-4 border-t border-gray-200 flex flex-col md:flex-row items-center justify-between gap-4">
                <div class="text-sm text-gray-500 text-center md:text-left">
                    Show <span class="font-medium text-gray-900">{{ responseData.from }}</span> - <span class="font-medium text-gray-900">{{ responseData.to }}</span> of <span class="font-medium text-gray-900">{{ responseData.total }}</span>
                </div>

                <div class="flex space-x-2">
                    <button @click="changePage(responseData.current_page - 1)" :disabled="responseData.current_page === 1"
                        class="px-3 py-1.5 border border-gray-300 rounded text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed transition">
                        Prev
                    </button>
                    <button @click="changePage(responseData.current_page + 1)" :disabled="responseData.current_page === responseData.last_page"
                        class="px-3 py-1.5 border border-gray-300 rounded text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed transition">
                        Next
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
const storageUrl = inject('storageUrl')
// --- STATE MANAGEMENT ---
const emit = defineEmits(['edit'])
const isLoading = ref(false)
const isDeleting = ref(false)

// Data Utama dari API
const responseData = ref({
    current_page: 1, data: [], from: 0, last_page: 1, per_page: 5, to: 0, total: 0
})

const options = ref({
    karyawan: [],
    lokasi: []
})

// Filter Values
const filters = ref({
    search: '',
    date: '',        // Single Date
    id_karyawan: '', // Filter Pengamat
    id_lokasi: ''     // Filter Lokasi
})

// Bulk Action Selection
const selectedIds = ref([])

// --- COMPUTED PROPERTIES ---
const isAllSelected = computed(() => {
    const data = responseData.value.data || []
    if (data.length === 0) return false
    return data.every(item => selectedIds.value.includes(item.id))
})

// --- METHODS ---

// 1. Fetch Data Utama
async function fetchData(page = 1) {
    isLoading.value = true
    try {
        // Build query string
        const params = new URLSearchParams({
            page: page,
            search: filters.value.search,
            date: filters.value.date,
            id_karyawan: filters.value.id_karyawan,
            id_lokasi: filters.value.id_lokasi
        })

        // Ganti URL endpoint sesuai API Anda
        const response = await useApi(`monitoring-mingguan?${params.toString()}`)
        responseData.value = response

    } catch (error) {
        console.error("Gagal mengambil data:", error)
        // Reset data jika error agar tidak menampilkan data lama
        responseData.value = { current_page: 1, data: [], total: 0 }
    } finally {
        isLoading.value = false
    }
}

// 2. Fetch Opsi Filter (Karyawan)
async function fetchFilterOptions() {
    try {
        const karyawan = await useApi('list/karyawan') // Pastikan endpoint ini ada
        options.value.karyawan = karyawan
        const lokasi = await useApi('list/lokasi') // Pastikan endpoint ini ada
        options.value.lokasi = lokasi
    } catch (error) {
        console.error("Gagal mengambil opsi filter:", error)
     
    }
}

// 3. Logic Filter & Search
let searchTimeout = null
const handleSearch = () => {
    // Debounce search agar tidak spam API
    if (searchTimeout) clearTimeout(searchTimeout)
    searchTimeout = setTimeout(() => fetchData(1), 500)
}

const handleFilterChange = () => {
    // Langsung fetch data halaman 1 saat filter dropdown/date berubah
    fetchData(1)
}

const resetFilters = () => {
    filters.value = {
        search: '',
        date: '',
        id_karyawan: '',
        id_lokasi: ''
    }
    fetchData(1)
}

// 4. Logic Bulk Selection
const toggleSelectAll = () => {
    const data = responseData.value.data || []
    if (isAllSelected.value) {
        // Unselect all on current page
        selectedIds.value = selectedIds.value.filter(id => !data.find(item => item.id === id))
    } else {
        // Select all on current page
        const newIds = data.map(item => item.id)
        selectedIds.value = [...new Set([...selectedIds.value, ...newIds])]
    }
}

// 5. Logic Delete
const processDelete = async (idsToDelete) => {
    isDeleting.value = true
    try {
        const deletePromises = idsToDelete.map(id =>
            useApi(`monitoring-mingguan/${id}`, { method: 'DELETE' })
        )
        await Promise.all(deletePromises)

        // Hapus ID dari selection
        selectedIds.value = selectedIds.value.filter(id => !idsToDelete.includes(id))

        // Refresh Data: Jika halaman kosong setelah hapus, mundur 1 halaman
        if (responseData.value.data.length === idsToDelete.length && responseData.value.current_page > 1) {
            await fetchData(responseData.value.current_page - 1)
        } else {
            await fetchData(responseData.value.current_page)
        }
        
        alert("Data berhasil dihapus.")
    } catch (error) {
        console.error("Gagal menghapus:", error)
        alert("Terjadi kesalahan saat menghapus data.")
        fetchData(responseData.value.current_page)
    } finally {
        isDeleting.value = false
    }
}

const bulkDelete = async () => {
    if (selectedIds.value.length === 0) return
    if (!confirm(`Yakin ingin menghapus ${selectedIds.value.length} data monitoring terpilih?`)) return
    await processDelete(selectedIds.value)
}

// 6. Pagination
const changePage = (page) => {
    if (page >= 1 && page <= responseData.value.last_page) {
        fetchData(page)
    }
}

// --- LIFECYCLE HOOKS ---
onMounted(() => {
    fetchFilterOptions()
    fetchData(1)
})
</script>