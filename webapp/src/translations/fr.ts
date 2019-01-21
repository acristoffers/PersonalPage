/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

export const LANG_FR_NAME = 'fr'

export const LANG_FR_TRANS = {
    'title': 'Álan Crístoffer',
    'public': 'Public',
    'gpg_public_key': 'Clè GPG publique',
    'pt': 'Portugais',
    'en': 'Anglais',
    'fr': 'Français',
    'de': 'Allemand',
    'native': 'Maternelle',
    'about_me': `Étudiant en ingénierie mécatronique ayant de l'expérience en analyse, contrôle et programmation de systèmes. Aime travailler dans un environnement coopératif pour résoudre des problèmes complexes. A participé à deux initiations scientifiques pour utiliser une technique de contrôle avancée (contrôle prédictif par modèle). Aime apprendre des langues et aider les autres à développer leurs projets.`,
    'languages': 'Langues',
    'tests_database_desc': 'Gérer les questions et imprimer les preuves.',
    'tb_ss1_desc': 'Cette application a été développé pour la société de pompiers de l\'état de Minas Gerais, au Brésil, pour gérer les preuves appliquées aux nouveaux arrivants, ainsi que les preuves annuelles.',
    'tb_ss2_desc': 'Il leur permet de générer des preuves en utilisant une interface simple, en générant des preuves par niveau de question ou par selection manuelle, objectif ou discursive et aussi peut générer des preuves avec des questions et des réponses dans un ordre aléatoire, tout en gardant une simple correction.',
    'tb_ss3_desc': 'Les questions peuvent être ajoutées avec un champ de texte WYSIWYG, qui permettent la création de preuves avec un format riche.',
    'and': 'et',
    'cefss_desc': 'Le code source des applications minimales pour commencer avec les versions de Chromium Embedded Framework versions 1 et 3. Mettre en place une fenêtre, charger un fichier HTML et créer une liaison entre Javascript et C++ bidirectionnel pour montrer une application très basique en C++ avec HTML UI.',
    'ahio_desc': 'ahio est une bibliothèque de communication dont le but est de faire l’abstraction de l\'interfaçage avec plusieurs matériaux d’entrées/sorties (I/O), pour reusir un changement de matériel  avec un minimum de modifications du code.',
    'moirai_desc': 'Moirai est le backend de la plateforme de contrôle. Il est développé dans le cadre de mon projet d\'initiation scientifique, intitulé Plataformas de baixo custo para controle de processos, développé au CEFET-MG (Brésil) sous la supervision du Prof. Dr. Valter Leite. Le projet a été développé grâce à une bourse FAPEMIG. Les contrôleurs de cette plate-forme sont écrits en Python 3 et peuvent utiliser n\'importe quelle librairie disponible sur l\'ordinateur où s\'exécute moirai. Cela dépend déjà de NumPy et SciPy, car ils sont couramment utilisés. Cette plate-forme gère l\'interface matérielle à travers la biblioteque ahio, donc étendre ses capacités matérielles est une question d\'extension de AHIO, qui devrait être simple. Le temps d\'exécution, le temps d\'échantillonnage, l\'interrogation d\'entrée et la mise à jour de sortie sont gérés par l\'application et concentrons-nous sur votre contrôleur/modèle.',
    'lachesis_desc': 'Lachesis est l\'interface de la plate-forme de contrôle. Cette application vous permet de configurer le matériel, d\'exécuter des tests de réponse du système et d\'exécuter des contrôleurs avec une interface facile à utiliser. Les signaux d\'entrée et de sortie utilisés, ainsi que les variables, peuvent être visualisés graphiquement et mis à jour en temps réel. Il fonctionne uniquement en tant que frontend, ce qui signifie que toutes les données sont stockées et gérées dans/par le serveur moirai. Le serveur est également responsable de l\'exécution du contrôleur. Cela signifie que vous pouvez installer moirai dans un ordinateur dédié, comme un Raspberry Pi, et Lachesis dans un autre, en utilisant Lachesis comme une télécommande pour votre système de contrôle. Cela permet à divers utilisateurs de partager la configuration de l\'installation.',
    'lachesis1_desc': 'La configuration du matériel est aussi simple que de remplir un formulaire.',
    'lachesis2_desc': 'Visualisez la forme d\'onde de contrôle avant d\'exécuter des tests en boucle ouverte.',
    'lachesis3_desc': 'Choisissez simplement le temps d\'échantillonnage, la durée d\'exécution et les entrées. Pas besoin de s\'inquiéter de les manipuler. Maintenant, vous pouvez vous concentrer sur votre contrôleur, qui peut être écrit en Python 3, un langage de programmation de haut niveau et moderne.',
    'lachesis4_desc': 'Visualisez les entrées, les sorties et les variables enregistrées graphiquement en temps réel. Lorsque le test est terminé, les données peuvent être exportées vers JSON, CSV et MAT.',
    'tracker_desc': 'Application pour suivre les paquets en utilisant le site Correios comme backend. Il ne fonctionne plus car il n\'a aucun sens de le mettre à jour maintenant que Correios a sa propre application. Cependant, le code source est conservé sur GitHub pour référence.',
    'void_desc': `Void est un stockage crypté. Vous pouvez crypter/décrypter des fichiers depuis/vers le stockage. Le chiffrement est effectué par NSS/NSPR à l'aide de AES_GCM_256, SHA512, PKCS5_PBKDF2, HMAC_SHA512 avec un coût de 250000. Le magasin lui-même a une clé dérivée de votre mot de passe et chaque fichier a sa propre clé aléatoire. Sur le disque, tous les fichiers chiffrés reçoivent un nom de hachage sale, long de 128 chiffres. Les gros fichiers (50 Mo) sont divisés en parties plus petites.`,
    'void1_desc': 'Vous pouvez chiffrer des fichiers et des dossiers et même définir des métadonnées telles que des balises et des commentaires.',
    'void2_desc': `Les fichiers texte peuvent être édités dans l'application à l'aide de l'éditeur Ace, qui prend en charge les thèmes et la coloration syntaxique pour 161 langues.`,
    'void3_desc': 'Vous pouvez rechercher des fichiers en faisant correspondre leur chemin, leurs balises et leurs commentaires.',
    'void4_desc': `Les vidéos peuvent être lues à l'intérieur de l'application, sans toucher le disque. Les images peuvent également être affichées comme un carrousel.`,
    '%d years old, Brazilian': '%d ans, Brésilien',
    'contacts': 'Contacts',
    'skills': 'Compétences',
    'site_languages': 'Langue de la page',
    '$skills': 'Analyse et contrôle du système, C/C++, Python, Kotlin, Assemblage, MATLAB, Développement Android, Frontend, Backend, Embarqué, Automatisation, Robotique',
    'about': 'À propos',
    'resume': 'Résumé',
    'projects': 'Projets'
}
