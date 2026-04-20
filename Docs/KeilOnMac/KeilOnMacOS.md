# Keil und das ITS-BRD unter Mac OS X nutzen

[[_TOC_]]

**Hinweis: Keil µVision ist nur für die Verwendung unter Windows-Betriebssystemen gedacht. Die hier aufgeführten Lösungsvorschläge sind daher nicht offiziell supportet und die Funkionalität kann jederzeit eingeschränkt sein. Außerdem ist es in der Verantwortung des Users, die Lizenzbedingungen der Software einzuhalten.**

## Intel-Basierte Macs

Auf einem Intel-basierten Mac, kann Windows mittels [Bootcamp][bootcamp] installiert werden. 

Alternativ kann Windows auch in einer Virtualisierungsumgebung installiert werden. (z.B: [virtual Box][virtualbox])

Im Windows OS können Keil und die Treiber dann entsprechend der Anleitung für Windows installiert werden.

## Apple-Silicon (M1-Macs)
Keil µVision lässt sich nur unter Windows OS installieren, daher muss auf dem Mac Windows installiert werden. Auf Apple-Silicon (M1) geht dies aktuell am einfachsten mit [Parallels Desktop][parallels]

Sobald Windows installiert wurde, kann Keil µVision entsprechend der Anleitung für Windows installiert werden.

### ST-Link-Treiber auf Apple-Silicon
Da es sich bei den Apple-Chips um ARM-Prozessoren handelt, gibt es bei der Installation der ST-Link-Treiber Probleme, da diese nur in einer x64/x86-Variante verfügbar sind. Im [ST-Forum][st-community-driver] gibt es hierzu eine Lösung, welche es aber notwendig macht, die Sicherheits-Einstellungen von Windows 11 zum Installieren von unsignierten Treibern zu umgehen.

**ACHTUNG: Das Abschalten dier Signatur-Prüfung ist ein Sicherheitsrisiko für das Betriebsystem**

Die Treiber sind in diesem [zip-Archiv][drivers] zu finden.
Das Archiv auf dem Laufwerk **C:** in den Ordner **st-link** entpacken.  

Die folgenden Schritte sind - entsprechend der Empfehlung aus dem [ST-Forum][st-community-driver] - die Variante 3 von dieser [Seite][deaktivatesignature]:

1. Klick auf das **Windows-Symbol** -> **An/Aus-Symbol** -> **Shift-Taste gedrückt halten und Neustart auswählen**
![Windows Ausschaltmenue][Startmenue]
2. Durch diese Reihenfolge startet Windows in der Wiederherstellungsumgebung. Dort die Option **Problembehandlung** auswählen. ![WiederherstellungsOptionen][OptionProblembehandlung]
3. Nun auf **erweiterte Optionen** klicken ![Erweiterte Optionen][erweiterteOptionen]
4. Auf dem nächsten Bildschirm Starteinstellungen auswählen.![Starteinstellungen][starteinst]
5. Im Starteinstellungs-Bildschirm auf **Neustart** klicken um die Windows-VM neu zu starten.![Neustarten auswählen][neustart]
6. Nach dem Neustart der VM werden mehrere Start-Einstellungen angezeigt. Es muss die 7. Option ausgewählt werden (Erzwingen der Treibersignatur deaktivieren). Dies geht über die [7]-Taste auf dem Numpad oder über [F7]-Taste ([fn]-Taste+[F7]-Taste). ![Starteinstellungen][Starteinstellungen]
7. Jetzt startet die VM neu in Windows mit abgeschalteter Signaturprüfung. Jetzt können die Treiber über den Gerätemanager installiert werden. Dazu muss das ITS-BRD angeschlossen und der USB-Anschluss an Parallels weitergeleitet sein. Dann im Startmenü nach dem **Gerätemanager** suchen.
8. Im Gerätemanager unter **Andere Geräte** ist das **ST-Link Debug**-Device zu finden. ![Gerätemanager][Geraetemngr] 
9. Nach Rechtsklick auf **ST-Link Debug** -> **Treiber aktualisieren** auswählen.
10. In dem sich öffnenden Fenster **Auf meinem Computer nach Treibern suchen** wählen. ![Treiber suchen][TreiberSuchen]
11. Den Ordner auswählen, indem die Treiber entpackt wurden. Bestätigen mit Klick auf **Weiter**. ![Ordner wählen][TreiberPfad]
12. In dem sich öffnenden Sicherheits-Hinweis **Diese Treibersoftware trotzdem installieren** auswählen. ![Sicherheitsabfrage][Sicherheitsabfrage]
13. Wenn die Installation erfolgreich lief erscheint folgendes Fenster: ![Erfolgsmeldung][Erfolg]


 

[bootcamp]: https://support.apple.com/de-de/boot-camp
[virtualbox]: https://www.virtualbox.org/
[parallels]: https://www.parallels.com/de/
[st-community-driver]: https://community.st.com/s/question/0D53W000011vaXZSAY/stlink-stcubeprogrammer-support-on-windows-arm64
[deaktivatesignature]: https://appuals.com/how-to-fix-the-third-party-inf-doesnt-contain-digital-signature-information/
[drivers]: drivers/stsw-link009_v3_ARM64_UNSIGNED-2.zip

[Startmenue]: img/0OnOff.png "Windows Start Menue"
[OptionProblembehandlung]: img/01OptionProblembehandlung.png ""
[erweiterteOptionen]: img/02ErweiterteOptionen.png ""
[starteinst]: img/03Starteinstellungen.png ""
[neustart]: img/04Neustarten.png ""
[Starteinstellungen]: img/05Starteinstellungen.png ""
[Geraetemngr]: img/06Geraetemanager.png ""
[TreiberSuchen]: img/07TreiberSuchen.png ""
[TreiberPfad]: img/08TreiberPfad.png ""
[Sicherheitsabfrage]: img/09Sicherheitsabfrage.png ""
[Erfolg]: img/10ErfolgreichInstalliert.png