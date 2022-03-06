<script setup>
    import AppNavigation from './AppNavigation.vue';
    import { computed } from 'vue'
    import { useRoute } from 'vue-router';
    import { getNavTitleByRouteName } from './../../routes/index.js'

    const currentRouteName = computed(() => {
        return useRoute().name;
    })
</script>

<template>
    <div class="min-h-full">
        <AppNavigation />
        <header class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto py-4 px-4 sm:px-6 lg:px-8">
                <h1 class="text-lg leading-6 font-semibold text-gray-900">{{ getNavTitleByRouteName(currentRouteName)}}</h1>
            </div>
        </header>
    </div>
</template>
