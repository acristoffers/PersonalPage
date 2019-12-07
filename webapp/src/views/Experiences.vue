<template>
  <div id="experiences">
    <div class="center">
      <div class="professional">
        <h1>{{$t('experience_title')}}</h1>

        <div class="entry">
          <div>
            <img src="@/assets/acal.jpg" />
          </div>
          <div class="content">
            <div class="title">Acal BFi Germany GmbH</div>
            <div class="function">{{$t('intern')}}</div>
            <div class="date">03/2016 - 08/2016</div>
            <div class="desc">{{$t('acal_desc')}}</div>
          </div>
        </div>

        <div class="entry">
          <div>
            <img src="@/assets/cbmmg.png" />
          </div>
          <div class="content">
            <div class="title">Corpo de Bombeiros Militar de Minas Gerais</div>
            <div class="function">{{$t('soldier')}}</div>
            <div class="date">01/2010 - 12/2013</div>
            <div class="desc">{{$t('cbmmg_desc')}}</div>
          </div>
        </div>
      </div>

      <div class="education">
        <h1>{{$t('education')}}</h1>

        <div class="entry">
          <div>
            <img src="@/assets/cefet-ufsj.jpg" />
          </div>
          <div class="content">
            <div class="title">
              Centro Federal de Educação Tecnológica de Minas
              Gerais / Universidade Federal de São Jõal Del Rey
            </div>
            <div class="function">{{$t('mes_control')}}</div>
            <div class="date">08/2019 -</div>
            <div class="desc">{{$t('cefet_mes_desc')}}</div>
          </div>
        </div>

        <div class="entry">
          <div>
            <img src="@/assets/cefet.png" />
          </div>
          <div class="content">
            <div class="title">Centro Federal de Educação Tecnológica de Minas Gerais</div>
            <div class="function">{{$t('eng_meca')}}</div>
            <div class="date">04/2013 - 07/2019</div>
            <div class="desc">
              {{$t('cefet_desc')}}
              <br />
              <br />
              <ul class="gray">
                <li v-for="item in $t('cefet_items')" :key="item">{{item}}</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="entry">
          <div>
            <img src="@/assets/fuas.png" />
          </div>
          <div class="content">
            <div class="title">Frankfurt University Of Applied Sciences</div>
            <div class="function">{{$t('exchange_student')}} - Ciências Sem Fronteiras</div>
            <div class="date">06/2015 - 08/2017</div>
            <div class="desc">{{$t('fuas_desc')}}</div>
          </div>
        </div>

        <div class="entry">
          <div>
            <img src="@/assets/uga.png" />
          </div>
          <div class="content">
            <div class="title">
              Université Joseph Fourier (now Université
              Grenoble Alpes)
            </div>
            <div class="function">{{$t('exchange_student')}}</div>
            <div class="date">01/2015 - 03/2015</div>
            <div class="desc">{{$t('uga_desc')}}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import _ from 'lodash';

@Component
export default class Experiences extends Vue {}
</script>

<style scoped lang="scss">
#experiences {
  text-align: center;

  @media only screen and (min-device-width: 900px) {
    .center {
      display: inline-block;
      width: 70%;
      text-align: left;
    }
  }

  h1 {
    font-size: 16pt;
    margin: 1rem 0;
  }

  .gray {
    color: gray;
  }

  .entry {
    display: flex;
    margin: 1rem 0;

    img {
      width: 64px;
      height: auto;
    }

    .content {
      text-align: left;
      flex: 1;
      padding-left: 1rem;

      div {
        line-height: 1.5;
      }

      .title {
        font-size: 14pt;
        font-weight: bold;
      }

      .date {
        color: gray;
      }

      .desc {
        text-align: justify;
      }
    }
  }
}
</style>
