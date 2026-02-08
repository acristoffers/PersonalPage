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

module I18n.French exposing (translations)

import Dict exposing (Dict)
import Types exposing (..)

translations : Dict String TranslationDictionary
translations =
    Dict.fromList
        [ ( "title", TString "Álan Crístoffer" )
        , ( "public", TString "Public" )
        , ( "gpg_public_key", TString "Clè GPG publique" )
        , ( "age_public_key", TString "Clè AGE publique" )
        , ( "pt", TString "Portugais" )
        , ( "en", TString "Anglais" )
        , ( "fr", TString "Français" )
        , ( "de", TString "Allemand" )
        , ( "native", TString "Maternelle" )
        , ( "about_me", TString "Je suis ingénieur en mécatronique et je développe des tracteurs autonomes chez Vitibot. J'aime l'informatique, la technologie, la programmation et les langues. J'utilise des technologies telles que Linux, Nix et Neovim, car elles me permettent de les personnaliser et d'automatiser des tâches. J'apprécie également l'enseignement, le mentorat et j'aime aider les gens à résoudre des problèmes, en particulier ceux liés à la programmation ou à la technologie." )
        , ( "languages", TString "Langues" )
        , ( "tests_database_desc", TString "Gérer les questions et imprimer les preuves." )
        , ( "tb_ss1_desc", TString "Cette application a été développé pour la société de pompiers de l'état de Minas Gerais, au Brésil, pour gérer les preuves appliquées aux nouveaux arrivants, ainsi que les preuves annuelles." )
        , ( "tb_ss2_desc", TString "Il leur permet de générer des preuves en utilisant une interface simple, en générant des preuves par niveau de question ou par selection manuelle, objectif ou discursive et aussi peut générer des preuves avec des questions et des réponses dans un ordre aléatoire, tout en gardant une simple correction." )
        , ( "tb_ss3_desc", TString "Les questions peuvent être ajoutées avec un champ de texte WYSIWYG, qui permettent la création de preuves avec un format riche." )
        , ( "and", TString "et" )
        , ( "cefss_desc", TString "Le code source des applications minimales pour commencer avec les versions de Chromium Embedded Framework versions 1 et 3. Mettre en place une fenêtre, charger un fichier HTML et créer une liaison entre Javascript et C++ bidirectionnel pour montrer une application très basique en C++ avec HTML UI." )
        , ( "ahio_desc", TString "ahio est une bibliothèque de communication dont le but est de faire l’abstraction de l'interfaçage avec plusieurs matériaux d’entrées/sorties (I/O), pour reusir un changement de matériel  avec un minimum de modifications du code." )
        , ( "tree_sitter_matlab_desc", TString "Grammaire Tree-sitter pour MATLAB, conçue pour un parsing fidèle aligné sur la syntaxe officielle de MATLAB. Elle permet des fonctionnalités avancées d’éditeur comme la navigation structurelle, le pliage de code, l’indentation et les requêtes sémantiques, fournissant une base solide pour des outils de développement modernes." )
        , ( "ledger_nvim_desc", TString "Plugin Neovim orienté Lua pour travailler avec des fichiers Ledger, avec un parseur robuste doté d’un AST documenté et un formatage déterministe. Inclut des outils de productivité comme des assistants de sélection, des rapports quotidiens et la création rapide d’entrées pour fluidifier les workflows financiers." )
        , ( "cgen_desc", TString "Générateur CLI déclaratif qui produit des complétions shell (Fish, Bash, Zsh) et des pages man à partir d’une seule spécification YAML. Il prend en charge des hiérarchies de commandes complexes, une modélisation riche des arguments, des complétions dynamiques et des comportements spécifiques aux shells, pour des interfaces en ligne de commande cohérentes et maintenables." )
        , ( "dbkp_desc", TString "Outil CLI déclaratif pour sauvegarder et restaurer des dotfiles via une configuration basée sur TOML, avec chiffrement optionnel. Il prend en charge la capture de fichiers, de répertoires et de sorties de commandes, permettant des instantanés d’environnement reproductibles versionnables avec Git, le stockage cloud ou des workflows de sauvegarde personnalisés." )
        , ( "gnome_rectangle_desc", TString "Extension GNOME Shell offrant l’ancrage et le pavage des fenêtres avec des raccourcis clavier hautement configurables. Elle permet des dispositions précises (moitiés, tiers, quarts, etc.), pour une gestion des fenêtres rapide, cohérente et orientée productivité." )
        , ( "kwin_rectangle_desc", TString "Extension de script KWin pour KDE Plasma qui apporte un pavage de fenêtres puissant et piloté au clavier, inspiré de Rectangle. Fournit un ensemble complet d’actions de placement personnalisables et des schémas de raccourcis alternatifs, pour une gestion rapide et cohérente des fenêtres sans remplacer le gestionnaire natif." )
        , ( "tmux_tui_desc", TString "Interface terminal interactive pour gérer efficacement les sessions, fenêtres et panneaux tmux. Inspirée de lazygit, elle offre une navigation rapide, la création, le renommage et le réarrangement, avec support des thèmes et un flux de travail centré sur les popups pour une gestion quotidienne du terminal rationalisée." )
        , ( "tree_sitter_wbproto_desc", TString "Grammaire Tree-sitter pour fichiers Webots PROTO qui fournit des arbres d’analyse précis et structurés pour des outils d’édition et d’analyse avancés. Permet une coloration syntaxique fiable, des requêtes sémantiques et des fonctionnalités sensibles au code pour les workflows de simulation robotique." )
        , ( "wbproto_beautifier_desc", TString "Formatter opinionated pour fichiers Webots PROTO qui impose une structure cohérente et lisible sans configuration. Standardise automatiquement la mise en page et les espacements, améliorant la maintenabilité et rendant les diffs de contrôle de version plus clairs et fiables." )
        , ( "moirai_desc", TString "Moirai est le backend de la plateforme de contrôle. Il est développé dans le cadre de mon projet d'initiation scientifique, intitulé Plataformas de baixo custo para controle de processos, développé au CEFET-MG (Brésil) sous la supervision du Prof. Dr. Valter Leite. Le projet a été développé grâce à une bourse FAPEMIG. Les contrôleurs de cette plate-forme sont écrits en Python 3 et peuvent utiliser n'importe quelle librairie disponible sur l'ordinateur où s'exécute moirai. Cela dépend déjà de NumPy et SciPy, car ils sont couramment utilisés. Cette plate-forme gère l'interface matérielle à travers la biblioteque ahio, donc étendre ses capacités matérielles est une question d'extension de AHIO, qui devrait être simple. Le temps d'exécution, le temps d'échantillonnage, l'interrogation d'entrée et la mise à jour de sortie sont gérés par l'application et concentrons-nous sur votre contrôleur/modèle." )
        , ( "lachesis_desc", TString "Lachesis est l'interface de la plate-forme de contrôle. Cette application vous permet de configurer le matériel, d'exécuter des tests de réponse du système et d'exécuter des contrôleurs avec une interface facile à utiliser. Les signaux d'entrée et de sortie utilisés, ainsi que les variables, peuvent être visualisés graphiquement et mis à jour en temps réel. Il fonctionne uniquement en tant que frontend, ce qui signifie que toutes les données sont stockées et gérées dans/par le serveur moirai. Le serveur est également responsable de l'exécution du contrôleur. Cela signifie que vous pouvez installer moirai dans un ordinateur dédié, comme un Raspberry Pi, et Lachesis dans un autre, en utilisant Lachesis comme une télécommande pour votre système de contrôle. Cela permet à divers utilisateurs de partager la configuration de l'installation." )
        , ( "lachesis1_desc", TString "La configuration du matériel est aussi simple que de remplir un formulaire." )
        , ( "lachesis2_desc", TString "Visualisez la forme d'onde de contrôle avant d'exécuter des tests en boucle ouverte." )
        , ( "lachesis3_desc", TString "Choisissez simplement le temps d'échantillonnage, la durée d'exécution et les entrées. Pas besoin de s'inquiéter de les manipuler. Maintenant, vous pouvez vous concentrer sur votre contrôleur, qui peut être écrit en Python 3, un langage de programmation de haut niveau et moderne." )
        , ( "lachesis4_desc", TString "Visualisez les entrées, les sorties et les variables enregistrées graphiquement en temps réel. Lorsque le test est terminé, les données peuvent être exportées vers JSON, CSV et MAT." )
        , ( "tracker_desc", TString "Application pour suivre les paquets en utilisant le site Correios comme backend. Il ne fonctionne plus car il n'a aucun sens de le mettre à jour maintenant que Correios a sa propre application. Cependant, le code source est conservé sur GitHub pour référence." )
        , ( "void_desc", TString "Void est un stockage crypté. Vous pouvez crypter/décrypter des fichiers depuis/vers le stockage. Le chiffrement est effectué par NSS/NSPR à l'aide de AES_GCM_256, SHA512, PKCS5_PBKDF2, HMAC_SHA512 avec un coût de 250000. Le magasin lui-même a une clé dérivée de votre mot de passe et chaque fichier a sa propre clé aléatoire. Sur le disque, tous les fichiers chiffrés reçoivent un nom de hachage sale, long de 128 chiffres. Les gros fichiers (50 Mo) sont divisés en parties plus petites." )
        , ( "void1_desc", TString "Vous pouvez chiffrer des fichiers et des dossiers et même définir des métadonnées telles que des balises et des commentaires." )
        , ( "void2_desc", TString "Les fichiers texte peuvent être édités dans l'application à l'aide de l'éditeur Ace, qui prend en charge les thèmes et la coloration syntaxique pour 161 langues." )
        , ( "void3_desc", TString "Vous pouvez rechercher des fichiers en faisant correspondre leur chemin, leurs balises et leurs commentaires." )
        , ( "void4_desc", TString "Les vidéos peuvent être lues à l'intérieur de l'application, sans toucher le disque. Les images peuvent également être affichées comme un carrousel." )
        , ( "sigaa_desc", TString "Web Scraper qui extrait les notes du portail CEFET-MG SIGAA, permettant aux étudiants de voir leurs notes, leurs horaires et leur fréquence dans une seule interface, même hors ligne." )
        , ( "sigaa_notas1_desc", TString "L'étudiant peut sélectionner son immatriculation, lorsqu'il y en a plusieurs." )
        , ( "sigaa_notas2_desc", TString "Les notes de tous les sujets sont affichées dans une seule interface." )
        , ( "sigaa_notas3_desc", TString "Les horaires sont affichés par jour, dans l'ordre, ce qui facilite leur lecture." )
        , ( "sigaa_notas4_desc", TString "La fréquence est également disponible sur un seul écran, mais n'oubliez pas qu'elle ne montre que ce que le professeur saisit!" )
        , ( "%d years old, Brazilian", TString "%d ans, Brésilien" )
        , ( "contacts", TString "Contacts" )
        , ( "skills", TString "Compétences" )
        , ( "site_languages", TString "Langue de la page" )
        , ( "$skills", TString "Analyse et contrôle du système, C/C++, Python, Kotlin, Assemblage, MATLAB, Développement Android, Frontend, Backend, Embarqué, Automatisation, Robotique" )
        , ( "about", TString "À propos" )
        , ( "resume", TString "Résumé" )
        , ( "projects", TString "Projets" )
        , ( "publications", TString "Publications" )
        , ( "experience", TString "Expérience" )
        , ( "experience_title", TString "Expérience" )
        , ( "education", TString "Éducation" )
        , ( "intern", TString "Stagiaire" )
        , ( "acal_desc", TString "Au cours de ce stage, j'ai développé une plate-forme pour mesurer la perte de puissance à l'intérieur du noyau de l'inducteur utilisé dans un circuit PFC." )
        , ( "soldier", TString "Soldat" )
        , ( "cbmmg_desc", TString "En tant que pompier, j’avais le droit de travailler comme secouriste et plongeur. C’était la première intervention dans toutes sortes d’accidents, des incendies dans la nature aux accidents de voiture, en passant par les catastrophes industrielles et naturelles." )
        , ( "eng_meca", TString "Génie Mécatronique" )
        , ( "mes_control", TString "Master en Génie Électrique" )
        , ( "cefet_mes_desc", TString "J'ai fait des recherches sur le contrôle tolérant aux fautes dans les systèmes commutés à états restreints, en développant une technique de commutation plus rapide basée sur la région d'attraction du contrôleur." )
        , ( "cefet_desc", TString "En tant qu'étudiante, j'ai commencé à participer à des activités dès ma deuxième année au sein de l'équipe qui a remporté la 3ème place du concours robotique latino-américain. Après cela, j'ai aidé les représentants des étudiants dans certaines activités sans devenir membre, avant d'accepter de devenir le représentant des étudiants au sein du Conseil de remise des diplômes. Depuis le premier semestre, j’ai aidé d’autres finissants et des étudiants à la maîtrise à réaliser leurs projets, notamment en matière de programmation." )
        , ( "exchange_student", TString "Étudiant d'échange" )
        , ( "fuas_desc", TString "J'ai étudié en tant qu'étudiant d'échange dans le cadre du programme du gouvernement brésilien Ciências Sem Fronteiras (Science sans frontières)." )
        , ( "uga_desc", TString "J'ai étudié en tant qu'étudiant d'échange grâce au partenariat entre UGA et CEFET-MG. Là, j'ai travaillé dans le laboratoire de robotique en aidant l'équipe qui a remporté la deuxième place au concours National Instruments MyRIO Paris." )
        , ( "phd_control", TString "Doctorat en Automatique et Traitement de Signal" )
        , ( "phd_desc", TString "J'ai travaillé sur ma thèse intitulée \"Amélioration de la sécurité des systèmes cyber-physiques : Stratégies de détection et de mitigation\"." )
        , ( "vitibot_pos", TString "Docteur Ingénieur de Développement" )
        , ( "vitibot_desc", TString "Je travaille avec l'équipe INFO-ROS sur le développement de robots autonomes pour les vignobles." )
        , ( "cefet_items"
          , TList
                [ "Groupe d'étude en robotique (2014)"
                , "Tuteur en programmation informatique pour étudiants en mécatronique et informatique (techniques) (2014)"
                , "3ème place du concours robotique d'Amérique latine (2014)"
                , "Échange universitaire à l'Université Joseph Fourier (Grenoble, France) (2015)"
                , "Échange universitaire à l'Université des sciences appliquées de Francfort (Francfort, Allemagne) (2015/16)"
                , "Initiation scientifique: plate-forme de contrôle des processus à faible coût (2017)"
                , "Initiation scientifique: plate-forme de contrôle de processus: une implémentation de MPC (2018)"
                , "Membre étudiant du conseil de graduation (2018/19)"
                , "Co-superviseur d'un BIC-Jr intitulé 'Modélisation du système pour le contrôle des processus' (2018)"
                , "Co-superviseur d'un BIC-Jr intitulé 'Modélisation d'un four à paramètres spatiaux' (2019)"
                , "Co-superviseur d'un BIC-Jr intitulé 'Contrôle d'un système de réservoirs couplés' (2019)"
                ]
          )
        , ( "phd_items"
          , TList
                [ "Cours ministré: Laboratoire de Développement Android (2021)"
                , "Cours ministré: Laboratoire d'Analyse et de Contrôle des Systèmes Linéaires (Classe d'Automatique) (2022)"
                , "Cours ministré: Laboratoire d'Analyse et de Contrôle des Systèmes Linéaires (Classe de Robotique) (2022)"
                , "Cours ministré: Laboratoire d'Analyse et de Contrôle des Systèmes Linéaires (Classe d'Automatique) (2023)"
                , "Cours ministré: Laboratoire de Robot Operating System (Classe d'Automatique) (2023)"
                ]
          )
        ]
