# Keil stürzt beim Flashen oder Starten des Debuggers ab

## Problembeschreibung

Keil in der Version 5.38 oder 5.38a stürzt beim starten des Debuggers oder beim Flashen (Button "Load") ab. (Keil wird ohne Hinweise einfach geschlossen.)

## Problemlösung

Um dieses Problem zu lösen, muss die Datei `STLinkUSBDriver.dll` aus dem [Ordner `Keil-Problem`][folder] in das Unterverzeichni `ARM\STLink` kopiert und die dort befindliche Version überschrieben werden. Bei einer Keil-Installation mit Standardeinstellungen ist der vollständige Pfad: `C:\Keil_v5\ARM\STLink`

## Hintergrund

ARM ist dieses Problem bekannt, im nächsten Update für Keil wird die neue Version der .dll-Datei automatisch mit ausgeliefert. Ausführliche Informationen sind bei [armDeveloper][arm] zu finden.



[folder]: Keil-Problem
[arm]: https://developer.arm.com/documentation/ka005381/1-0?lang=en&rev=