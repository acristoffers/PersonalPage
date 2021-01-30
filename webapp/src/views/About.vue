<template>
  <div id="about">
    <div id="about-text">{{ ageStr }}. {{ $t('about_me') }}</div>

    <div id="links">
      <div class="section">
        <h1>&nbsp;</h1>
        <ul>
          <li v-for="i in _.toPairs(links)" :key="i[0]">
            <a target="_blank" :href="i[1]">{{ i[0] }}</a>
          </li>
        </ul>
      </div>

      <div class="section">
        <h1>{{ $t("contacts") }}</h1>
        <ul>
          <li v-for="i in _.toPairs(contacts)" :key="i[0]">
            <a target="_blank" :href="i[1]">{{ i[0] }}</a>
          </li>
        </ul>
      </div>

      <div class="section">
        <h1>{{ $t("languages") }}</h1>
        <ul>
          <li v-for="i in _.toPairs(languages)" :key="i[0]">
            {{ i[0] }} ({{ i[1] }})
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import _ from 'lodash';

Vue.prototype._ = _;

@Component
export default class About extends Vue {
  public contacts = {
    'Email': 'mailto:acristoffers@gmail.com',
    'Facebook': 'https://www.facebook.com/acristoffers',
    'Github': 'https://www.github.com/acristoffers',
    'Twitter': 'https://twitter.com/acristoffers',
    'Linkedin': 'https://www.linkedin.com/in/acristoffers',
    'Lattes': 'http://lattes.cnpq.br/0846174549224433',
    'Research Gate': 'https://www.researchgate.net/profile/Alan_E_Sousa',
  };

  public get links() {
    return {
      'Dissertation': 'Dissertation.pdf#view=FitH',
      'TCC': 'Monografia.pdf#view=FitH',
      'Apostila de Python 3': '/Python3.pdf#view=FitH',
      'Apostila de MATLAB': '/MATLAB.pdf#view=FitH',
      [this.$t('resume') as string]: '/resume.pdf#view=FitH',
      [this.$t('gpg_public_key') as string]: '/PublicKey.asc',
    };
  }

  public get languages() {
    return {
      [this.$t('pt') as string]: this.$t('native'),
      [this.$t('en') as string]: 'C1',
      [this.$t('de') as string]: 'C1',
      [this.$t('fr') as string]: 'B1',
    };
  }

  public year = new Date().getFullYear();
  public age =
    Date.now() - new Date(this.year, 1, 17).getTime() >= 0
      ? this.year - 1990
      : this.year - 1990 - 1;
  public get ageStr() {
    return this.$t('%d years old, Brazilian')
      .toString()
      .replace('%d', this.age.toString());
  }
}
</script>

<style scoped lang="scss">
#about {
  @media only screen and (min-device-width: 900px) {
    text-align: center;
  }

  #about-text {
    @media only screen and (min-device-width: 900px) {
      width: 70%;
      display: inline-block;
      font-size: 16pt;
    }

    text-align: justify;
    white-space: pre-line;
  }

  #links {
    @media only screen and (min-device-width: 900px) {
      margin-top: 1rem;
      width: 70%;
      font-size: 14pt;
      display: inline-flex;
      flex-direction: row;
      justify-content: space-around;
    }

    .section {
      line-height: 1.5;
      @media only screen and (min-device-width: 900px) {
        flex: 1;
        margin-left: 1rem;
        margin-right: 1rem;
      }

      @media only screen and (max-device-width: 900px) {
        &:first-of-type h1 {
          display: none;
        }
      }

      h1 {
        font-size: 16pt;
      }

      margin-top: 1rem;
      text-align: left;
      ul {
        list-style-type: none;

        li {
          padding-bottom: 12px;
          padding-top: 12px;
          border-bottom: 1px solid black;

          &:last-of-type {
            border-bottom: none;
          }
        }
      }
    }
  }
}
</style>
