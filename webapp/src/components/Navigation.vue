<template>
  <div id="nav">
    <div id="header">
      <img src="@/assets/me.jpg" ref="avatar" />
      <p class="name">
        Álan
        <br />Crístoffer
        <br />
        <strong>e Sousa</strong>
      </p>
    </div>

    <ul id="langs">
      <li v-for="lang in langs" :key="lang" @click="loadLanguageAsync(lang)">
        <img :title="$t(lang)" :src="require(`../assets/${lang}.svg`)" :alt="$t(lang)" />
      </li>
    </ul>
    <div id="background" ref="bg">
      <div class="arrow-right"></div>
      <div class="white-bg"></div>
    </div>
    <ul id="links">
      <li
        v-for="link in links"
        :key="link"
        :class="isActiveRoute(link)"
        @mouseover="menuItemHover"
        @mouseout="menuItemOut"
      >
        <router-link :to="`/${link}`">{{$t(link)}}</router-link>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { loadLanguageAsync } from '../i18n';
import { setTimeout } from 'timers';

@Component
export default class Navigation extends Vue {
  public langs = ['pt', 'en', 'de', 'fr'];
  public loadLanguageAsync = loadLanguageAsync;
  public links = ['about', 'projects', 'publications', 'experience'];

  public isActiveRoute(route: string): string[] {
    const current = this.$router.currentRoute;
    const given = this.$router.resolve(`/${route}`).route;

    if (current.name === given.name) {
      return ['current'];
    } else {
      return [];
    }
  }

  public menuItemHover(event: any) {
    (this.$refs.bg as any).style.top = `${event.currentTarget.offsetTop}px`;
  }

  public menuItemOut() {
    const element = document.getElementsByClassName('current')[0] as any;
    (this.$refs.bg as any).style.top = `${element.offsetTop}px`;
  }

  protected mounted() {
    this.$router.afterEach((to, from) => {
      this.$forceUpdate();
    });

    (this.$refs.avatar as any).addEventListener('load', this.menuItemOut);
    this.menuItemOut();
  }
}
</script>

<style scoped lang="scss">
#nav {
  @media only screen and (min-device-width: 900px) {
    width: 300px;
    display: inline-block;
  }

  background-color: rgb(0, 122, 204);
  background-image: url(./../assets/bg.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  color: white;

  #header {
    padding-top: 1rem;
    padding-left: 1rem;
  }

  img {
    width: 125px;
    height: 125px;
    border-radius: 0.5rem;
  }

  p.name {
    display: inline-block;
    vertical-align: text-bottom;
    padding-left: 0.5rem;
    font-size: 2rem;
    word-wrap: break-word;
  }

  ul {
    list-style-type: none;
    text-align: center;

    &#langs {
      margin: 1rem;

      li {
        display: inline-block;

        img {
          @media only screen and (min-device-width: 900px) {
            width: 32px;
            height: 22px;
          }

          @media only screen and (max-device-width: 900px) {
            width: 48px;
            height: 32px;
          }

          object-fit: fill;
          margin-left: 12px;
          cursor: pointer;
        }
      }
    }

    &#links {
      margin-top: 2rem;
      padding-bottom: 0.5rem;
      z-index: 1;

      li {
        position: relative;
        padding: 0.5rem;
        font-size: 1.5rem;
        transition: color 1s;
        &:hover {
          color: #e82d00;
        }
      }

      li.current {
        color: #e82d00;
      }
    }
  }

  #background {
    position: absolute;
    left: 0;
    height: 3rem;
    z-index: 0;
    transition: top 0.2s;
    display: flex;

    @media only screen and (min-device-width: 900px) {
      width: 300px;
    }

    @media only screen and (max-device-width: 900px) {
      right: 0;
    }
  }

  .arrow-right {
    width: 0;
    height: 0;
    margin-left: 5px;
    border-top: 1.5rem solid white;
    border-bottom: 1.5rem solid white;
    border-left: 1.5rem solid transparent;
  }

  .white-bg {
    background-color: white;
    flex: 1;
  }
}
</style>
