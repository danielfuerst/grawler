<script setup>
    import {ref, defineProps, watch, defineEmits} from 'vue'
    import debounce from 'lodash.debounce';

    import Search from '../ui/Search/Search.vue';
    import Button from '../ui/Button/Button.vue';
    import { ArrowNarrowRightIcon } from '@heroicons/vue/solid'

    const searchQueryFrom = ref('');
    const searchQueryTo = ref('');

    const autoCompleteSuggestionsFrom = [];
    const autoCompleteSuggestionsTo = [];

    const props = defineProps({
        toAutocomplete: Array,
        fromAutocomplete: Array,
    });

    const emit = defineEmits(['search-from', 'search-to'])

    watch(searchQueryFrom, debounce((value) => {
        emit('search-from', value)
    }, 500));

    watch(searchQueryTo, debounce((value) => {
        emit('search-to', value)
    }, 500));

</script>

<template>
    <div class="flex flex-column flex-wrap md:flex-row md:flex-start items-center">
        <Search class="my-2 basis-full md:basis-auto"
                v-model="searchQueryFrom"
                :autoCompleteSuggestions="fromAutocomplete"
                placeholder="From"/>
        <ArrowNarrowRightIcon class="h-5 w-5 text-gray-400 mx-auto md:mx-3"/>
        <Search class="my-2 basis-full md:basis-auto md:mr-4"
                v-model="searchQueryTo"
                :autoCompleteSuggestions="toAutocomplete"
                placeholder="To"/>

        <Button class="py-2.5 mt-2.5 mb-3 w-full md:w-auto mx-auto md:mx-0 text-center md:text-left"
                size="large"
                label="Search connection"/>
    </div>
</template>
