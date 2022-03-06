import { reactive, watchEffect } from 'vue';

export const searchLocationApi = () => {
    const state = reactive({
        searchQuery: '',
        loading: true,
        locations: [],
    });

    watchEffect(() => {
        const LOCATION_API_URL = `https://api3.geo.admin.ch/2111231107/rest/services/ech/SearchServer?sr=2056&searchText=${state.searchQuery}&lang=de&type=locations`;

        if (!state.searchQuery.length) {
            return;
        }

        fetch(LOCATION_API_URL)
            .then(response => response.json())
            .then(jsonResponse => {
                console.log(jsonResponse)
                state.locations = jsonResponse.results;
                state.loading = false;
            });
    });

    return state;
};
