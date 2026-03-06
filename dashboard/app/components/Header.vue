<script setup>
import { ref, onMounted } from 'vue';

const props = defineProps({
    title: {
        type: String,
        default: 'Dashboard Overview'
    }
});

// Gunakan ref kosong dulu untuk menghindari error "Hydration Mismatch"
const dateToday = ref('');

// Generate tanggal hanya setelah browser siap
onMounted(() => {
    const date = new Date();
    dateToday.value = new Intl.DateTimeFormat('id-ID', {
        weekday: 'long',
        year: 'numeric',
        month: 'short',
        day: 'numeric',
    }).format(date);
});
</script>

<template>
    <div class="sticky top-0 z-30 w-full bg-white px-3 py-3 shadow-md md:px-8 md:py-6 transition-all duration-300">
        
        <div class="flex w-full flex-col gap-3 md:flex-row md:items-center md:justify-between md:gap-4">
            
            <!-- Logo dan Title Section -->
            <div class="flex items-center gap-2 md:gap-4 min-w-0 flex-1"> 
                <div class="flex shrink-0 items-center justify-center rounded-lg border border-gray-100 
                            bg-gradient-to-br from-blue-200 to-green-200
                            shadow-[0_4px_12px_rgba(0,0,0,0.1)] 
                            h-10 w-20 md:h-16 md:w-32 md:rounded-2xl p-1.5 md:p-2">
                    
                    <img 
                        src="/logo-nama.png" 
                        alt="Triputra Agro Persada Logo" 
                        class="w-full h-full object-contain"
                    >
                </div>
                
                <div class="min-w-0 flex-1">
                    <h1 class="text-base font-bold text-slate-800 md:text-4xl truncate">{{ props.title }}</h1>
                    
                    <div class="flex items-center gap-1.5 text-sm font-medium text-slate-500">
                        <svg class="h-3 w-3 md:h-4 md:w-4 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                            </path>
                        </svg>
                        <p class="text-xs md:text-lg truncate">{{ dateToday }}</p>
                    </div>
                </div>
            </div>

            <!-- Company Info Section -->
            <div class="border-t border-slate-100 pt-2 text-left md:border-t-0 md:pt-0 md:text-right shrink-0">
                <h2 class="text-xs font-bold uppercase text-black md:text-2xl">Triputra Agro Persada</h2>
                <p class="text-[10px] font-semibold tracking-wide text-slate-400 md:text-base">
                    © GIS & SURVEY DIVISION
                </p>
            </div>
        </div>

    </div>
</template>