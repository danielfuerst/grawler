<script setup>
import { ref, computed } from 'vue';
import { SearchCircleIcon } from '@heroicons/vue/outline';
import {
    focusNextSibling,
    focusPreviousSibling,
} from '../../../composition/utilities.js';

const isSelectedLocal = ref(false);

const props = defineProps({
    modelValue: {
        type: String,
        default: '',
    },
    placeholder: {
        type: String,
        default: '',
    },
    autoCompleteSuggestions: {
        type: Array,
        default() {
            return [];
        },
    },
});

const emit = defineEmits(['update:modelValue']);

const value = computed({
    get() {
        return props.modelValue;
    },
    set(value) {
        emit('update:modelValue', value);
        isSelected.value = false;
    },
});

const isSelected = computed({
    get() {
        return isSelectedLocal.value;
    },
    set(value) {
        isSelectedLocal.value = value;
    },
});

function select(value) {
    this.value = value;
    isSelected.value = true;
}
</script>

<template>
    <div class="relative rounded-md shadow-sm">
        <div
            class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
            <SearchCircleIcon
                class="h-6 w-6 text-gray-400"
                aria-hidden="true" />
        </div>
        <input
            v-model="value"
            type="search"
            class="w-full min-w-0 appearance-none rounded-md border border-gray-300 bg-white pl-11 pb-2.5 pt-2.5 pr-4 text-base text-gray-800 placeholder-gray-500 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            :placeholder="placeholder" />
        <div class="relative mt-0.5">
            <ul
                v-if="
                    autoCompleteSuggestions &&
                    autoCompleteSuggestions.length &&
                    !isSelected &&
                    value.length
                "
                class="absolute left-0 right-0 z-10 max-h-60 overflow-auto rounded-b-md border-x border-b bg-white py-2 pl-3 pr-4 shadow-sm">
                <li
                    v-for="suggestion in autoCompleteSuggestions"
                    :key="suggestion"
                    class="group flex cursor-pointer items-start py-2 text-gray-400 hover:text-indigo-600 focus:text-indigo-600 focus:outline-none"
                    tabindex="0"
                    @click="select(suggestion)"
                    @keyup.enter="select(suggestion)"
                    @keyup.up="focusPreviousSibling"
                    @keyup.down="focusNextSibling">
                    <SearchCircleIcon
                        class="mt-0.5 h-6 w-6 flex-none"
                        aria-hidden="true" />
                    <span class="ml-2 flex-shrink">{{ suggestion }}</span>
                </li>
            </ul>
        </div>
    </div>
</template>
