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
            <div class="function">Intern</div>
            <div class="date">03/2016 - 08/2016</div>
            <div class="desc">
              During this internship, I developed a platform to measure the
              power loss inside the kernel of the inductor used in a PFC
              circuit.
            </div>
          </div>
        </div>

        <div class="entry">
          <div>
            <img src="@/assets/cbmmg.png" />
          </div>
          <div class="content">
            <div class="title">Corpo de Bombeiros Militar de Minas Gerais</div>
            <div class="function">Soldado</div>
            <div class="date">01/2010 - 12/2013</div>
            <div class="desc">
              As a firefighter I was entitled to work as a first-aider and
              diver, being the first response in all sorts of accidents, from
              fire in the wilds to car accidents and industrial and natural
              disasters.
            </div>
          </div>
        </div>
      </div>

      <div class="education">
        <h1>{{$t('education')}}</h1>

        <div class="entry">
          <div>
            <img src="@/assets/cefet.png" />
          </div>
          <div class="content">
            <div class="title">Centro Federal de Educação Tecnológica de Minas Gerais</div>
            <div class="function">Graduação em Engenharia Mecatrônica</div>
            <div class="date">04/2013 - 07/2019</div>
            <div class="desc">
              As a student, I started taking part in activities in my second
              year, as part of the team that won the 3rd place in the Latin
              American Robotic Competition. After that, I helped the student
              representatives in some activities without becoming a member,
              until accepting to become the student representative in the
              Graduation Council. Since my first semester, I helped other
              students from graduation, master and Ph.D. with their projects,
              especially with programming.
              <br />
              <br />
              <ul class="gray">
                <li>Robotics studying group (2014)</li>
                <li>Tutor of Computer Programming for Mechatronic and IT (Technical Course) students (2014)</li>
                <li>3rd place in the Latin America Robotic Competition (2014)</li>
                <li>Student exchange at Université Joseph Fourier (Grenoble, France) (2015)</li>
                <li>Student exchange at Frankfurt University of Applied Sciences (Frankfurt, Germany) (2015/16)</li>
                <li>Scientific Initiation: low-cost process control platform (2017)</li>
                <li>Scientific Initiation: process control platform: an MPC implementation (2018)</li>
                <li>Student member of the Graduation Council in 2018</li>
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
            <div class="function">Exchange Student - Ciências Sem Fronteiras</div>
            <div class="date">06/2015 - 08/2017</div>
            <div class="desc">
              I studied as an exchange student through the Brazilian
              government's program Ciências Sem Fronteiras (Science Without
              Borders).
            </div>
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
            <div class="function">Exchange Student</div>
            <div class="date">01/2015 - 03/2015</div>
            <div class="desc">
              I studied as an exchange student through the partnership between
              UGA and CEFET-MG. There I worked in the robotics laboratory
              helping the team who won the second place in the National
              Instruments MyRIO Paris competition.
            </div>
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
