<template>
            <Header title="Water Management Dashboard"></Header>

    <div class="px-6">
        <StatsCard></StatsCard>
    <div class="grid md:grid-cols-2 grid-cols-1">
                <StatusChart></StatusChart>

        <AfdelingChart></AfdelingChart>
    </div>
    <div class="p-10">
            <RecentActivities class=""></RecentActivities>

    </div>
    </div>
    
    
</template>
<script setup>
import RecentActivities from '~/components/RecentActivities.vue';


</script>