/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

export const LANG_DE_NAME = 'de'

export const LANG_DE_TRANS = {
    'title': 'Álan Crístoffer',
    'public': 'Öffentlich',
    'gpg_public_key': 'GPG öffentlicher Schlüßel',
    'pt': 'Portugiesisch',
    'en': 'Englisch',
    'fr': 'Französisch',
    'de': 'Deutsch',
    'native': 'Muttersprache',
    'about_me': 'Mechatroniker mit Erfahrung in Systemanalyse und -steuerung. Liebt es, in einer kooperativen Umgebung zu arbeiten. Hat in zwei wissenschaftlichen Initiationen zur Verwendung einer fortgeschrittenen Kontrolltechnik (Model Predictive Control) gearbeitet. Liebt es, Sprachen zu lernen und anderen bei der Entwicklung ihrer Projekte zu helfen.',
    'languages': 'Sprachen',
    'tests_database_desc': 'Fragen verwalten und Prüfungen drucken.',
    'tb_ss1_desc': 'Diese Anwendung wurde für den Feuerwehrmänner des Bundesstaates Minas Gerais/Brasilien entwickelt, um die Tests der Newcomern und die jährlichen Tests zu verwalten.',
    'tb_ss2_desc': 'Sie können die Prüfungen uber ein einfaches Interface vorbereiten. Die Antworten können diskursiven oder objektiven sein. Die Auswahl der Fragen kann automatiziert werden oder von Hand gemacht. Und die Bewertung ist natürlich einfach gemacht.',
    'tb_ss3_desc': 'Fragen können mit einem WYSIWYG-Textfeld hinzugefügt werden, das die Erzeugung der reichstylische Prüfungen ermöglicht.',
    'and': 'und',
    'cefss_desc': 'Der Quellcode einer minimalen Anwendung, damit Sie mit Chromium Embedded Framework-Versionen 1 und 3 beginnen können. Setzt sich ein Fenster, lädt eine HTML-Datei und erstellt eine bidirektionale Verbindung zwischen Javascript und C++, um die Grundlagen von einem C++ Anwendung mit HTML-UI zu zeigen.',
    'ahio_desc': 'ahio ist eine Kommunikation-Bibliothek, deren Ziel die Verbindung mit verschiedener I/O Hardwares einfacherer zu machen ist, um Hardware-Veränderungen mit minimaler Code Änderung möglich zu machen.',
    'moirai_desc': 'Moirai ist das Backend der Kontrollplattform. Es wurde im Rahmen meines wissenschaftlichen Initiationsprojekts Plataformas de baixo custo para controle de processos (kostengünstige Plattform für die Prozesskontrolle) entwickelt, das am CEFET-MG (Brasilien) unter der Leitung von Prof. Dr. Valter Leite entwickelt wurde. Das Projekt wurde im Rahmen eines FAPEMIG-Stipendiums entwickelt. Controller für diese Plattform sind in Python 3 geschrieben und können jede Bibliothek verwenden, die auf dem Computer verfügbar ist, auf dem moirai läuft. Es hängt bereits von NumPy und SciPy ab, wie sie üblicherweise verwendet werden. Diese Plattform verwaltet die Hardware-Schnittstellen über die ahiio libray, so dass die Erweiterung der Hardwarefähigkeiten eine Frage der Erweiterung von AHIO ist, die einfach sein sollte. Ausführungszeit, Abtastzeit, Eingabeabfrage und Ausgabeaktualisierung werden von der Anwendung verwaltet und Sie können sich auf Ihren Controller/Ihr Modell konzentrieren.',
    'lachesis_desc': 'Lachesis ist das Frontend der Steuerungsplattform. Mit dieser Anwendung können Sie die Hardware konfigurieren, Systemantwortetests durchführen und Controller mit einer benutzerfreundlichen Oberfläche ausführen. Die verwendeten Ein- und Ausgangssignale sowie Variablen können grafisch dargestellt und in Echtzeit aktualisiert werden. Es funktioniert nur als Frontend, dass heißt alle Daten werden im Moirai-Server gespeichert und verwaltet. Der Server ist auch für die Ausführung des Controllers verantwortlich. Das bedeutet, dass Sie moirai in einem dedizierten Computer, wie einem Raspberry Pi, und Lachesis in einem anderen installieren können, indem Sie Lachesis wie eine Fernbedienung für Ihr Kontrollsystem verwenden. Dies ermöglicht verschiedenen Benutzern, die Anlagenkonfiguration zu teilen.',
    'lachesis1_desc': 'Das Einrichten der Hardware ist so einfach wie das Ausfüllen eines Formulars.',
    'lachesis2_desc': 'Visualisieren Sie die Steuerungswellenform vor dem Ausführen von Open-Loop-Tests.',
    'lachesis3_desc': 'Wählen Sie einfach die Abtastzeit, Ausführungsdauer und Eingaben. Sie müssen sich nicht darum kümmern, diese zu handhaben. Jetzt können Sie sich auf Ihren Controller konzentrieren, der in Python 3 geschrieben werden kann, einer hochentwickelten und modernen Programmiersprache.',
    'lachesis4_desc': 'Visualisieren Sie Eingaben, Ausgaben und protokollierte Variablen grafisch in Echtzeit. Wenn der Test beendet ist, können die Daten in JSON, CSV und MAT exportiert werden.',
    'tracker_desc': 'Anwendung zum Verfolgen von Paketen mit Correios-Site als Backend. Es funktioniert nicht mehr, da es keinen Sinn macht, es zu aktualisieren, jetzt, wo Correios eine eigene Anwendung hat. Der Quellcode wird jedoch zu Referenzzwecken auf GitHub gespeichert.',
    'void_desc': 'Void ist ein verschlüsselter Speicher. Sie können Dateien vom/zum Speicher verschlüsseln/entschlüsseln. Die Verschlüsselung wird von NSS/NSPR unter Verwendung von AES_GCM_256, SHA512, PKCS5_PBKDF2, HMAC_SHA512 mit einem Kostenaufwand von 250000 ausgeführt. Das Geschäft selbst hat einen Schlüssel, der von Ihrem Kennwort abgeleitet wird, und jede Datei hat ihren eigenen Zufallsschlüssel. Auf der Festplatte erhalten alle verschlüsselten Dateien einen 128-stelligen Salted-Hash-Namen. Große Dateien (50 MB) werden in kleinere Teile aufgeteilt.',
    'void1_desc': 'Sie können Dateien und Ordner verschlüsseln und sogar Metadaten wie Tags und Kommentare festlegen.',
    'void2_desc': 'Textdateien können innerhalb der Anwendung mit dem Ace-Editor bearbeitet werden, der das Theming und die Syntaxhervorhebung für 161 Sprachen unterstützt.',
    'void3_desc': 'Sie können Dateien durchsuchen, indem Sie deren Pfad, Tags und Kommentare abgleichen.',
    'void4_desc': 'Videos können innerhalb der Anwendung abgespielt werden, ohne die Festplatte zu berühren. Bilder können auch karussellartig dargestellt werden.',
    '%d years old, Brazilian': '%d Jahre alt, Brasilianer',
    'contacts': 'Kontakte',
    'skills': 'Fähigkeiten',
    'site_languages': 'Sprache der Seite',
    '$skills': 'Systemanalyse und -steuerung, C/C++, Python, Kotlin, Assembly, MATLAB, Android-Entwicklung, Frontend, Backend, Embedded, Automatisierung, Robotik',
    'about': 'Über',
    'resume': 'Lebensläufe',
    'projects': 'Projekte'
}
