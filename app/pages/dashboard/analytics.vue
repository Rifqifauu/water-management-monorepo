<template>
    <Header title="Analytics & Reports"></Header>
             <AnalyticsCard></AnalyticsCard>

    <div class="grid grid-cols-1 md:grid-cols-2">
    <WaterLevel class="col-span-2"></WaterLevel>
    <InfrasturcturComponents></InfrasturcturComponents>
    <InfrastructureTimeline></InfrastructureTimeline>
    <InfrastructurevsWaterLevel></InfrastructurevsWaterLevel>
    <LocationBasedAnalytics></LocationBasedAnalytics>
    <InfrastructureDetailsReport class="col-span-2"></InfrastructureDetailsReport>
    <WaterLevelMeasurementReport class="col-span-2"></WaterLevelMeasurementReport>
    </div>
   
</template>
<script setup>
import WaterLevel from '~/components/Analytics/WaterLevel.vue';
import AnalyticsCard from '~/components/Analytics/AnalyticsCard.vue';
import InfrasturcturComponents from '~/components/Analytics/InfrasturcturComponents.vue';
import InfrastructureTimeline from '~/components/Analytics/InfrastructureTimeline.vue';
import InfrastructurevsWaterLevel from '~/components/Analytics/InfrastructurevsWaterLevel.vue';
import LocationBasedAnalytics from '~/components/Analytics/LocationBasedAnalytics.vue';
import InfrastructureDetailsReport from '~/components/Analytics/InfrastructureDetailsReport.vue';
import WaterLevelMeasurementReport from '~/components/Analytics/WaterLevelMeasurementReport.vue';

</script>