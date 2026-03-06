<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
    activeLayers: {
        type: Object,
        default: () => ({
            blok: false, infra: false, water: false, 
        })
    },
    selectedInfra: { type: Array, default: () => [] },
    infraCategories: { type: Array, default: () => [] }
})

const isOpen = ref(true)

// Data Legenda - Terpusat agar mudah diubah
const LEGEND_DATA = {
    blocks: [
        { label: 'Level 3', color: '#ef4444', type: 'square' },
        { label: 'Level 2', color: '#f97316', type: 'square' },
        { label: 'Level 1', color: '#22c55e', type: 'square' },
        { label: 'Eksekusi/Bersih', color: '#ffffff', type: 'circle', border: true },
        { label: 'Eskalasi', color: '#dc2626', type: 'circle' }
    ],
    infra: [
        { label: 'Jembatan Kayu', color: '#59281E' },
        { label: 'NF', color: '#64748b' },
        { label: 'PVC', color: '#06b6d4' },
    ],
    water: [
        { label: 'Water Level ', color: '#1e40af' }
    ]
}

const hasActiveLayer = computed(() => Object.values(props.activeLayers).some(v => v))
</script>

<template>
    <div v-if="hasActiveLayer"
        class="absolute bottom-6 left-6 z-[80] flex flex-col items-start gap-2 pointer-events-none">
        
        <Transition
            enter-active-class="transition duration-300 ease-out"
            enter-from-class="opacity-0 -translate-x-4"
            enter-to-class="opacity-100 translate-x-0"
            leave-active-class="transition duration-200 ease-in"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0 -translate-x-4"
        >
            <button 
                v-if="!isOpen"
                @click="isOpen = true"
                class="pointer-events-auto flex items-center gap-1.5 bg-white dark:bg-gray-950 px-3 py-1.5 rounded-lg shadow-md border border-gray-200 dark:border-gray-800 text-[10px] font-bold uppercase tracking-wider text-gray-700 dark:text-gray-200 hover:bg-gray-50 transition-all active:scale-95"
            >
                <UIcon name="i-heroicons-list-bullet" class="w-3.5 h-3.5 text-primary-500" />
                Legenda
            </button>
        </Transition>

        <Transition
            enter-active-class="transition duration-300 ease-out"
            enter-from-class="opacity-0 scale-95 translate-y-5" 
            enter-to-class="opacity-100 scale-100 translate-y-0"
            leave-active-class="transition duration-200 ease-in"
            leave-from-class="opacity-100 scale-100"
            leave-to-class="opacity-0 scale-95 translate-y-5"
        >
            <div v-if="isOpen"
                class="pointer-events-auto bg-white/95 dark:bg-gray-950/95 backdrop-blur-md rounded-xl shadow-xl border border-gray-200 dark:border-gray-800 w-full max-w-[280px] md:max-w-none overflow-hidden"
            >
                <div class="flex items-center justify-between px-3 py-2 border-b border-gray-100 dark:border-gray-800 bg-gray-50/50 dark:bg-gray-900/50">
                    <div class="flex items-center gap-1.5">
                        <div class="w-1 h-3 bg-primary-500 rounded-full"></div>
                        <h3 class="text-[9px] font-black uppercase tracking-widest text-gray-500 dark:text-gray-400">Legenda Peta</h3>
                    </div>
                    <button @click="isOpen = false" class="p-1 hover:bg-gray-200 dark:hover:bg-gray-800 rounded-md transition-colors group">
                        <UIcon name="i-heroicons-x-mark" class="text-gray-400 group-hover:text-gray-600 w-3.5 h-3.5" />
                    </button>
                </div>

                <div class="p-4 flex flex-col md:flex-row gap-5 max-h-[50vh] overflow-y-auto custom-scrollbar">
                    
                    <section v-if="activeLayers.blok" class="min-w-[120px]">
                        <p class="text-[9px] font-bold text-gray-400 dark:text-gray-500 uppercase mb-2.5">Area Blok</p>
                        <div class="space-y-2">
                            <div v-for="item in LEGEND_DATA.blocks" :key="item.label" class="flex items-center gap-2.5 group">
                                <div 
                                    class="w-3 h-3 flex-shrink-0 shadow-sm transition-transform group-hover:scale-110" 
                                    :class="[
                                        item.type === 'circle' ? 'rounded-full' : 'rounded-[3px]',
                                        item.border ? 'border border-gray-200 dark:border-gray-700' : ''
                                    ]"
                                    :style="{ backgroundColor: item.color }"
                                ></div>
                                <span class="text-[11px] font-medium text-gray-700 dark:text-gray-300">{{ item.label }}</span>
                            </div>
                        </div>
                    </section>

                    <section v-if="activeLayers.infra" class="md:border-l border-gray-100 dark:border-gray-800 md:pl-5 min-w-[120px]">
                        <p class="text-[9px] font-bold text-gray-400 dark:text-gray-500 uppercase mb-2.5">Infrastruktur</p>
                        <div class="space-y-2">
                            <div v-for="item in LEGEND_DATA.infra" :key="item.label" class="flex items-center gap-2.5 group">
                                <div class="w-3 h-3 rounded-full flex-shrink-0 shadow-sm transition-transform group-hover:scale-110" 
                                     :style="{ backgroundColor: item.color }">
                                </div>
                                <span class="text-[11px] font-medium text-gray-700 dark:text-gray-300">{{ item.label }}</span>
                            </div>
                        </div>
                    </section>

                    <section v-if="activeLayers.water" class="md:border-l border-gray-100 dark:border-gray-800 md:pl-5 min-w-[120px]">
                        <p class="text-[9px] font-bold text-gray-400 dark:text-gray-500 uppercase mb-2.5">Water Level</p>
                        <div class="space-y-2">
                            <div v-for="item in LEGEND_DATA.water" :key="item.label" class="flex items-center gap-2.5 group">
                                <div class="w-3 h-3 rounded-full flex-shrink-0 shadow-sm bg-blue-600 transition-transform group-hover:scale-110 animate-pulse-slow">
                                </div>
                                <span class="text-[11px] font-medium text-gray-700 dark:text-gray-300">{{ item.label }}</span>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </Transition>
    </div>
</template>

<style scoped>
@reference '~/assets/css/main.css'
/* Styling Scrollbar */
.custom-scrollbar::-webkit-scrollbar {
    width: 5px;
}
.custom-scrollbar::-webkit-scrollbar-track {
    background: transparent;
}
.custom-scrollbar::-webkit-scrollbar-thumb {
    @apply bg-gray-200 dark:bg-gray-800 rounded-full;
}

/* Animasi Pulse Pelan untuk Water Level */
@keyframes pulse-slow {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.7; transform: scale(1.05); }
}
.animate-pulse-slow {
    animation: pulse-slow 3s infinite ease-in-out;
}

/* Memastikan text alignment pas dengan titik */
.leading-none {
    line-height: 1rem;
}
</style>