

Anw01= ldr R0,=VariableA: Dies setzt R0 gleich zu "VariableA", was die Speicher Adresse des Variablen ist, indem die Inhalte            		 	  "ef be 34 12 fe af" Stehen



Anw02= ldrb    R2,\[R0]: Dies lädt auf dem Register 2 den Byte 0 "ef" (niederwertigste Adresse) aus der Adresse "VariableA" welche nun im 			Register 0 ist.



Anw03= ldrb R3,\[R0,#1]: Diese Zeile lädt auf dem Register 3 den 1. Byte "be" (höherwertiger als Byte 0) "..." (sehe Anw02).





Anw04= lsl  R2, #8: Diese Zeile sorgt dafür, dass Register 2 sich um 8 Bits nach links verschiebt und 00 nachrücken.





Anw05= orr R2, R3: Diese Zeile sorgt für eine Verknüpfung von R2 und R3 die nachgerückten 00 werden durch den Wert von Register 3 	

&#x09;	   ersetzt. 



Anw06= strh R2,\[R0]: Diese Zeile hat dafür gesorgt bzw. sorgt dafür, dass der Inhalt von Register 2 in die Adresse "VariableA" 				     gespeichert bzw. Überschrieben wird. Diese Zeile sorgt auch dafür, dass im Memory an der Adresse "VariableA" 		     	     "ef" Byte 0 und "be" Byte 1 ihre Positionen getauscht und somit "be" Byte 0 und "ef" Byte 1 besetzt haben.

