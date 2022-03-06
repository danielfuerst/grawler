<script setup>
import { computed } from 'vue';

import SearchConnection from '../components/connection/SearchConnection.vue';
import Map from '../components/geo/Map.vue';

import { searchLocationApi } from '../api/search-location.api.js';

const stateFrom = searchLocationApi();
const stateTo = searchLocationApi();

function handleSearchFrom(searchQuery) {
    stateFrom.loading = true;
    stateFrom.searchQuery = searchQuery;
}

function handleSearchTo(searchQuery) {
    stateTo.loading = true;
    stateTo.searchQuery = searchQuery;
}

function handleSearch() {
    alert('search');
}

const locationsFrom = computed(() => {
    if (!(stateFrom && stateFrom.locations)) {
        return null;
    }

    return stateFrom.locations.map((l) =>
        l.attrs.label.replace(/<\/?[^>]+(>|$)/g, '')
    );
});

const locationsTo = computed(() => {
    if (!(stateTo && stateTo.locations)) {
        return null;
    }

    return stateTo.locations.map((l) =>
        l.attrs.label.replace(/<\/?[^>]+(>|$)/g, '')
    );
});
</script>

<template>
    <div class="my-7 px-8">
        <SearchConnection
            :to-autocomplete="locationsTo"
            :from-autocomplete="locationsFrom"
            @search-from="handleSearchFrom"
            @search-to="handleSearchTo"
            @search="handleSearch" />
    </div>
    <Map />
</template>
