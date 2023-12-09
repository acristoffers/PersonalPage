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


module I18n.German exposing (translations)

import Dict exposing (Dict)
import Types exposing (..)


translations : Dict String TranslationDictionary
translations =
    Dict.fromList
        [ ( "title", TString "Álan Crístoffer" )
        , ( "public", TString "Öffentlich" )
        , ( "gpg_public_key", TString "GPG öffentlicher Schlüßel" )
        , ( "age_public_key", TString "AGE öffentlicher Schlüßel" )
        , ( "pt", TString "Portugiesisch" )
        , ( "en", TString "Englisch" )
        , ( "fr", TString "Französisch" )
        , ( "de", TString "Deutsch" )
        , ( "native", TString "Muttersprache" )
        , ( "about_me", TString "Ich bin ein Doktorand in der Automatisierungstechnik mit einem Master-Abschluss in Elektrotechnik und einem Hintergrund in Mechatronik. Ich mag Computer, Technologie, Programmierung und Sprachen. Ich verwende Technologien wie Linux, Nix und Neovim wegen der Freiheit, die sie mir geben, sie zu modifizieren und Aufgaben zu automatisieren. Ich genieße es auch, zu unterrichten/zu betreuen und Menschen bei der Lösung von Problemen zu helfen, insbesondere bei Programmier- oder Technologieproblemen." )
        , ( "languages", TString "Sprachen" )
        , ( "tests_database_desc", TString "Fragen verwalten und Prüfungen drucken." )
        , ( "tb_ss1_desc", TString "Diese Anwendung wurde für den Feuerwehrmänner des Bundesstaates Minas Gerais/Brasilien entwickelt, um die Tests der Newcomern und die jährlichen Tests zu verwalten." )
        , ( "tb_ss2_desc", TString "Sie können die Prüfungen uber ein einfaches Interface vorbereiten. Die Antworten können diskursiven oder objektiven sein. Die Auswahl der Fragen kann automatiziert werden oder von Hand gemacht. Und die Bewertung ist natürlich einfach gemacht." )
        , ( "tb_ss3_desc", TString "Fragen können mit einem WYSIWYG-Textfeld hinzugefügt werden, das die Erzeugung der reichstylische Prüfungen ermöglicht." )
        , ( "and", TString "und" )
        , ( "cefss_desc", TString "Der Quellcode einer minimalen Anwendung, damit Sie mit Chromium Embedded Framework-Versionen 1 und 3 beginnen können. Setzt sich ein Fenster, lädt eine HTML-Datei und erstellt eine bidirektionale Verbindung zwischen Javascript und C++, um die Grundlagen von einem C++ Anwendung mit HTML-UI zu zeigen." )
        , ( "ahio_desc", TString "ahio ist eine Kommunikation-Bibliothek, deren Ziel die Verbindung mit verschiedener I/O Hardwares einfacherer zu machen ist, um Hardware-Veränderungen mit minimaler Code Änderung möglich zu machen." )
        , ( "moirai_desc", TString "Moirai ist das Backend der Kontrollplattform. Es wurde im Rahmen meines wissenschaftlichen Initiationsprojekts Plataformas de baixo custo para controle de processos (kostengünstige Plattform für die Prozesskontrolle) entwickelt, das am CEFET-MG (Brasilien) unter der Leitung von Prof. Dr. Valter Leite entwickelt wurde. Das Projekt wurde im Rahmen eines FAPEMIG-Stipendiums entwickelt. Controller für diese Plattform sind in Python 3 geschrieben und können jede Bibliothek verwenden, die auf dem Computer verfügbar ist, auf dem moirai läuft. Es hängt bereits von NumPy und SciPy ab, wie sie üblicherweise verwendet werden. Diese Plattform verwaltet die Hardware-Schnittstellen über die ahiio libray, so dass die Erweiterung der Hardwarefähigkeiten eine Frage der Erweiterung von AHIO ist, die einfach sein sollte. Ausführungszeit, Abtastzeit, Eingabeabfrage und Ausgabeaktualisierung werden von der Anwendung verwaltet und Sie können sich auf Ihren Controller/Ihr Modell konzentrieren." )
        , ( "lachesis_desc", TString "Lachesis ist das Frontend der Steuerungsplattform. Mit dieser Anwendung können Sie die Hardware konfigurieren, Systemantwortetests durchführen und Controller mit einer benutzerfreundlichen Oberfläche ausführen. Die verwendeten Ein- und Ausgangssignale sowie Variablen können grafisch dargestellt und in Echtzeit aktualisiert werden. Es funktioniert nur als Frontend, dass heißt alle Daten werden im Moirai-Server gespeichert und verwaltet. Der Server ist auch für die Ausführung des Controllers verantwortlich. Das bedeutet, dass Sie moirai in einem dedizierten Computer, wie einem Raspberry Pi, und Lachesis in einem anderen installieren können, indem Sie Lachesis wie eine Fernbedienung für Ihr Kontrollsystem verwenden. Dies ermöglicht verschiedenen Benutzern, die Anlagenkonfiguration zu teilen." )
        , ( "lachesis1_desc", TString "Das Einrichten der Hardware ist so einfach wie das Ausfüllen eines Formulars." )
        , ( "lachesis2_desc", TString "Visualisieren Sie die Steuerungswellenform vor dem Ausführen von Open-Loop-Tests." )
        , ( "lachesis3_desc", TString "Wählen Sie einfach die Abtastzeit, Ausführungsdauer und Eingaben. Sie müssen sich nicht darum kümmern, diese zu handhaben. Jetzt können Sie sich auf Ihren Controller konzentrieren, der in Python 3 geschrieben werden kann, einer hochentwickelten und modernen Programmiersprache." )
        , ( "lachesis4_desc", TString "Visualisieren Sie Eingaben, Ausgaben und protokollierte Variablen grafisch in Echtzeit. Wenn der Test beendet ist, können die Daten in JSON, CSV und MAT exportiert werden." )
        , ( "tracker_desc", TString "Anwendung zum Verfolgen von Paketen mit Correios-Site als Backend. Es funktioniert nicht mehr, da es keinen Sinn macht, es zu aktualisieren, jetzt, wo Correios eine eigene Anwendung hat. Der Quellcode wird jedoch zu Referenzzwecken auf GitHub gespeichert." )
        , ( "void_desc", TString "Void ist ein verschlüsselter Speicher. Sie können Dateien vom/zum Speicher verschlüsseln/entschlüsseln. Die Verschlüsselung wird von NSS/NSPR unter Verwendung von AES_GCM_256, SHA512, PKCS5_PBKDF2, HMAC_SHA512 mit einem Kostenaufwand von 250000 ausgeführt. Das Geschäft selbst hat einen Schlüssel, der von Ihrem Kennwort abgeleitet wird, und jede Datei hat ihren eigenen Zufallsschlüssel. Auf der Festplatte erhalten alle verschlüsselten Dateien einen 128-stelligen Salted-Hash-Namen. Große Dateien (50 MB) werden in kleinere Teile aufgeteilt." )
        , ( "void1_desc", TString "Sie können Dateien und Ordner verschlüsseln und sogar Metadaten wie Tags und Kommentare festlegen." )
        , ( "void2_desc", TString "Textdateien können innerhalb der Anwendung mit dem Ace-Editor bearbeitet werden, der das Theming und die Syntaxhervorhebung für 161 Sprachen unterstützt." )
        , ( "void3_desc", TString "Sie können Dateien durchsuchen, indem Sie deren Pfad, Tags und Kommentare abgleichen." )
        , ( "void4_desc", TString "Videos können innerhalb der Anwendung abgespielt werden, ohne die Festplatte zu berühren. Bilder können auch karussellartig dargestellt werden." )
        , ( "sigaa_desc", TString "Web Scraper, der Noten aus dem CEFET-MG SIGAA-Portal extrahiert und es den Schülern ermöglicht, Noten, Zeitpläne und Häufigkeit auf einer Oberfläche zu sehen, auch wenn sie offline sind." )
        , ( "sigaa_notas1_desc", TString "Der Student kann seine Immatrikulation auswählen, wenn es mehr als eine gibt." )
        , ( "sigaa_notas2_desc", TString "Noten aller Fächer werden auf einer einzigen Oberfläche angezeigt." )
        , ( "sigaa_notas3_desc", TString "Die Zeitpläne werden nach Tag sortiert angezeigt, damit sie leicht gelesen werden können." )
        , ( "sigaa_notas4_desc", TString "Die Frequenz ist auch auf einem einzelnen Bildschirm verfügbar, aber denken Sie daran, dass hier nur die Eingaben des Professors angezeigt werden!" )
        , ( "%d years old, Brazilian", TString "%d Jahre alt, Brasilianer" )
        , ( "contacts", TString "Kontakte" )
        , ( "skills", TString "Fähigkeiten" )
        , ( "site_languages", TString "Sprache der Seite" )
        , ( "$skills", TString "Systemanalyse und -steuerung, C/C++, Python, Kotlin, Assembly, MATLAB, Android-Entwicklung, Frontend, Backend, Embedded, Automatisierung, Robotik" )
        , ( "about", TString "Über" )
        , ( "resume", TString "Lebensläufe" )
        , ( "projects", TString "Projekte" )
        , ( "publications", TString "Publikationen" )
        , ( "experience", TString "Ausbildung" )
        , ( "experience_title", TString "Erfahrungen" )
        , ( "education", TString "Ausbildung" )
        , ( "intern", TString "Praktikant" )
        , ( "acal_desc", TString "Durch dieses Praktikum habe ich eine Messplattform für PFC-Drossel Kernverluste gebaut." )
        , ( "soldier", TString "Soldat" )
        , ( "cbmmg_desc", TString "Als Feuerwehrmann war ich berechtigt, als Ersthelfer und Taucher zu arbeiten. Ich var der Ersthelfer bei allen möglichen Unfällen, vom Feuer in der Wildnis über Autounfälle bis hin zu Industrie- und Naturkatastrophen." )
        , ( "eng_meca", TString "Mecatroniker" )
        , ( "mes_control", TString "Master in Elektrotechnik" )
        , ( "cefet_mes_desc", TString "Masterstudent unter der Leitung von Prof. Dr. Valter Leite und Prof. Dr. Walter Lucia zur Erforschung der fehlertoleranten Steuerung in zustandsbeschränkten vermittelten Systemen." )
        , ( "cefet_desc", TString "Als Student habe ich in meinem zweiten Jahr angefangen, an Aktivitäten teilzunehmen, als Teil des Teams, das den 3. Platz im lateinamerikanischen Roboterwettbewerb gewann. Danach half ich den Studentenvertretern bei einigen Aktivitäten, ohne Mitglied zu werden, bis ich Graduierungsrat endlich übergennomen habe. Seit meinem ersten Semester habe ich anderen Graduirung und Meister Studenten mit ihrer Projekte geholfen, besonders mit Programmierung." )
        , ( "exchange_student", TString "Studentaustausch" )
        , ( "fuas_desc", TString "Ich habe als Austauschstudent im Rahmen des Programms Ciências Sem Fronteiras (Wissenschaft ohne Grenzen) der brasilianischen Regierung studiert." )
        , ( "uga_desc", TString "Ich habe als Austauschstudent durch die Partnerschaft zwischen UGA und CEFET-MG studiert. Dort arbeitete ich im Robotiklabor und half dem Team, das den zweiten Platz beim National Instruments MyRIO Paris-Wettbewerb belegte." )
        , ( "phd_control", TString "Doktorat in Automatisierung und Signalverarbeitung" )
        , ( "phd_desc", TString "Doktorand unter der Leitung von Prof. Dr. Nadhir Messai und Prof. Dr. Nouredinne Manamanni, ich arbeite auf meiner Thesis mit dem Titel \"Angriffserkennung auf verteilten cyber-physischen Systemen: Anwendung auf Smart Factory\".)" )
        , ( "cefet_items"
          , TList
                [ "Robotik-Lernengruppe (2014)"
                , "Tutor für Computerprogrammierung für Studierende der Mechatronik und Informatik (Fachkurs) (2014)"
                , "3. Platz beim Latin America Robotic Competition (2014)"
                , "Studentaustausch an der Université Joseph Fourier (Grenoble, Frankreich) (2015)"
                , "Studentaustausch an der Frankfurt University of Applied Sciences (Frankfurt, Deutschland) (2015/16)"
                , "Wissenschaftliche Initiation: Kostengünstige Prozesssteuerungsplattform (2017)"
                , "Wissenschaftliche Initiation: Prozesssteuerungsplattform: eine MPC-Implementierung (2018)"
                , "Studentisches Mitglied des Graduierungsrates (2018/19)"
                , "Berater eines BIC-Jr mit dem Titel 'Systemmodellierung für die Prozesssteuerung' (2018)"
                , "Berater eines BIC-Jr mit dem Titel 'Modellierung eines Ofens mit raumverteilten Parametern' (2019)"
                , "Berater eines BIC-Jr mit dem Titel 'Steuerung eines gekoppelten Panzersystems' (2019)"
                ]
          )
        , ( "phd_items"
          , TList
                [ "Betreute Klasse: Android-Entwicklungslabor (2021)"
                , "Betreute Klasse: Labor für Analyse und Kontrolle Linearer Systeme (Automatismus Klasse) (2022)"
                , "Betreute Klasse: Labor für Analyse und Kontrolle Linearer Systeme (Klasse Robotik) (2022)"
                , "Betreute Klasse: Labor für Analyse und Kontrolle Linearer Systeme (Automatismus Klasse) (2023)"
                ]
          )
        ]
