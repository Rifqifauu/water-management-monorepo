<template>
  <div class="w-full mt-6 px-2 md:px-0">
    
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-6">
      <div class="relative w-full">
        
        <div v-if="selectedIds.length > 0" class="flex flex-col sm:flex-row items-start sm:items-center gap-3 p-3 bg-red-50 border border-red-200 rounded-lg shadow-sm w-full">
           <span class="text-sm text-red-700 font-medium pl-1">{{ selectedIds.length }} Data terpilih</span>
           <div class="flex gap-2 w-full sm:w-auto">
             <button 
               @click="bulkDelete"
               :disabled="isDeleting"
               class="flex-1 sm:flex-none justify-center px-4 py-1.5 bg-red-600 text-white text-sm font-medium rounded hover:bg-red-700 transition shadow-sm disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
             >
               <span v-if="isDeleting" class="animate-spin h-4 w-4 border-2 border-white border-t-transparent rounded-full"></span>
               {{ isDeleting ? 'Hapus...' : 'Hapus Terpilih' }}
             </button>
             <button 
               @click="selectedIds = []"
               :disabled="isDeleting"
               class="px-3 py-1.5 text-sm text-gray-600 hover:text-gray-800 underline disabled:opacity-50"
             >
               Batal
             </button>
           </div>
        </div>

        <div v-else class="relative w-full md:w-1/3 ml-auto">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <svg class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
            </div>
            <input 
            type="text" 
            v-model="filters.search"
            @input="handleSearch"
            placeholder="Cari parameter skoring..." 
            class="w-full pl-10 pr-4 py-2.5 bg-white border border-gray-300 rounded-lg text-sm shadow-sm placeholder-gray-400 focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors"
            />
        </div>
      </div>
    </div>

    <div class="bg-white border border-gray-200 rounded-lg shadow-sm overflow-hidden flex flex-col w-full max-w-full">

      <div class="block md:hidden">
         <div class="p-4 border-b border-gray-100 flex items-center justify-between bg-gray-50">
            <label class="flex items-center space-x-2 text-sm text-gray-600 font-medium">
               <input 
                   type="checkbox" 
                   :checked="isAllSelected"
                   @change="toggleSelectAll"
                   class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4" 
               />
               <span>Pilih Semua</span>
            </label>
         </div>

         <div class="divide-y divide-gray-100">
            <div v-if="isLoading" class="p-8 text-center">
               <svg class="animate-spin h-8 w-8 text-blue-500 mx-auto mb-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                   <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                   <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
               </svg>
               <p class="text-gray-500 text-sm">Memuat data...</p>
            </div>

            <div v-else-if="!responseData.data || responseData.data.length === 0" class="p-8 text-center text-gray-500">
               <p>Data tidak ditemukan.</p>
            </div>

            <template v-else v-for="(groupItems, categoryName) in groupedData" :key="'mob-cat-'+categoryName">
                <div class="bg-blue-50 px-4 py-2 border-b border-blue-100 flex items-center gap-2">
                    <span class="w-1 h-4 bg-blue-500 rounded-full"></span>
                    <span class="text-xs font-bold text-blue-800 uppercase tracking-wide">{{ categoryName }}</span>
                </div>

                <div v-for="item in groupItems" :key="'mob-'+item.id" class="p-4 hover:bg-gray-50 transition border-b border-gray-100 last:border-b-0">
                    <div class="flex items-start justify-between gap-3 mb-2">
                        <div class="flex items-center gap-3 w-full">
                            <input 
                                type="checkbox" 
                                v-model="selectedIds"
                                :value="item.id"
                                class="mt-1 rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4 flex-shrink-0" 
                            />
                            <div class="flex-1">
                                <p class="text-sm font-medium text-gray-900">
                                    <span v-if="item.label_kondisi">{{ item.label_kondisi }}</span>
                                    <span v-else>
                                        {{ (item.min_value != null && item.max_value != null) 
                                            ? formatAngka(item.min_value) + ' - ' + formatAngka(item.max_value) 
                                            : (item.min_value != null ? '> ' + formatAngka(item.min_value) : '< ' + formatAngka(item.max_value)) 
                                        }}
                                    </span>
                                </p>
                            </div>
                            <div class="flex-shrink-0 w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center border border-gray-200">
                                <span class="text-sm font-bold text-gray-700">{{ item.skor }}</span>
                            </div>
                        </div>
                    </div>

                    <div class="pl-7 flex justify-between items-center mt-3">
                        <span 
                            class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium border"
                            :class="getBadgeClass(item.keterangan)"
                        >
                            {{ item.keterangan }}
                        </span>

                        <div class="flex gap-3">
                            <button @click="$emit('edit', item.id)" class="text-xs font-semibold text-indigo-600 hover:text-indigo-800">Edit</button>
                            <button @click="deleteItem(item.id)" class="text-xs font-semibold text-red-600 hover:text-red-800">Hapus</button>
                        </div>
                    </div>
                </div>
            </template>
         </div>
      </div>

      <div class="hidden md:block overflow-x-auto w-full">
        <table class="w-full whitespace-nowrap">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th scope="col" class="px-6 py-4 text-left w-10">
                <input 
                  type="checkbox" 
                  :checked="isAllSelected"
                  @change="toggleSelectAll"
                  class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4 cursor-pointer" 
                />
              </th>
              <th scope="col" class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Kondisi / Parameter</th>
              <th scope="col" class="px-6 py-4 text-center text-xs font-bold text-gray-500 uppercase tracking-wider">Skor</th>
              <th scope="col" class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Keterangan</th>
              <th scope="col" class="px-6 py-4 text-center text-xs font-bold text-gray-500 uppercase tracking-wider">Aksi</th>
            </tr>
          </thead>

         <tbody class="bg-white divide-y divide-gray-200">
          <tr v-if="isLoading">
            <td colspan="5" class="px-6 py-20 text-center">
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
            <td colspan="5" class="px-6 py-24 text-center">
              <div class="flex flex-col items-center justify-center text-gray-500">
                <p class="text-lg font-medium text-gray-600 mb-1">Data tidak ditemukan.</p>
                <p class="text-sm text-gray-400">Coba ubah filter pencarian.</p>
              </div>
            </td>
          </tr>

          <template v-else v-for="(groupItems, categoryName) in groupedData" :key="categoryName">
            <tr class="bg-blue-600 text-white border-b border-blue-700">
                <td class="px-6 py-2 bg-blue-700"></td> 
                <td colspan="4" class="px-6 py-2 text-sm font-bold uppercase tracking-wider">
                    {{ categoryName }}
                </td>
            </tr>

            <tr v-for="item in groupItems" :key="item.id" class="hover:bg-gray-50 transition-colors">
                <td class="px-6 py-4 whitespace-nowrap">
                  <input 
                    type="checkbox" 
                    v-model="selectedIds"
                    :value="item.id"
                    class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4 cursor-pointer" 
                  />
                </td>

                <td class="px-6 py-4 text-sm text-gray-900 font-medium">
                  <span v-if="item.label_kondisi">{{ item.label_kondisi }}</span>
                  <span v-else>
                    {{ (item.min_value != null && item.max_value != null) 
                        ? formatAngka(item.min_value) + ' - ' + formatAngka(item.max_value) 
                        : (item.min_value != null ? '> ' + formatAngka(item.min_value) : '< ' + formatAngka(item.max_value)) 
                    }}
                  </span>
                </td>

                <td class="px-6 py-4 text-sm text-center font-bold text-gray-700">
                  {{ item.skor }}
                </td>

                <td class="px-6 py-4 text-sm">
                  <span 
                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border"
                    :class="getBadgeClass(item.keterangan)"
                  >
                    {{ item.keterangan }}
                  </span>
                </td>

                <td class="px-6 py-4 text-center text-sm font-medium">
                  <button @click="$emit('edit', item.id)" class="text-indigo-600 hover:text-indigo-900 mr-4 font-semibold hover:underline">Edit</button>
                  <button @click="deleteItem(item.id)" class="text-red-600 hover:text-red-900 font-semibold hover:underline">Hapus</button>
                </td>
            </tr>
          </template>

        </tbody>
        </table>
      </div>

      <div v-if="responseData.total > 0" class="px-4 md:px-6 py-4 border-t border-gray-200 flex flex-col md:flex-row items-center justify-between gap-4 bg-white">
        <div class="text-sm text-gray-500 text-center md:text-left">
          Show <span class="font-medium text-gray-900">{{ responseData.from }}</span> - <span class="font-medium text-gray-900">{{ responseData.to }}</span> of <span class="font-medium text-gray-900">{{ responseData.total }}</span>
        </div>
        
        <div class="flex space-x-2">
          <button 
            @click="changePage(responseData.current_page - 1)" 
            :disabled="responseData.current_page === 1"
            class="px-3 py-1.5 border border-gray-300 rounded text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed transition"
          >
            Previous
          </button>
          <button 
            @click="changePage(responseData.current_page + 1)" 
            :disabled="responseData.current_page === responseData.last_page"
            class="px-3 py-1.5 border border-gray-300 rounded text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed transition"
          >
            Next
          </button>
        </div>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

const emit = defineEmits(['edit'])
const isLoading = ref(false)
const isDeleting = ref(false)

// State Data
const responseData = ref({
  current_page: 1, data: [], from: 0, last_page: 1, per_page: 10, to: 0, total: 0
})

const filters = ref({ search: '' })

// Formatter Function
const formatAngka = (val) => {
  if (val == null || val === '') return '';
  return Number(val).toFixed(0);
}

// Grouping Logic
const groupedData = computed(() => {
    const data = responseData.value.data || []
    return data.reduce((groups, item) => {
        const category = item.kategori_parameter || 'Lainnya'
        if (!groups[category]) {
            groups[category] = []
        }
        groups[category].push(item)
        return groups
    }, {})
})

// Badge Logic
const getBadgeClass = (keterangan) => {
    if (!keterangan) return 'bg-gray-50 text-gray-600 border-gray-200'
    const lower = keterangan.toLowerCase()

    if (['sangat baik', 'lancar', 'dangkal', 'sedikit', 'singkat', 'minimal'].some(w => lower.includes(w))) {
        return 'bg-green-50 text-green-700 border-green-200'
    }
    if (['baik', 'cukup', 'rendah'].some(w => lower.includes(w)) && !lower.includes('sangat')) {
        return 'bg-blue-50 text-blue-700 border-blue-200'
    }
    if (lower.includes('sedang')) {
        return 'bg-yellow-50 text-yellow-700 border-yellow-200'
    }
    if (['buruk', 'tidak mengalir', 'dalam', 'banyak', 'lama', 'kritis', 'sangat tinggi', 'tinggi'].some(w => lower.includes(w))) {
        return 'bg-red-50 text-red-700 border-red-200'
    }
    return 'bg-gray-50 text-gray-600 border-gray-200'
}

// Bulk Selection
const selectedIds = ref([])

const isAllSelected = computed(() => {
    const data = responseData.value.data || []
    if (data.length === 0) return false
    return data.every(item => selectedIds.value.includes(item.id))
})

const toggleSelectAll = () => {
    const data = responseData.value.data || []
    if (isAllSelected.value) {
        selectedIds.value = selectedIds.value.filter(id => !data.find(item => item.id === id))
    } else {
        const newIds = data.map(item => item.id)
        selectedIds.value = [...new Set([...selectedIds.value, ...newIds])]
    }
}

// API Calls
async function fetchData(page = 1) {
    isLoading.value = true
    try {
        const params = new URLSearchParams({
            page: page,
            search: filters.value.search,
        })
        
        // Ganti dengan API Anda
        const response = await useApi(`skoring?${params.toString()}`)
        responseData.value = response 
        
        // Mocking Data untuk Preview
        console.log("Fetching page", page)

    } catch (error) {
        console.error("Error:", error)
        responseData.value = { current_page: 1, data: [], total: 0 } 
    } finally {
        isLoading.value = false
    }
}

const handleSearch = () => { setTimeout(() => fetchData(1), 500) }

const processDelete = async (idsToDelete) => {
    isDeleting.value = true
    try {
        const deletePromises = idsToDelete.map(id => useApi(`skoring/${id}`, { method: 'DELETE' }))
        await Promise.all(deletePromises)
        selectedIds.value = selectedIds.value.filter(id => !idsToDelete.includes(id))
        
        if (responseData.value.data.length === idsToDelete.length && responseData.value.current_page > 1) {
             await fetchData(responseData.value.current_page - 1)
        } else {
             await fetchData(responseData.value.current_page)
        }
    } catch (error) {
        console.error("Delete failed", error)
        alert("Gagal menghapus data.")
    } finally {
        isDeleting.value = false
    }
}

const deleteItem = async (id) => {
    if (!confirm('Hapus item ini?')) return
    await processDelete([id])
}

const bulkDelete = async () => {
    if (!confirm(`Hapus ${selectedIds.value.length} item terpilih?`)) return
    await processDelete(selectedIds.value)
}

const changePage = (page) => {
    if (page >= 1 && page <= responseData.value.last_page) fetchData(page)
}

defineExpose({ fetchData })
onMounted(() => fetchData(1))
</script>