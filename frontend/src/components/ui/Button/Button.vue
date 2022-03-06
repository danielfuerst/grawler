<template>
    <router-link v-if="routeTo"
                 role="button"
                 :class="buttonClasses"
                 :to="routeTo"
                 @click="click">
        <component v-if="iconLeftComponent" :is="iconLeftComponent" :class="iconLeftClasses" aria-hidden="true"/>
        {{ label }}
        <component v-if="iconRightComponent" :is="iconRightComponent" :class="iconRightClasses" aria-hidden="true"/>
    </router-link>
    <button v-else
            role="button"
            :class="buttonClasses"
            :disabled="disabled"
            @click="click">
        <component v-if="iconLeftComponent" :is="iconLeftComponent" :class="iconLeftClasses" aria-hidden="true"/>
        {{ label }}
        <component v-if="iconRightComponent" :is="iconRightComponent" :class="iconRightClasses" aria-hidden="true"/>
    </button>
</template>

<script>
    import {SIZES} from '../_constants/size.const';

    const Button = {
        name: 'Button',
        props: {
            label: {
                type: String,
                required: false,
                default: null,
            },
            icon: {
                type: String,
                required: false,
                default: null,
            },
            routeTo: {
                type: Object,
                required: false,
                default: null,
            },
            disabled: {
                type: Boolean,
                required: false,
                default: false,
            },
            size: {
                type: String,
                default: SIZES.MEDIUM,
                validator(value) {
                    return Object.values(SIZES).includes(value);
                },
            },
            iconLeftComponent: {
                required: false,
                default: null,
            },
            iconRightComponent: {
                required: false,
                default: null,
            },
        },
        computed: {
            buttonClasses() {
                const classes = {
                    'inline-flex': true,
                    'items-center': true,
                    'border': true,
                    'border-transparent': true,
                    'text-white': true,
                    'bg-indigo-600': true,
                    'hover:bg-indigo-700': true,
                    'focus:outline-none': true,
                    'focus:ring-2': true,
                    'focus:ring-offset-2': true,
                    'focus:ring-indigo-500': true,
                    'shadow-sm': true,
                    'font-medium': true,
                    'font-sans': true,
                };

                return Object.assign({}, classes, this.buttonSizeClasses);
            },
            buttonSizeClasses() {
                const sizeClasses = {
                    [SIZES.TINY]: {
                        'px-2.5': true,
                        'py-1.5': true,
                        'text-xs': true,
                        'rounded': true,
                    },
                    [SIZES.SMALL]: {
                        'px-3': true,
                        'py-2': true,
                        'text-sm': true,
                        'rounded-md': true,
                        'leading-4': true,
                    },
                    [SIZES.MEDIUM]: {
                        'px-4': true,
                        'py-2': true,
                        'text-sm': true,
                        'rounded-md': true,
                    },
                    [SIZES.LARGE]: {
                        'px-4': true,
                        'py-2': true,
                        'text-base': true,
                        'rounded-md': true,
                    },
                    [SIZES.XLARGE]: {
                        'px-6': true,
                        'py-3': true,
                        'text-base': true,
                        'rounded-md': true,
                    },
                }

                return sizeClasses[this.size];
            },
            iconLeftClasses() {
                const classes = {
                    'h-5': true,
                    'w-5': true,
                    'text-white': true,
                    '-ml-2': true,
                    'mr-2': true,
                };

                const sizeClasses = {
                    [SIZES.TINY]: {
                        '-ml-0.5': true,
                        'mr-2': true,
                    },
                    [SIZES.SMALL]: {
                        '-ml-0.5': true,
                        'mr-2': true,
                    },
                    [SIZES.MEDIUM]: {
                        '-ml-1': true,
                        'mr-2': true,
                    },
                    [SIZES.LARGE]: {
                        '-ml-2': true,
                        'mr-2': true,
                    },
                    [SIZES.XLARGE]: {
                        '-ml-2': true,
                        'mr-3': true,
                    },
                };

                return Object.assign({}, classes, sizeClasses[this.size]);
            },
            iconRightClasses() {
                const classes = {
                    'h-5': true,
                    'w-5': true,
                    'text-white': true,
                    '-mr-2': true,
                    'ml-2': true,
                };

                const sizeClasses = {
                    [SIZES.TINY]: {
                        '-mr-0.5': true,
                        'ml-2': true,
                    },
                    [SIZES.SMALL]: {
                        '-mr-0.5': true,
                        'ml-2': true,
                    },
                    [SIZES.MEDIUM]: {
                        '-mr-1': true,
                        'ml-2': true,
                    },
                    [SIZES.LARGE]: {
                        '-mr-2': true,
                        'ml-2': true,
                    },
                    [SIZES.XLARGE]: {
                        '-mr-2': true,
                        'ml-3': true,
                    },
                };

                return Object.assign({}, classes, sizeClasses[this.size]);
            },
        },
        methods: {
            click() {
                this.$emit('click');
            },
        },
    }

    export default Button;
</script>
