<script setup>
import { ref } from 'vue';

const center = ref([900000, 5900000]);
const projection = ref('EPSG:3857');
const zoom = ref(9);
const rotation = ref(0);
const selected = ref(
    'https://wmts100.geo.admin.ch/1.0.0/ch.swisstopo.pixelkarte-farbe/default/current/3857/{z}/{x}/{y}.jpeg'
);

const drawstart = (event) => {
    console.log(event);
};

const drawend = (event) => {
    console.log(event);
};
</script>

<template>
    <div
        class="relative inset-x-1/2 w-screen overflow-hidden bg-gray-200 bg-white"
        style="margin-left: -50vw; margin-right: -50vw; height: 700px">
        <ol-map
            :load-tiles-while-animating="true"
            :load-tiles-while-interacting="true"
            style="height: 700px"
            class="overflow-hidden">
            <ol-view
                ref="view"
                :center="center"
                :rotation="rotation"
                :zoom="zoom"
                :max-zoom="19"
                :min-zoom="9"
                :projection="projection" />

            <ol-tile-layer>
                <ol-source-xyz :url="selected" />
            </ol-tile-layer>

            <ol-vector-layer>
                <ol-source-vector :projection="projection">
                    <ol-interaction-draw
                        type="Point"
                        @drawend="drawend"
                        @drawstart="drawstart">
                    </ol-interaction-draw>
                </ol-source-vector>

                <ol-style>
                    <ol-style-stroke color="red" :width="2"></ol-style-stroke>
                    <ol-style-fill
                        color="rgba(255,255,255,0.1)"></ol-style-fill>
                    <ol-style-circle :radius="4">
                        <ol-style-fill color="blue"></ol-style-fill>
                    </ol-style-circle>
                </ol-style>
            </ol-vector-layer>
            <ol-zoom-control />
            <ol-fullscreen-control />
            <ol-scaleline-control />
        </ol-map>
    </div>
</template>
