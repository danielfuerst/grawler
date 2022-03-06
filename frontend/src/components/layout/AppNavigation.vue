<script setup>
    import {ref} from 'vue'
    import { navItems } from './../../routes/index.js'
    import { XIcon } from '@heroicons/vue/outline'
    import { MenuIcon } from '@heroicons/vue/outline'

    const isMenuOpen = ref(false)

    function toggleMenu() {
        isMenuOpen.value = !isMenuOpen.value
    }

    const navLinkClasses = {
        'text-gray-300': true,
        'hover:bg-gray-700': true,
        'hover:text-white': true,
        'px-3': true,
        'py-2': true,
        'rounded-md': true,
        'text-sm': true,
        'font-medium': true,
    };

    const mobileNavLinkClasses = {
        'block': true,
        'px-3': true,
        'py-2': true,
        'rounded-md': true,
        'text-base': true,
        'font-medium': true,
        'text-gray-300':true,
        'hover:bg-gray-700': true,
        'hover:text-white': true,
    };



</script>
<template>
    <nav class="bg-gray-800">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <router-link :to="{ name: 'home' }">
                            <img class="h-8 w-8" src="https://tailwindui.com/img/logos/workflow-mark-indigo-500.svg" alt="Workflow">
                        </router-link>
                    </div>
                    <div class="hidden md:block">
                        <div class="ml-10 flex items-baseline space-x-4">
                            <router-link v-for="item in navItems" active-class="bg-gray-900 text-white" :to="{ name: item.name }"  :class="[navLinkClasses]" aria-current="page">{{ item.title }}</router-link>
                        </div>
                    </div>
                </div>
                <div class="-mr-2 flex md:hidden">
                    <!-- Mobile menu button -->
                    <button type="button"
                            class="bg-gray-800 inline-flex items-center justify-center p-2 rounded-md
                            text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2
                            focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white"
                            aria-controls="mobile-menu"
                            aria-expanded="false"
                            @click="toggleMenu">
                        <span class="sr-only">Open main menu</span>
                        <MenuIcon v-if="!isMenuOpen" class="block h-6 w-6"></MenuIcon>
                        <XIcon v-if="isMenuOpen" class="block h-6 w-6"></XIcon>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div v-if="isMenuOpen"
                class="md:hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                <router-link
                        v-for="item in navItems"
                        active-class="bg-gray-900 text-white"
                        :to="{ name: item.name }"
                        :class="[mobileNavLinkClasses]"
                        aria-current="page"
                        @click="toggleMenu">{{ item.title }}</router-link>
            </div>
        </div>
    </nav>
</template>
