-- The MIT License (MIT)
--
-- Copyright (c) 2022 Álan Crístoffer e Sousa
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.


module Publications exposing (view)

import Element exposing (..)
import Element.Events exposing (onClick)
import Element.Font
import Html.Attributes
import Types exposing (..)


view : Model -> Element Msg
view model =
    publications model


publications : Model -> Element Msg
publications model =
    link
        [ alignRight
        , onClick (SetShowAbstract (not model.showAbstract))
        , Html.Attributes.class "font07rem" |> htmlAttribute
        ]
        { url = "#", label = text "Toggle Abstracts" }
        :: ([ ( 2022
              , [ ( "https://doi.org/10.1016/j.ifacol.2022.07.165", "E SOUSA, ÁLAN C.; MESSAI, NADHIR; MANAMANNI, NOUREDINNE (2022). SAFEProcess 2022: False Data Injection Detection in Cyber-Physical System. DOI: 10.1016/j.ifacol.2022.07.165", "The interconnectedness of the CPS allows sharing data with relevant systems and taking more informed process control decisions; however, it also broadens the attack surface. One pain point of IoT, technology usually applied in CPS, is that embedded devices are usually low energy and do not have enough processing power to operate while keeping up with security measures, such as encryption and data validation.  As a result, attackers may use such devices to launch attacks on the network, compromising the whole CPS infrastructure. One common type of attack is the False Data Injection (FDI), in which the attacker has access to a communication channel and can change the value read by a sensor or sent to an actuator. One way of coping with such attacks is to develop a bank of observer by using Functional Observers, which are better suited for high-dimensional, sparse systems. It does not suffer from sparsity's numerical problems and uses a reduced-order system to observe only the desired states, significantly reducing the computational burden of the observer. We propose an LMI-based approach to design a bank of residual generators for functional observers to detect such attacks. This approach has the advantage of using a reduced order arbitrary dynamic system, making it suitable for large-scale smart grids, and the use of LMI, allowing the easy insertion of restrictions." )
                , ( "https://doi.org/10.1016/j.ijcip.2022.100518", "E SOUSA, ÁLAN C.; MESSAI, NADHIR; MANAMANNI, NOUREDINNE (2022). International Journal of Critical Infrastructure Protection: Load-altering attack detection on smart grids using functional observers. DOI: 10.1016/j.ijcip.2022.100518", " Smart grids are becoming more common due to their capacity to accommodate secondary sources, like green energies from solar panels or wind farms. However, the attack surface also grows with more equipment in the network, making it necessary to secure appropriately. With more sensors distributed on the network, it becomes easier for an attacker to hack into one and send false information to the central to destabilize the power generation and distribution. Load-altering attacks do precisely that and have a destructive potential since the generator reaction can cause network instability. Traditional techniques, like those based on the Kalman filter, for example, may pose numerical issues due to the large size and sparsity of the system matrices, failing to provide good results or wasting computational resources. We propose an LMI-based approach to design a bank of residual generators for functional observers to detect such attacks. This approach has the advantage of using a reduced order arbitrary dynamic system, making it suitable for large-scale smart grids, and the use of LMI, allowing the easy insertion of restrictions." )
                , ( "https://doi.org/10.1007/s40313-021-00859-x", "E SOUSA, ÁLAN C.; LEITE, VALTER J. DE S.; LUCIA, WALTER; SILVA, LUÍS F. P. (2022). Journal of Control, Automation and Electrical Systems: Command Governor strategy based on region of attraction. DOI: 10.1007/s40313-021-00859-x", " The command governor (CG) is a useful strategy to avoid constraints violation in case of control reconfiguration or operational conditions changes, like switched systems mode changes. In general, the structure of the CG specializes in producing an alternative reference signal to drive a closed-loop system to the desired reference while avoiding constraints violations in the control signal, state-space, or combinations of them. In this paper, we propose a simple strategy that modifies the conventional structures of the CG and supervisor, yielding a switched rule based on the estimated controllers' region of attraction. We present some simulations to illustrate the proposal's potential and compare it with a competitor scheme exploiting a dwell-time approach. The results suggest that our approach adds new possibilities of CG and supervisor design, reducing the transition time between system modes and improving the closed-loop performance indexes." )
                ]
              )
            , ( 2020
              , [ ( "https://doi.org/10.48011/asba.v2i1.1516", "E SOUSA, ÁLAN C.; SILVA, LUÍS F. P.; LUCIA, WALTER; LEITE, VALTER J. DE S. (2020). XXIII Congresso Brasileiro de Automática: Command Governor strategy based on region of attraction control switching. DOI: 10.48011/asba.v2i1.1516", " The command governor (CG) is a useful strategy to avoid constraints violation in case of control reconfiguration or operational conditions changes, like switched systems mode changes. In general, the structure of the CG specializes in producing an alternative reference signal to drive a closed-loop system to the desired reference while avoiding constraints violations in the control signal, state-space, or combinations of them. In this paper, we propose a simple strategy that modifies the conventional structures of the CG and supervisor, yielding a switched rule based on the estimated controllers' region of attraction. We present some simulations to illustrate the proposal's potential and compare it with a competitor scheme exploiting a dwell-time approach. The results suggest that our approach adds new possibilities of CG and supervisor design, reducing the transition time between system modes and improving the closed-loop performance indexes." )
                , ( "https://cilamce.com.br/arearestrita/apresentacoes/198/7640.pdf", "FILHO, MARCIO R. O.; E SOUSA, ÁLAN C.; LEITE, VALTER J. DE S.; COSTA, EMERSON S. (2020). XLI CILAMCE: Control Of An Oven With Space-Distributed Sensors.", " PID controllers are robust and easily synthesized. The are many techniques that allow its tuning with simple steps, with or without a system model. The direct synthesis method allows us to find gain expressions in terms of the model parameters, using its canonical representation. We used a thermal system, available at the Signals and Systems Laboratory of CEFET-MG's campus V, which is composed of 9 sensors placed in series along an acrylic path with forced ventilation. Three resistances and a damper act as actuators for the system, heating the air and regulating its flow. We identified 1280 first-order models for this system, using different combinations of damper opening, resistance power and selected output sensor by using the complementary output method and used a subsample of those to create controllers using direct synthesis. We use a set of equations developed by ourselves and another set found in an article by Chen. We tested them in the real system with satisfactory results." )
                ]
              )
            , ( 2019, [ ( "https://acristoffers.me/Filho2019.pdf#view=FitH", "FILHO, MARCIO R. O.; E SOUSA, ÁLAN C.; COSTA, EMERSON S.; LEITE, VALTER J. DE S. (2019). XL CILAMCE: Prototype Modelling for Real Systems.", " Models represent physical phenomena mathematically. Through it, it's possible to obtain mathematical expressions that describe the behaviour of the real system, allowing, for example, to simulate its evolution in time as a response to some input stimulus without actually operating the real system. They also allow the creation of control laws that are mathematically correct and adequate to the system, allowing the development of formally correct and performant controllers. In this study, a system of coupled tanks, present in CEFET Campus V's Signals and System Analysis laboratory, was modelled in 6 different configurations. The system is composed of 4 water tanks, two on the top shelf and two on the bottom, with valves that allow the water to flow to its sibling or the one directly below it. The valves allow the user to chose how the water will flow through them. We developed a model for each configuration using physical laws of water flow in cylindrical recipients and estimated the values of the constants through tests. The models are represented using state-space, as it allows to identify the dynamics of the system internal energy, as well as the use of modern control techniques. Each model was validated against the real system to measure its correctness. The models obtained are available for students of the laboratory, both undergraduate and postgraduate, to streamline the study of system analysis and control theory." ) ] )
            , ( 2018, [ ( "https://doi.org/10.24846/v27i3y201802", "E SOUSA, ÁLAN C.; LEITE, VALTER J. S. ; RUBIO SCOLA, IGNACIO. Affordable Control Platform with MPC Application. Studies in Informatics and Control, v. 27, p. 265-274, 2018 DOI: 10.24846/v27i3y201802", " This paper presents a control platform developed to interface with various hardware, allowing the design and rapid implementation even of advanced controllers, both on academic and industrial systems. The code of the controllers is written in the open-source Python language, facilitating the translation of code usually written in commercial software. The proposed platform can use from Arduinos to Programmable Logic Controllers (PLCs). Beyond the research and tests on industrial facilities, the simplicity of the proposed platform allows its use also for educational and training purposes. Therefore, the proposed platform can help students focus on system analysis and control theory instead of hardware interfacing issues, while using low cost hardware. Developed in a client-server scheme, the platform can run in affordable computers while taking advantage of high-level mathematical and graphical tools available in Python language, allowing rapid implementation of advanced controllers. The use of this platform is illustrated with an implementation of a model predictive control (MPC) of a level control in a laboratory-scale process. A PLC is used to take the level measures, to dispatch control signals, and also for interlocking secure tasks. The controller runs on a Raspberry Pi computer that communicates with the PLC through an ethernet link." ) ] )
            , ( 2017, [ ( "https://www.ufrgs.br/sbai17/papers/paper_681.pdf#view=FitH", "LOPES, A. N. D. ; LEITE, V. J. S. ; SILVA, L. F. P. ; E SOUSA, ÁLAN. Estabilização Local De Sistemas Não-Lineares Via Modelagem Fuzzy Takagi-Sugeno Discreta No Tempo. In: XIII Simpósio Brasileiro de Automação Inteligente (SBAI), 2017, Porto Alegre - RS.", " The authors conduct experiments to locally stabilize a nonlinear system subject to actuator sat-uration. For that they utilize a real system of coupled tankswith a nonlinearity and sensors and actuators withindustrial characteristics. Takagi-Sugeno's fuzzy modeling is adopted to obtain a representation of this systemin discrete time. The studied controller is composed of a state feedback and a discrete integrator in time withfuzzy-type gains. However the adopted structure is not a PDC(parallel distributed compensation). The synthesisof the fuzzy gains is done via convex optimization procedures that aim to maximize the attraction region in thepresence of exogenous signals limited in amplitude. This allows the implementation of the reference tracking,ensuring the convergence of the controlled variable to the desired reference value. A PLC (programmable logic controller) is used for safety interlocking and also as an interface between the controlled system and the com-puter that implements the fuzzy controller in the Python language. Several experiments are carried out thatillustrate the feasibility of the proposal in an industrialenvironment without the need for greater investments inequipment." ) ] )
            ]
                |> List.concatMap (publicationYear model)
           )
        |> column [ width fill, spacing 24 ]


publicationYear : Model -> ( Int, List ( String, String, String ) ) -> List (Element Msg)
publicationYear model ( year, ps ) =
    el [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.bold ] (text (String.fromInt year))
        :: List.concatMap (publicationEntries model) ps


publicationEntries : Model -> ( String, String, String ) -> List (Element Msg)
publicationEntries model ( url, title, abstract ) =
    [ link
        [ Element.Font.size 18
        , Element.Font.bold
        ]
        { url = url, label = paragraph [] [ text title ] }
    , if model.showAbstract then
        paragraph
            [ Html.Attributes.class "font07rem" |> htmlAttribute
            , Html.Attributes.style "padding" "0 3rem" |> htmlAttribute
            , Element.Font.justify
            ]
            [ text abstract ]

      else
        none
    ]
