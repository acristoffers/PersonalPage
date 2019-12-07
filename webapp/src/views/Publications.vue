<template>
  <div id="publications">
    <div class="center">
      <h1>2019</h1>
      <div class="publication">
        <h2>
          <a href="https://www.cilamce2019.com.br" target="_blank">
            FILHO, MARCIO R. O.; E SOUSA, ÁLAN C.; COSTA, EMERSON S.; LEITE,
            VALTER J. DE S. (2019). XL CILAMCE: Prototype Modelling for Real
            Systems.
          </a>
        </h2>
        <div class="abstract">
          Models represent physical phenomena mathematically. Through it, it's
          possible to obtain mathematical expressions that describe the
          behaviour of the real system, allowing, for example, to simulate its
          evolution in time as a response to some input stimulus without
          actually operating the real system. They also allow the creation of
          control laws that are mathematically correct and adequate to the
          system, allowing the development of formally correct and performant
          controllers. In this study, a system of coupled tanks, present in
          CEFET Campus V's Signals and System Analysis laboratory, was modelled
          in 6 different configurations. The system is composed of 4 water
          tanks, two on the top shelf and two on the bottom, with valves that
          allow the water to flow to its sibling or the one directly below it.
          The valves allow the user to chose how the water will flow through
          them. We developed a model for each configuration using physical laws
          of water flow in cylindrical recipients and estimated the values of
          the constants through tests. The models are represented using
          state-space, as it allows to identify the dynamics of the system
          internal energy, as well as the use of modern control techniques. Each
          model was validated against the real system to measure its
          correctness. The models obtained are available for students of the
          laboratory, both undergraduate and postgraduate, to streamline the
          study of system analysis and control theory.
        </div>
      </div>
      <h1>2018</h1>
      <div class="publication">
        <h2>
          <a
            href="https://sic.ici.ro/wp-content/uploads/2018/10/Art.-2-Issue-3-2018-SIC.pdf"
            target="_blank"
          >
            E SOUSA, ÁLAN C.; LEITE, VALTER J. S. ; RUBIO SCOLA, IGNACIO.
            Affordable Control Platform with MPC Application. Studies in
            Informatics and Control, v. 27, p. 265-274, 2018
          </a>
        </h2>
        <div class="abstract">
          This paper presents a control platform developed to interface with
          various hardware, allowing the design and rapid implementation even of
          advanced controllers, both on academic and industrial systems. The
          code of the controllers is written in the open-source Python language,
          facilitating the translation of code usually written in commercial
          software. The proposed platform can use from Arduinos to Programmable
          Logic Computers (PLCs). Beyond the research and tests on industrial
          facilities, the simplicity of the proposed platform allows its use
          also for educational and training purposes. Therefore, the proposed
          platform can help students focus on system analysis and control theory
          instead of hardware interfacing issues, while using low cost hardware.
          Developed in a client-server scheme, the platform can run in
          affordable computers while taking advantage of high-level mathematical
          and graphical tools available in Python language, allowing rapid
          implementation of advanced controllers. The use of this platform is
          illustrated with an implementation of a model predictive control (MPC)
          of a level control in a laboratory-scale process. A PLC is used to
          take the level measures, to dispatch control signals, and also for
          interlocking secure tasks. The controller runs on a Raspberry Pi
          computer that communicates with the PLC through an ethernet link.
        </div>
      </div>
      <h1>2017</h1>
      <div class="publication">
        <h2>
          <a href="https://www.ufrgs.br/sbai17/papers/paper_681.pdf" target="_blank">
            LOPES, A. N. D. ; LEITE, V. J. S. ; SILVA, L. F. P. ; e Sousa, Álan
            . ESTABILIZAÇÃO LOCAL DE SISTEMAS NÃO-LINEARES VIA MODELAGEM FUZZY
            TAKAGI-SUGENO DISCRETA NO TEMPO. In: Simpósio Brasileiro de
            Automação Inteligente (SBAI), 2017, Porto Alegre - RS. XIII Simpósio
            Brasileiro de Automação Inteligente, 2017.
          </a>
        </h2>
        <div class="abstract">
          The authors conduct experiments to locally
          stabilize a nonlinear system subject to actuator sat-uration. For that
          they utilize a real system of coupled tankswith a nonlinearity and
          sensors and actuators withindustrial characteristics. Takagi-Sugeno's
          fuzzy modeling is adopted to obtain a representation of this systemin
          discrete time. The studied controller is composed of a state feedback
          and a discrete integrator in time withfuzzy-type gains. However the
          adopted structure is not a PDC(parallel distributed compensation). The
          synthesisof the fuzzy gains is done via convex optimization procedures
          that aim to maximize the attraction region in thepresence of exogenous
          signals limited in amplitude. This allows the implementation of the
          reference tracking,ensuring the convergence of the controlled variable
          to the desired reference value. A PLC (programmable logiccontroller) is
          used for safety interlocking and also as an interface between the
          controlled system and the com-puter that implements the fuzzy controller
          in the Python language. Several experiments are carried out
          thatillustrate the feasibility of the proposal in an
          industrialenvironment without the need for greater investments
          inequipment.
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import _ from 'lodash';

@Component
export default class Publications extends Vue {}
</script>

<style scoped lang="scss">
#publications {
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

  .publication {
    padding-bottom: 1rem;
    h2 {
      font-size: 12pt;
    }

    .abstract {
      text-align: justify;
      margin-top: 0.5rem;
    }
  }
}
</style>
