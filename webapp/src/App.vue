<template>
  <div id="app">
    <main>
      <Navigation />
      <transition name="component-fade" mode="out-in" :duration="500">
        <router-view class="view" />
      </transition>
    </main>
    <footer>© Copyright 2019 Álan Crístoffer</footer>
    <div vw class="enabled">
      <div vw-access-button class="active"></div>
      <div vw-plugin-wrapper>
        <div class="vw-plugin-top-wrapper"></div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Navigation from '@/components/Navigation.vue';

@Component({
  components: { Navigation },
})
export default class App extends Vue {
  private widget: any;

  public mounted() {
    const url = 'https://vlibras.gov.br/app';
    this.widget = new (window as any).VLibras.Widget(url);

    const page = localStorage.getItem('path');
    if (page != null) {
      this.$router.push(page);
      localStorage.removeItem('path');
    }
  }
}
</script>

<style lang="scss">
html,
body {
  width: 100%;
  height: 100%;
  font-family: "Times New Roman", Times, serif;
  font-size: 12pt;
}

* {
  margin: 0;
  padding: 0;
}

a,
a:hover,
a:visited {
  color: inherit;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

.component-fade-enter-active,
.component-fade-leave-active {
  transition: opacity 0.3s ease;
}
.component-fade-enter, .component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

@media only screen and (max-device-width: 900px) {
  #app {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;

    footer {
      text-align: center;
      background-color: black;
      color: white;
      height: 2rem;
      line-height: 2rem;
    }

    .view {
      padding: 1rem;
    }
  }
}

@media only screen and (min-device-width: 900px) {
  #app {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;

    main {
      flex: 1;
      display: flex;
      flex-direction: row;
      overflow: auto;
    }

    footer {
      text-align: right;
      background-color: black;
      color: white;
      height: 2rem;
      line-height: 2rem;
      padding-right: 1rem;
    }

    .view {
      flex: 1;
      padding: 1rem;
      overflow: auto;
    }
  }
}
</style>
