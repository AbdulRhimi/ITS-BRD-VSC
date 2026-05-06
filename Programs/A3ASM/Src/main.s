;************************************************
;* Beginn der globalen Daten *
;************************************************
                   AREA MyData, DATA, align = 2
Base
VariableA          DCW 0x1234
VariableB          DCW 0x4711

VariableC          DCD  0

MeinHalbwortFeld   DCW 0x22 , 0x3e , -52, 78 , 0x27 , 0x45

MeinWortFeld       DCD 0x12345678 , 0x9dca5986
                   DCD -872415232 , 1308622848
                   DCD 0x27000000
                   DCD 0x45000000

MeinTextFeld       DCB "ABab0123",0

                   EXPORT VariableA
                   EXPORT VariableB
                   EXPORT VariableC
                   EXPORT MeinHalbwortFeld
                   EXPORT MeinWortFeld
                   EXPORT MeinTextFeld

;***********************************************
;* Beginn des Programms *
;************************************************
    AREA |.text|, CODE, READONLY, ALIGN = 3
; ----- S t a r t des Hauptprogramms -----
                EXPORT main
                EXTERN initITSboard
main            PROC
                bl    initITSboard                 ; HW Initialisieren

; Laden von Konstanten in Register
                mov   r0,#0x12                      ; Anw-01 lädt den Wert 0x12 in r0
                mov   r1,#-128                      ; Anw-02 lädt den (Vorzeichenbehafteten) Wert -128 in r1
                ldr   r2,=0x12345678                ; Anw-03 lädt 32 Bit-Konstante in r2 (mit LDR pseudo-instruction)

; Zugriff auf Variable
                ldr   r0,=VariableA                 ; Anw-04 lädt die Adresse von VariableA in r0
                ldrh  r1,[r0]                       ; Anw-05 lädt den 16 Bit-Wert (Halbwort) von VariableA in r1
                ldr   r2,[r0]                       ; Anw-06 lädt den 32 Bit-Wert von VariableA in r2 (mit LDR pseudo-instruction)
                str   r2,[r0,#VariableC-VariableA]  ; Anw-07 speichert den Wert von r2 in VariableC (offset berechnet relative zur Adresse von VariableA)

; Zugriff auf Felder (Speicherzellen)
                ldr   r0,=MeinHalbwortFeld          ; Anw-08 lädt die Adresse von MeinHalbwortFeld in r0
                ldrh  r1,[r0]                       ; Anw-09 lädt den 16 Bit-Wert (1.Halbwort) von MeinHalbwortFeld in r1
                ldrh  r2,[r0,#2]                    ; Anw-10 lädt den 16 Bit-Wert (Halbwort) von MeinHalbwortFeld in r2 (offset 2 Byte)
                mov   r3,#10                        ; Anw-11 lädt den Wert 10 in r3
                ldrh  r4,[r0,r3]                    ; Anw-12 lädt den halbwort-Wert und register offset

                ldrh  r5,[r0,#2]!                   ; Anw-13 lädt den Halbwort-Wert in r5 und inkrementiert die Adresse in r0 um 2 (post-increment)
                ldrh  r6,[r0,#2]!                   ; Anw-14 lädt den Halbwort-Wert in r6 und inkrementiert die Adresse in r0 um 2 (post-increment)
                strh  r6,[r0,#2]!                   ; Anw-15 Speichert Halfword aus r6, danach erhöht r0 um 2 (post-increment)

; Addition und Subtraktion von unsigned / signed Integer-Werten
                ldr  r0,=MeinWortFeld               ; Anw-16 lädt die Adresse von MeinWortFeld in r0
                ldr  r1,[r0]                        ; Anw-17 lädt den 32 Bit-Wort von MeinWortFeld in r1
                ldr  r2,[r0,#4]                     ; Anw-18 lädt den 2. 32 Bit-Wort von MeinWortFeld in r2 (offset 4 Byte)
                adds r3,r1,r2                       ; Anw-19 addiert die Werte in r1 und r2 und speichert das Ergebnis in r3 (unsigned addition, mit Carry Flag)

                ldr  r4,[r0,#8]                     ; Anw-20 lädt den 3. 32 Bit-Wort von MeinWortFeld in r4 (offset 8 Byte)
                ldr  r5,[r0,#12]                    ; Anw-21 lädt den 4. 32 Bit-Wort von MeinWortFeld in r5 (offset 12 Byte)
                subs r6,r4,r5                       ; Anw-22 subtrahiert die Werte in r4 und r5 und speichert das Ergebnis in r6 (signed subtraction, mit Carry Flag)

                ldr  r7,[r0,#16]                    ; Anw-23 lädt den 5. 32 Bit-Wort von MeinWortFeld in r7 (offset 16 Byte)
                ldr  r8,[r0,#20]                    ; Anw-24 lädt den 6. 32 Bit-Wort von MeinWortFeld in r8 (offset 20 Byte)
                subs r9,r7,r8                       ; Anw-25

forever         b   forever                         ; Anw-26
                ENDP
                END