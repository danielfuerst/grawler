<script setup>
    import {
        ref
    } from 'vue'

    const center = ref([900000, 5900000])
    const projection = ref('EPSG:3857')
    const zoom = ref(9)
    const rotation = ref(0)
    const selected = ref('https://wmts100.geo.admin.ch/1.0.0/ch.swisstopo.pixelkarte-farbe/default/current/3857/{z}/{x}/{y}.jpeg')
</script>

<template>
    <div class="w-screen relative inset-x-1/2 bg-gray-200 overflow-hidden bg-white" style="margin-left: -50vw; margin-right: -50vw; height:700px">
        <ol-map
                :loadTilesWhileAnimating="true" :loadTilesWhileInteracting="true" style="height:700px" class="overflow-hidden" >

            <ol-view ref="view" :center="center" :rotation="rotation" :zoom="zoom" :projection="projection"/>

            <ol-tile-layer>
                <ol-source-xyz :url="selected"/>
            </ol-tile-layer>

        </ol-map>
    </div>
</template>
