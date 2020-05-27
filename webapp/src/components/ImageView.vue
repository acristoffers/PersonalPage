<template>
    <div id="imageviewer" v-if="image.length > 0">
        <div id="background">
            <img :src="image" />
        </div>
        <span id="close" @click="close()">x</span>
    </div>
</template>

<script lang="ts">
import _ from 'lodash';
import { Component, Vue } from 'vue-property-decorator';

Vue.prototype._ = _;

@Component
export default class ImageView extends Vue {
    get image(): string {
        return this.$store.state.image;
    }

    public close() {
        this.$store.dispatch('clrImage');
    }
}
</script>

<style scoped lang="scss">
#imageviewer {
    display: block;
    position: fixed;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
    text-align: center;

    #background {
        display: flex;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);
        flex-direction: column;
        justify-content: center;
        text-align: center;
    }

    img {
        max-height: 90%;
        object-fit: contain;
    }

    #close {
        position: fixed;
        right: 1rem;
        top: 1rem;
        color: white;
        font-size: 2rem;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
        cursor: pointer;
    }
}
</style>
