<script setup>
import { ref } from 'vue';
import { navItems } from './../../routes/index.js';
import { XIcon } from '@heroicons/vue/outline';
import { MenuIcon } from '@heroicons/vue/outline';

const isMenuOpen = ref(false);

function toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
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
    block: true,
    'px-3': true,
    'py-2': true,
    'rounded-md': true,
    'text-base': true,
    'font-medium': true,
    'text-gray-300': true,
    'hover:bg-gray-700': true,
    'hover:text-white': true,
};
</script>
<template>
    <nav class="bg-gray-800">
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div class="flex h-16 items-center justify-between">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <router-link :to="{ name: 'home' }">
                            <img
                                class="h-8 w-8"
                                src="https://tailwindui.com/img/logos/workflow-mark-indigo-500.svg"
                                alt="Workflow" />
                        </router-link>
                    </div>
                    <div class="hidden md:block">
                        <div class="ml-10 flex items-baseline space-x-4">
                            <router-link
                                v-for="item in navItems"
                                :key="item.name"
                                active-class="bg-gray-900 text-white"
                                :to="{ name: item.name }"
                                :class="[navLinkClasses]"
                                aria-current="page"
                                >{{ item.title }}</router-link
                            >
                        </div>
                    </div>
                </div>
                <div class="-mr-2 flex md:hidden">
                    <!-- Mobile menu button -->
                    <button
                        type="button"
                        class="inline-flex items-center justify-center rounded-md bg-gray-800 p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
                        aria-controls="mobile-menu"
                        aria-expanded="false"
                        @click="toggleMenu">
                        <span class="sr-only">Open main menu</span>
                        <MenuIcon
                            v-if="!isMenuOpen"
                            class="block h-6 w-6"></MenuIcon>
                        <XIcon v-if="isMenuOpen" class="block h-6 w-6"></XIcon>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div v-if="isMenuOpen" id="mobile-menu" class="md:hidden">
            <div class="space-y-1 px-2 pt-2 pb-3 sm:px-3">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                <router-link
                    v-for="item in navItems"
                    :key="item.name"
                    active-class="bg-gray-900 text-white"
                    :to="{ name: item.name }"
                    :class="[mobileNavLinkClasses]"
                    aria-current="page"
                    @click="toggleMenu"
                    >{{ item.title }}</router-link
                >
            </div>
        </div>
    </nav>
</template>
