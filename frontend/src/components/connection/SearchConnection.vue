<script setup>
import { ref, watch } from 'vue';
import debounce from 'lodash.debounce';

import Search from '../ui/Search/Search.vue';
import Button from '../ui/Button/Button.vue';
import { ArrowNarrowRightIcon } from '@heroicons/vue/solid';

const searchQueryFrom = ref('');
const searchQueryTo = ref('');

defineProps({
    toAutocomplete: {
        type: Array,
        default() {
            return [];
        },
    },
    fromAutocomplete: {
        type: Array,
        default() {
            return [];
        },
    },
});

const emit = defineEmits(['search-from', 'search-to', 'search']);

watch(
    searchQueryFrom,
    debounce((value) => {
        emit('search-from', value);
    }, 500)
);

watch(
    searchQueryTo,
    debounce((value) => {
        emit('search-to', value);
    }, 500)
);

function search() {
    if (
        !(
            searchQueryTo.value &&
            searchQueryFrom.value &&
            searchQueryTo.value.length &&
            searchQueryFrom.value.length
        )
    ) {
        return;
    }

    console.log('search dfdfa');
    emit('search');
}
</script>

<template>
    <div
        class="flex-column md:flex-start flex flex-wrap items-center md:flex-row">
        <Search
            v-model="searchQueryFrom"
            class="my-2 basis-full md:basis-auto"
            :auto-complete-suggestions="fromAutocomplete"
            placeholder="From" />
        <ArrowNarrowRightIcon
            tabindex="-1"
            class="mx-auto h-5 w-5 text-gray-400 md:mx-3" />
        <Search
            v-model="searchQueryTo"
            class="my-2 basis-full md:mr-4 md:basis-auto"
            :auto-complete-suggestions="toAutocomplete"
            placeholder="To" />

        <Button
            class="mx-auto mt-2.5 mb-3 w-full py-2.5 text-center md:mx-0 md:w-auto md:text-left"
            size="large"
            label="Search connection"
            @clicked="search" />
    </div>
</template>
