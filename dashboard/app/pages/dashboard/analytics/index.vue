<template>
  <div class="min-h-screen bg-gray-50">
    <Header title="Analytics & Reports" />

    <main class=" md:p-6 space-y-6">
      
      <section>
        <AnalyticsCard />
      </section>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">  
        <div class="col-span-1 md:col-span-2">
          <WaterLevel />
        </div>
        <div class="col-span-1 md:col-span-2">
          <LocationTrends />
        </div>

        <InfrasturcturComponents />

        <LocationBasedAnalytics />
        <InfravsWL id="status" class="md:col-span-2 scroll-mt-40" />

     <div 
        id="daily-reports" 
        class="col-span-1 md:col-span-2 scroll-mt-24"
      >
        <WMScoringReports />
      </div>
        
      </div>
    </main>
  </div>
</template>

<script setup>
import { onMounted, nextTick } from 'vue';
import { useRoute } from 'vue-router'; // 1. Import useRoute

// Import Components
import WaterLevel from '~/components/Analytics/WaterLevel.vue';
import AnalyticsCard from '~/components/Analytics/AnalyticsCard.vue';
import InfrasturcturComponents from '~/components/Analytics/InfrasturcturComponents.vue';
import LocationBasedAnalytics from '~/components/Analytics/LocationBasedAnalytics.vue';
import LocationTrends from '~/components/Analytics/LocationTrends.vue';
import WMScoringReports from '~/components/Analytics/WMScoringReports.vue';
import InfravsWL from '~/components/Analytics/InfravsWL.vue';
const route = useRoute(); // 2. Inisialisasi route

onMounted(async () => {
  if (route.hash) {
    
    await nextTick();

    setTimeout(() => {
      const element = document.querySelector(route.hash);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    }, 300); 
  }
});
</script>