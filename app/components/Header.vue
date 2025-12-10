<script setup>
import { computed } from 'vue';

const props = defineProps({
    title: {
        type: String,
        default: 'Dashboard Overview'
    }
});

// 2. Membuat format tanggal hari ini
const dateToday = computed(() => {
    const date = new Date();
    return new Intl.DateTimeFormat('id-ID', {
        weekday: 'long',
        year: 'numeric',
        month: 'short',
        day: 'numeric',
    }).format(date);
});
</script>

<template>
    <div class="sticky top-0 z-30 flex h-auto w-full justify-between bg-white px-4 py-4 shadow-md md:h-36 md:px-8 md:py-6 transition-all duration-300">
        
        <div class="flex w-full flex-col gap-4 md:flex-row md:items-center md:justify-between md:gap-0">
            
            <div class="flex items-center gap-3 md:gap-4"> 
                <div
                    class="flex  items-center justify-center rounded-xl border border-gray-100 bg-white shadow-[0_4px_12px_rgba(0,0,0,0.1)] md:h-16 md:w-16 md:rounded-2xl">
                    <img src="/logo_triputra.png" alt="Triputra Agro Persada Logo" class="h-8 w-8 md:h-10 md:w-10 object-contain">
                </div>
                
                <div>
                    <h1 class="text-xl font-bold text-slate-800 md:text-4xl">{{ props.title }}</h1>
                    
                    <div class="flex items-center gap-2 text-sm font-medium text-slate-500">
                        <svg class="h-3 w-3 md:h-4 md:w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                            </path>
                        </svg>
                        <p class="text-xs md:text-lg">{{ dateToday }}</p>
                    </div>
                </div>
            </div>

            <div class="border-t border-slate-100 pt-2 text-left md:border-t-0 md:pt-0 md:text-right">
                <h2 class="text-sm font-bold uppercase text-black md:text-2xl">Triputra Agro Persada</h2>
                <p class="text-xs font-semibold tracking-wide text-slate-400 md:text-md">
                    © GIS & SURVEY DIVISION
                </p>
            </div>
        </div>

    </div>
</template>