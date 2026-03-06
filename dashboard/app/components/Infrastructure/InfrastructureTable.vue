<template>
  <div class="w-full mt-6 px-2 md:px-0">
    
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-6">
      <div class="relative w-full md:flex-1">
        
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

        <div v-else class="flex flex-col sm:flex-row gap-3 w-full">
            <div class="relative w-full sm:flex-1">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <svg class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </div>
                <input 
                  type="text" 
                  v-model="filters.search"
                  @input="handleSearch"
                  placeholder="Cari ID Objek..." 
                  class="w-full pl-10 pr-4 py-2.5 bg-white border border-gray-300 rounded-lg text-sm shadow-sm placeholder-gray-400 focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors"
                />
            </div>

            <div class="w-full sm:w-48">
                <select 
                  v-model="filters.category" 
                  @change="handleFilterChange"
                  class="w-full py-2.5 px-3 bg-white border border-gray-300 rounded-lg text-sm shadow-sm text-gray-700 focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors cursor-pointer"
                >
                  <option value="">Semua Kategori</option>
                  <option value="JEMBATAN KAYU">Jembatan Kayu</option>
                  <option value="NF">NF</option>
                  <option value="PVC">PVC</option>
                </select>
            </div>
        </div>
      </div>
    </div>

    <div class="bg-white border border-gray-200 rounded-lg shadow-sm overflow-hidden">
      
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
              <p class="text-gray-500 text-sm">Memuat data...</p>
           </div>

           <div v-else-if="!responseData.data || responseData.data.length === 0" class="p-8 text-center text-gray-500">
              <p>Data tidak ditemukan.</p>
           </div>

           <div v-else v-for="item in responseData.data" :key="'mob-'+item.id" class="p-4 hover:bg-gray-50 transition">
              <div class="flex items-start justify-between">
                <div class="flex items-center gap-3">
                   <input 
                      type="checkbox" 
                      v-model="selectedIds"
                      :value="item.id"
                      class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4" 
                   />
                   <div>
                      <p class="font-medium text-gray-900">{{ item.id_object }}</p>
                      
                      <p class="text-xs text-gray-500 mt-0.5">
                        Lokasi: 
                        <span v-if="item.lokasi_relation">
                           {{ item.lokasi_relation.afdeling }} - {{ item.lokasi_relation.blok }}
                        </span>
                        <span v-else>
                           {{ item.lokasi }}
                        </span>
                      </p>


                      <span class="inline-flex mt-2 items-center px-2 py-0.5 rounded text-xs font-medium bg-blue-100 text-blue-800 border border-blue-200">
                        {{ item.category }}
                      </span>
                   </div>
                </div>
              </div>
              
              <div class="mt-4 flex gap-3 pl-7">
                <button @click="$emit('edit', item.id)" class="text-sm font-medium text-blue-600 hover:text-blue-800 border border-blue-200 px-3 py-1 rounded bg-blue-50">
                  Edit
                </button>
                <button @click="deleteItem(item.id)" class="text-sm font-medium text-red-600 hover:text-red-800 border border-red-200 px-3 py-1 rounded bg-red-50">
                  Hapus
                </button>
              </div>
           </div>
        </div>
      </div>

      <div class="hidden md:block overflow-x-auto">
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
              <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">ID Objek</th>
              <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Lokasi</th>
              <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Latitude</th>
              <th scope="col" class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Longitude</th>
              <th scope="col" class="px-6 py-4 text-center text-xs font-semibold text-gray-500 uppercase tracking-wider">Kategori</th>
              <th scope="col" class="px-6 py-4 text-center text-xs font-semibold text-gray-500 uppercase tracking-wider">Aksi</th>
            </tr>
          </thead>

         <tbody class="bg-white divide-y divide-gray-200">
          <tr v-if="isLoading">
            <td colspan="5" class="px-6 py-20 text-center text-gray-500">
              Memuat data infrastruktur...
            </td>
          </tr>

          <tr v-else-if="!responseData.data || responseData.data.length === 0">
            <td colspan="5" class="px-6 py-24 text-center">
              <p class="text-lg font-medium text-gray-600 mb-1">Data tidak ditemukan.</p>
              <p class="text-sm text-gray-400">Coba ubah filter atau kata kunci pencarian.</p>
            </td>
          </tr>

          <tr v-else v-for="item in responseData.data" :key="item.id" class="hover:bg-gray-50 transition-colors">
            <td class="px-6 py-4 whitespace-nowrap">
              <input 
                type="checkbox" 
                v-model="selectedIds"
                :value="item.id"
                class="rounded border-gray-300 text-blue-600 focus:ring-blue-500 h-4 w-4 cursor-pointer" 
              />
            </td>
            
            <td class="px-6 py-4 text-sm text-gray-900 font-medium">{{ item.id_object }}</td>
            
            <td class="px-6 py-4 text-sm text-gray-500">
               <span v-if="item.lokasi && typeof item.lokasi === 'object'" class="bg-gray-100 px-2 py-1 rounded border border-gray-200 text-xs">
                  {{ item.lokasi.afdeling }} - {{ item.lokasi.blok }}
               </span>
               <span v-else>
                  {{ item.lokasi }}
               </span>
            </td>
            <td class="px-6 py-4 text-center text-sm text-gray-500">
              {{ item.lokasi ? item.latitude : '-' }}
            </td>
            <td class="px-6 py-4 text-center text-sm text-gray-500">
              {{ item.lokasi ? item.longitude : '-' }}
            </td>

            <td class="px-6 py-4 text-sm text-gray-500">
              <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                {{ item.category }}
              </span>
            </td>

            <td class="px-6 py-4 text-center text-sm font-medium">
              <button @click="$emit('edit', item.id)" class="text-blue-600 hover:text-blue-900 mr-4 font-semibold hover:underline">Edit</button>
              <button @click="deleteItem(item.id)" class="text-red-600 hover:text-red-900 font-semibold hover:underline">Hapus</button>
            </td>
          </tr>
        </tbody>
        </table>
      </div>

      <div v-if="responseData.total > 0" class="px-4 md:px-6 py-4 border-t border-gray-200 flex flex-col md:flex-row items-center justify-between gap-4">
        <div class="text-sm text-gray-500 text-center md:text-left">
          Menampilkan <span class="font-medium text-gray-900">{{ responseData.from }}</span> - <span class="font-medium text-gray-900">{{ responseData.to }}</span> dari <span class="font-medium text-gray-900">{{ responseData.total }}</span> data
        </div>
        
        <div class="flex space-x-2">
          <button 
            @click="changePage(responseData.current_page - 1)" 
            :disabled="responseData.current_page === 1"
            class="px-3 py-1.5 border border-gray-300 rounded text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 transition"
          >
            Kembali
          </button>
          <button 
            @click="changePage(responseData.current_page + 1)" 
            :disabled="responseData.current_page === responseData.last_page"
            class="px-3 py-1.5 border border-gray-300 rounded text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 transition"
          >
            Lanjut
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
  current_page: 1, 
  data: [], 
  from: 0, 
  last_page: 1, 
  per_page: 10, 
  to: 0, 
  total: 0
})

const filters = ref({ 
    search: '', 
    category: '' 
})

const selectedIds = ref([])

// Logic Select All
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

async function fetchData(page = 1) {
    isLoading.value = true
    try {
        const params = new URLSearchParams({
            page: page,
            search: filters.value.search,
            category: filters.value.category
        })
        
        const response = await useApi(`infrastructure-master?${params.toString()}`)
        if (response.current_page && response.data) {
             responseData.value = response
        } 
        else if (response.data && response.data.current_page) {
             responseData.value = response.data
        } 
        else {
             responseData.value = response
        }

    } catch (error) {
        console.error("Gagal mengambil data:", error)
        responseData.value = { current_page: 1, data: [], total: 0 } 
    } finally {
        isLoading.value = false
    }
}

let searchTimeout = null
const handleSearch = () => {
  if (searchTimeout) clearTimeout(searchTimeout)
  searchTimeout = setTimeout(() => fetchData(1), 500)
}

const handleFilterChange = () => {
    fetchData(1)
}

// Logic Hapus
const processDelete = async (idsToDelete) => {
    isDeleting.value = true
    try {
        await Promise.all(idsToDelete.map(id => 
             useApi(`infrastructure-master/${id}`, { method: 'DELETE' })
        ))

        selectedIds.value = selectedIds.value.filter(id => !idsToDelete.includes(id))
        
        // Refresh halaman dengan cerdas (mundur jika halaman kosong)
        const isLastItemOnPage = responseData.value.data.length === idsToDelete.length
        const pageToFetch = (isLastItemOnPage && responseData.value.current_page > 1) 
            ? responseData.value.current_page - 1 
            : responseData.value.current_page

        await fetchData(pageToFetch)
    } catch (error) {
        console.error("Gagal menghapus:", error)
        alert("Terjadi kesalahan saat menghapus data.")
    } finally {
        isDeleting.value = false
    }
}

const deleteItem = async (id) => {
    if (!confirm('Hapus data infrastruktur ini?')) return
    await processDelete([id])
}

const bulkDelete = async () => {
    if (selectedIds.value.length === 0) return
    if (!confirm(`Yakin ingin menghapus ${selectedIds.value.length} data terpilih?`)) return
    await processDelete(selectedIds.value)
}

const changePage = (page) => {
    if (page >= 1 && page <= responseData.value.last_page) fetchData(page)
}

defineExpose({ fetchData })
onMounted(() => fetchData(1))
</script>