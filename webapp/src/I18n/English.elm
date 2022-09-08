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


module I18n.English exposing (translations)

import Dict exposing (Dict)
import Types exposing (..)


translations : Dict String TranslationDictionary
translations =
    Dict.fromList
        [ ( "title", TString "Álan Crístoffer" )
        , ( "public", TString "Public" )
        , ( "gpg_public_key", TString "GPG Public Key" )
        , ( "age_public_key", TString "AGE Public Key" )
        , ( "pt", TString "Portuguese" )
        , ( "en", TString "English" )
        , ( "fr", TString "French" )
        , ( "de", TString "German" )
        , ( "native", TString "Native" )
        , ( "about_me", TString "I'm a Ph.D. student working on my thesis titled \"Attack detection on distributed cyber-physical systems: applications on smart factories\". I'm an introverted person who likes cooperative environments. I enjoy programming (so I can automate the boring tasks) and learning languages (so I can be silent in them)." )
        , ( "languages", TString "Languages" )
        , ( "tests_database_desc", TString "Manage questions and print tests." )
        , ( "tb_ss1_desc", TString "This application was developed for the firefighter corporation of the state of Minas Gerais, Brazil, to manage the tests applied to the newcomers, as well as anual tests." )
        , ( "tb_ss2_desc", TString "It lets them generate the tests using a simple interface, generating tests by question level or manual selection, objective or discursive, and can generate tests with question and answers in a random order, while keeping it easy to grade." )
        , ( "tb_ss3_desc", TString "Questions can be added with a WYSIWYG text field, which allows the creation of tests with rich styling." )
        , ( "and", TString "and" )
        , ( "cefss_desc", TString "Source code for bare-minimum applications to get started with Chromium Embedded Framework versions 1 and 3. Sets up a window, loads a HTML file and creates bidirectional binding between Javascript and C++ to show the very basic of a C++ application with HTML UI." )
        , ( "ahio_desc", TString "ahio is a communication library whose goal is to abstract the interfacing with various I/O hardwares, so that changing hardware becomes possible with minimum code modification." )
        , ( "moirai_desc", TString "Moirai is the backend of the control platform. It is developed as part of my scientific initiation project, named Plataformas de baixo custo para controle de processos (low-cost platform for process control), developed at CEFET-MG (Brazil) under the supervision of Prof. Dr. Valter Leite. The project was developed through a FAPEMIG scholarship. Controllers for this platform are written in Python 3 and can use any librarie available in the computer where moirai is running. It already depends on NumPy and SciPy, as they are commonly used. This platform manages the hardware interfacing through the ahio libray, so extending it's hardware capabilities is a question of extending AHIO, which should be simple. Execution time, sampling time, input querying and output updating is managed by the application and let's you focus on your controller/model." )
        , ( "lachesis_desc", TString "Lachesis is the frontend of the control platform. This application allows you to configure the hardware, execute system response tests and run controllers with an easy to use interface. The used input and output signals, as well as variables, can be seen graphically, updating in real time. It works only as a frontend, meaning that all data is stored and managed in/by the moirai server. The server is also responsible for executing the controller. That means that you can install moirai in a dedicated computer, like a Raspberry Pi, and Lachesis in another one, using Lachesis like a remote control for your control system. This allows various user to share plant configuration." )
        , ( "lachesis1_desc", TString "Setting up the hardware is as easy as filling a form." )
        , ( "lachesis2_desc", TString "Visualize the control waveform before running open-loop tests." )
        , ( "lachesis3_desc", TString "Simply choose the sampling time, execution duration and inputs. No need to worry about handling those. Now you can focus on your controller, which can be written in Python 3, a high-level and modern programming language." )
        , ( "lachesis4_desc", TString "Visualize inputs, outputs and logged variables graphically in real-time. When the test is finished the data can be exported to JSON, CSV and MAT." )
        , ( "tracker_desc", TString "Application to track packages using Correios site as backend. It doesn't work anymore as it makes no sense to update it now that Correios has its own application. However, the source code is kept on GitHub for reference." )
        , ( "void_desc", TString "Void is an encrypted store. You can encrypt/decrypt files from/to the store. Encryption is carried out by NSS/NSPR using AES_GCM_256, SHA512, PKCS5_PBKDF2, HMAC_SHA512 with a cost of 250000. The store itself has a key derived from your password and each file has its own random key too. In disk all encrypted files get a salted-hash name, 128 digits long. Large files (50MB) are divided into smaller parts." )
        , ( "void1_desc", TString "You can encrypt files and folders, and even set metadata like tags and comments." )
        , ( "void2_desc", TString "Text files can be edited inside the application using the Ace editor, which supports theming and syntax highlight for 161 languages." )
        , ( "void3_desc", TString "You can search files by matching their path, tags and comments." )
        , ( "void4_desc", TString "Videos can be played from inside the application, without touching the disk. Images can also be displayed carousel-like." )
        , ( "sigaa_desc", TString "WebScrapper that extracts grades from CEFET-MG's SIGAA portal, allowing students to see their grades, schedules and frequency in one interface, even when offline." )
        , ( "sigaa_notas1_desc", TString "The student can select their immatriculation, when there is more than one." )
        , ( "sigaa_notas2_desc", TString "Grades from all subjects are displayed in a single interface." )
        , ( "sigaa_notas3_desc", TString "Schedules are shown by day, in order, making it easy to read them." )
        , ( "sigaa_notas4_desc", TString "Frequency is also available on a single screen, but remember that it only shows what the professor inputs!" )
        , ( "%d years old, Brazilian", TString "%d years old, Brazilian" )
        , ( "contacts", TString "Contacts" )
        , ( "skills", TString "Skills" )
        , ( "site_languages", TString "Language of the page" )
        , ( "$skills", TString "System Analysis and Control, C/C++, Python, Kotlin, Assembly, MATLAB, Android Development, Frontend, Backend, Embedded, Automation, Robotics" )
        , ( "about", TString "About" )
        , ( "resume", TString "Curriculum Vitae" )
        , ( "projects", TString "Projects" )
        , ( "publications", TString "Publications" )
        , ( "experience", TString "Education" )
        , ( "experience_title", TString "Experience" )
        , ( "education", TString "Education" )
        , ( "intern", TString "Intern" )
        , ( "acal_desc", TString "During this internship, I developed a platform to measure the power loss inside the kernel of the inductor used in a PFC circuit." )
        , ( "soldier", TString "Soldier" )
        , ( "cbmmg_desc", TString "As a firefighter I was entitled to work as a first-aider and diver, being the first response in all sorts of accidents, from fire in the wilds to car accidents and industrial and natural disasters." )
        , ( "eng_meca", TString "Mecatronics Engineering Graduation" )
        , ( "mes_control", TString "Master in Electrical Engineering" )
        , ( "cefet_mes_desc", TString "A master student under the guidance of Prof. Dr. Valter Leite and Prof. Dr. Walter Lucia, researching fault-tolerant control in state-restricted switched systems." )
        , ( "cefet_desc", TString "As a student, I started taking part in activities in my second year, as part of the team that won the 3rd place in the Latin American Robotic Competition. After that, I helped the student representatives in some activities without becoming a member, until accepting to become the student representative in the Graduation Council. Since my first semester, I helped other students from graduation and master with their projects, especially with programming." )
        , ( "exchange_student", TString "Exchange Student" )
        , ( "fuas_desc", TString "I studied as an exchange student through the Brazilian government's program Ciências Sem Fronteiras (Science Without Borders)." )
        , ( "uga_desc", TString "I studied as an exchange student through the partnership between UGA and CEFET-MG. There I worked in the robotics laboratory helping the team who won the second place in the National Instruments MyRIO Paris competition." )
        , ( "phd_control", TString "PhD in Automation and Signal Processing" )
        , ( "phd_desc", TString "Doctorate student under the guidance of Prof. Dr. Nadhir Messai and Prof. Dr. Nouredinne Manamanni, with thesis titled \"Attack detection on distributed cyber-physical systems: applications on smart factories\".)" )
        , ( "cefet_items"
          , TList
                [ "Robotics studying group (2014)"
                , "Tutor of Computer Programming for Mechatronic and IT (Technical Course) students (2014)"
                , "3rd place in the Latin America Robotic Competition (2014)"
                , "Student exchange at Université Joseph Fourier (Grenoble, France) (2015)"
                , "Student exchange at Frankfurt University of Applied Sciences (Frankfurt, Germany) (2015/16)"
                , "Scientific Initiation: low-cost process control platform (2017)"
                , "Scientific Initiation: process control platform: a MPC implementation (2018)"
                , "Student member of the Graduation Council (2018/19)"
                , "Advisor of a BIC-Jr entitled 'System modelling for process control' (2018)"
                , "Advisor of a BIC-Jr entitled 'Modelling of an oven with space-distributed parameters' (2019)"
                , "Advisor of a BIC-Jr entitled 'Control of a coupled tanks system' (2019)"
                ]
          )
        ]
