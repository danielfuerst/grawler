<script setup>
    import {ref, defineProps, defineEmits, computed} from 'vue'
    import {SearchCircleIcon} from '@heroicons/vue/outline'

    const isSelectedLocal = ref(false);

    const props = defineProps({
        modelValue: String,
        placeholder: String,
        autoCompleteSuggestions: Array,
    });

    const emit = defineEmits(['update:modelValue'])

    const value = computed({
        get() {
            return props.modelValue
        },
        set(value) {
            emit('update:modelValue', value)
            isSelected.value = false;
        }
    })

    const isSelected = computed({
        get() {
            return isSelectedLocal.value;
        },
        set(value) {
            isSelectedLocal.value = value;
        }
    })

    function select(value) {
        this.value = value;
        isSelected.value = true;
    }
</script>

<template>
    <div class="relative rounded-md shadow-sm">
        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <SearchCircleIcon class="h-6 w-6 text-gray-400" aria-hidden="true"/>
        </div>
        <input type="search"
               class="pl-11 appearance-none min-w-0 w-full bg-white border border-gray-300
               rounded-md shadow-sm pb-2.5 pt-2.5 pr-4 text-base text-gray-800 placeholder-gray-500
               focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
               :placeholder="placeholder"
               v-model="value"
        />
        <div class="relative mt-0.5">
            <ul v-if="autoCompleteSuggestions && autoCompleteSuggestions.length && !isSelected && value.length"
                class="bg-white pl-3 pr-4 border-x border-b
                rounded-b-md shadow-sm py-2 absolute left-0
                right-0 z-10 max-h-60 overflow-auto">
                <li v-for="suggestion in autoCompleteSuggestions"
                    class="group flex py-2 text-gray-400 cursor-pointer
                    hover:text-indigo-600 items-start focus:outline-none focus:text-indigo-600"
                    @click="select(suggestion)"
                    @keyup.enter="select(suggestion)"
                    tabindex="0">
                    <SearchCircleIcon class="h-6 w-6 flex-none mt-0.5" aria-hidden="true"/>
                    <span class="ml-2 flex-shrink">{{ suggestion }}</span>
                </li>
            </ul>
        </div>
    </div>
</template>
