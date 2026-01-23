<script setup>
const props = defineProps({
    activeLayers: {
        type: Object,
        default: () => ({
            blok: false, infra: false, water: false, das: false, rain: false
        })
    },
    selectedInfra: { type: Array, default: () => [] },
    infraCategories: { type: Array, default: () => [] }
})

// 1. Definisikan level kebun di sini agar rapi
const blockLevels = [
    { label: 'Level 3', color: '#ef4444' },
    { label: 'Level 2', color: '#f97316' },
    { label: 'Level 1', color: '#22c55e' }
]
const infraType = [
    { label: 'Jembatan Kayu', color: '#59281E' },
    { label: 'NF', color: '#64748b' },
    { label: 'PVC', color: '#06b6d4' },

]

</script>

<template>
    <div v-if="Object.values(activeLayers).some(v => v)"
        class="absolute bottom-6 left-6 z-[80] bg-white/90 dark:bg-gray-900/90 backdrop-blur-md p-4 rounded-2xl shadow-2xl border border-gray-200 dark:border-gray-800  max-h-[70vh] overflow-y-auto pointer-events-auto">
        <div class="flex items-center justify-between mb-4 border-b border-gray-100 dark:border-gray-800 pb-2">
            <h3 class="text-xs font-black uppercase tracking-tighter text-gray-500 dark:text-gray-400">Legenda Peta</h3>
            <UIcon name="i-heroicons-information-circle" class="text-gray-400 w-4 h-4" />
        </div>

        <div class="space-y-5 flex gap-6">
            <section v-if="activeLayers.blok">
                <p class="text-[10px] font-bold text-gray-400 uppercase mb-2">Area Blok</p>
                <div class="flex gap-2 flex-col">
                    <div v-for="level in blockLevels" :key="level.label" class="flex items-center gap-3">
                        <div class="w-4 h-4 rounded shadow-sm" :style="{ backgroundColor: level.color }"></div>
                        <span class="text-xs font-medium text-gray-700 dark:text-gray-300">{{ level.label }}</span>
                    </div>
                    <div class="flex items-center gap-3">
                        <div class="w-4 h-4 rounded-full bg-white shadow-md"></div>
                        <span class="text-xs font-medium text-gray-700 dark:text-gray-300">Eksekusi/Bersih</span>
                    </div>
                    <div class="flex items-center gap-3">
                        <div class="w-4 h-4 rounded-full bg-red-600 shadow-md"></div>
                        <span class="text-xs font-medium text-gray-700 dark:text-gray-300">Eskalasi</span>
                    </div>
                </div>
            </section>
            <section v-if="activeLayers.infra">
                <p class="text-[10px] font-bold text-gray-400 uppercase mb-2">InfraStruktur</p>
                <div class="flex gap-2 flex-col">
                    <div v-for="level in infraType" :key="level.label" class="flex items-center gap-3">
                        <div class="w-4 h-4 rounded-full shadow-sm" :style="{ backgroundColor: level.color }"></div>
                        <span class="text-xs font-medium text-gray-700 dark:text-gray-300">{{ level.label }}</span>
                    </div>
                </div>
            </section>
            <section v-if="activeLayers.water">
                <p class="text-[10px] font-bold text-gray-400 uppercase mb-2">Water Level</p>
                <div class="flex gap-2 flex-col">
                    <div  class="flex items-center gap-3">
                        <div class="w-4 h-4 rounded-full shadow-sm" :style="{ backgroundColor: '#1e40af' }"></div>
                        <span class="text-xs font-medium text-gray-700 dark:text-gray-300">Water Level</span>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>