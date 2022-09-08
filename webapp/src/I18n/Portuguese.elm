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


module I18n.Portuguese exposing (translations)

import Dict exposing (Dict)
import Types exposing (..)


translations : Dict String TranslationDictionary
translations =
    Dict.fromList
        [ ( "title", TString "Álan Crístoffer" )
        , ( "public", TString "Público" )
        , ( "gpg_public_key", TString "Chave GPG pública" )
        , ( "age_public_key", TString "Chave AGE pública" )
        , ( "pt", TString "Português" )
        , ( "en", TString "Inglês" )
        , ( "fr", TString "Francês" )
        , ( "de", TString "Alemão" )
        , ( "native", TString "Nativo" )
        , ( "about_me", TString "Sou estudante de doutorado trabalhando na minha tese entitulada \"Detecção de ataques em sistemas cyber-físicos distribuídos: Aplicação em Fábricas Inteligentes\". Sou uma pessoa introvertida que gosta de ambientes cooperativos. Gosto de programar (para automatizar tarefas chatas) e aprender línguas (para ficar calado nelas)." )
        , ( "languages", TString "Idiomas" )
        , ( "tests_database_desc", TString "Gerencia um banco de questões e facilita a geração e correção de provas." )
        , ( "tb_ss1_desc", TString "Este aplicativo foi desenvolvido para o estado de Minas Gerais, para gerenciar as provas aplicadas aos recrutas bem como provas anuais." )
        , ( "tb_ss2_desc", TString "Ele permite que eles gerem as provas fácilmente, usando uma interface simples, que permite gerar testes personalizados, escolhendo o número e níveis de dificuldade das questões, se serão objetivas ou discursivas e pode embaralhar as questões e respostas, enquanto mantém o gabarito fácil de conferir." )
        , ( "tb_ss3_desc", TString "As questões podem ser adicionas em um editor de texto rico, que permite a criação de questões estilizadas." )
        , ( "and", TString "e" )
        , ( "cefss_desc", TString "Código fonte do mínimo necessário para usar o Chromium Embedded Framework versões 1 e 3. Cria uma janela, carrega um arquivo HTML e cria ligações bidirecionais entre Javascript e C++ para mostrar o básico de um aplicativo C++ com interface HTML." )
        , ( "ahio_desc", TString "ahio é uma biblioteca de comunicação cujo objetivo é facilitar a conexão com vários hardwares de I/O de forma a possibilitar a mudança de hardware com mudanças mínimas de código." )
        , ( "moirai_desc", TString "Moirai é o backend da plataforma de controle. Ela é desenvolvida como parte do meu projeto de iniciação científica, entitulado Plataformas de baixo custo para controle de processos, desenvolvido no CEFET-MG sob a supervisão do Prof. Dr. Valter Leite. O projeto é desenvolvido através do apoio da FAPEMIG. Controladores para esse projeto são escritos em Python 3 e podem usar qualquer biblioteca disponível no sistema. Ele já depende da NumPy e SciPy, que são comumente utilizadas. A plataforma gerencia a interface com o hardware através da biblioteca ahio. Desta forma, adicionar novos hardwares é tão simples quanto criar um novo driver pra ahio. Tempo de execução, amostragem, leitura de entradas e atualização das saídas são gerenciadas pela aplicação e permitem que você foque no seu controlador/modelo." )
        , ( "lachesis_desc", TString "Lachesis é o frontend da plataforma de controle. Esta aplicação permite configurar o hardware, executar testes de resposta do sistema e executar controladores com uma interface fácil de usar. Os sinais de entrada e saída utilizados, assim como as variáveis, podem ser vistos graficamente, atualizando em tempo real. Ele funciona apenas como frontend, o que significa que todos os dados são armazenados e gerenciados no/pelo servidor moirai. O servidor também é responsável pela execução do controlador. Isso significa que você pode instalar o moirai em um computador dedicado, como um Raspberry Pi e o Lachesis em outro, usando o Lachesis como um controle remoto para o seu sistema de controle. Isso permite que vários usuários compartilhem a configuração da planta." )
        , ( "lachesis1_desc", TString "Configurar o hardware é tão fácil quanto preencher um formulário." )
        , ( "lachesis2_desc", TString "Visualize a forma de onda de controle antes de executar testes de loop aberto." )
        , ( "lachesis3_desc", TString "Basta escolher o tempo de amostragem, a duração da execução e as entradas. Não precisa se preocupar em lidar com isso. Agora você pode se concentrar no seu controlador, que pode ser escrito em Python 3, uma linguagem de programação moderna e de alto nível." )
        , ( "lachesis4_desc", TString "Visualize entradas, saídas e variáveis registradas graficamente em tempo real. Quando o teste terminar, os dados podem ser exportados para JSON, CSV e MAT." )
        , ( "tracker_desc", TString "Aplicativo para rastrear pacotes usando o site dos Correios como backend. Não funciona mais, já que não faz sentido atualizá-lo agora que os Correios têm seu próprio aplicativo. No entanto, o código-fonte é mantido no GitHub para referência." )
        , ( "void_desc", TString "Void é um armazenamento criptografado. Você pode criptografar/descriptografar arquivos de/para o armazenamento. A criptografia é realizada pelo NSS/NSPR usando AES_GCM_256, SHA512, PKCS5_PBKDF2, HMAC_SHA512 com um custo de 250000. A própria loja tem uma chave derivada de sua senha e cada arquivo tem sua própria chave aleatória também. No disco, todos os arquivos criptografados recebem um nome de hash salgado, com 128 dígitos. Arquivos grandes (50MB) são divididos em partes menores." )
        , ( "void1_desc", TString "Você pode criptografar arquivos e pastas e até mesmo definir metadados como tags e comentários." )
        , ( "void2_desc", TString "Arquivos de texto podem ser editados dentro do aplicativo usando o editor Ace, que suporta temas e realce de sintaxe para 161 idiomas." )
        , ( "void3_desc", TString "Você pode pesquisar arquivos comparando seu caminho, tags e comentários." )
        , ( "void4_desc", TString "Vídeos podem ser reproduzidos de dentro do aplicativo, sem tocar no disco. As imagens também podem ser exibidas em forma de carrossel." )
        , ( "sigaa_desc", TString "WebScrapper que extrai as notas no site do SIGAA do CEFET-MG, permitindo que os alunos tenham suas notas, frequências e horários em um único lugar, e disponíveis offline." )
        , ( "sigaa_notas1_desc", TString "O aluno pode selecionar seu vínculo, caso haja mais de um." )
        , ( "sigaa_notas2_desc", TString "As notas de todas as disciplinas são exibidas em uma única interface." )
        , ( "sigaa_notas3_desc", TString "Os horários são exibidos por dia, em ordem, facilitando a leitura." )
        , ( "sigaa_notas4_desc", TString "A frequência também é exibida em uma única tela, mas lembre-se que só é exibido o que o professor lança!" )
        , ( "%d years old, Brazilian", TString "%d anos, Brasileiro" )
        , ( "contacts", TString "Contatos" )
        , ( "skills", TString "Competências" )
        , ( "site_languages", TString "Idioma da página" )
        , ( "$skills", TString "Análise e Controle de Sistemas, C/C++, Python, Kotlin, Montagem, MATLAB, Desenvolvimento Android, Frontend, Backend, Embarcado, Automação, Robótica" )
        , ( "about", TString "Sobre" )
        , ( "resume", TString "Currículo" )
        , ( "projects", TString "Projetos" )
        , ( "publications", TString "Publicações" )
        , ( "experience", TString "Formação" )
        , ( "experience_title", TString "Experiência" )
        , ( "education", TString "Formação" )
        , ( "intern", TString "Estagiário" )
        , ( "acal_desc", TString "Durante este estágio desenvolvi uma plataforma para medir a perda interna de energia de um núcleo de um circuito de correção de fator de potência." )
        , ( "soldier", TString "Soldado" )
        , ( "cbmmg_desc", TString "Como soldado minhas atribuições eram, principalmente, de primeiros socorros e mergulhador, sendo a primeira resposta em todo tipo de ocorrências, desde incêndios florestais até acidentes automotivos e desastres industriais ou naturais." )
        , ( "eng_meca", TString "Graduação em Engenharia Mecatrônica" )
        , ( "mes_control", TString "Mestrado em Engenharia Elétrica" )
        , ( "cefet_mes_desc", TString "Mestrando sob orientação do Prof. Dr. Valter Leite e coorientação do Prof. Dr. Walter Lucia, pesquisando controle tolerante a falhas em sistemas chaveados com restrições nos estados." )
        , ( "cefet_desc", TString "Como estudante, comecei a participar de atividades no meu segundo ano, como parte do grupo de estudo de robótica, ocupando o terceiro lugar na Competição Latino-Americana de Robótica de 2014. Em seguida ajudei o DA sem me associar, até aceitar me tornar o representante discente no Conselho de Graduação. Desde o primeiro semestre ajudei estudantes de graduação e mestrado com seus projetos, especialmente com programação." )
        , ( "exchange_student", TString "Intercambista" )
        , ( "fuas_desc", TString "Estudei como intercambista pelo programa Ciências Sem Fronteiras fomentado pela CAPES." )
        , ( "uga_desc", TString "Intercambista pela parceria entre UGA e CEFET/MG. Trabalhei no laboratório de robótica ajudando o time que ficou em segundo lugar na competição da National Instruments, em Paris." )
        , ( "phd_control", TString "Doutorado em Automação e Tratamento de Sinal" )
        , ( "phd_desc", TString "Doutorando sob a orientação do Prof. Dr. Nadhir Messai e do Prof. Dr. Nouredinne Manamanni, com tese entitulada \"Detecção de ataques em sistemas cyber-físicos distribuídos: Aplicação em Fábricas Inteligentes\".)" )
        , ( "cefet_items"
          , TList
                [ "GER - Grupo de Estudos em Robótica (2014)"
                , "Monitor de programação I e II para alunos da graduação e do curso técnico de informática (2014)"
                , "3º lugar na Competição Latino-Americana de Robótica (LARC/2014)"
                , "Intercambista na Université Joseph Fourier (Grenoble, França) (2015)"
                , "Intercambista na Frankfurt University of Applied Sciences (Frankfurt, Alemanha) (2015/16)"
                , "Iniciação Científica: Plataforma de baixo custo para controle de processos (2017)"
                , "Iniciação Científica: Plataforma para controle de processos: implementação de um controlador MPC (2018)"
                , "Representante discente no Conselho de Graduação (2018/19)"
                , "Coorientador do BIC-Júnior 'Modelagem de planta pra controle de processos' (2018)"
                , "Coorientador do BIC-Júnior 'Modelagem de um forno com sensores distribuídos no espaço' (2019)"
                , "Coorientador do BIC-Júnior 'Controle de um sistema de tanques interconectados' (2019)"
                ]
          )
        ]
