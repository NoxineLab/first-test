cseg    segment
        assume  cs:cseg, ds:cseg
        org     100h	
main    proc	
        mov     dx, offset Message
        mov     ah, 9   ; Fonction DOS : afficher une chaîne.
        int     21h     ; Appel à MS-DOS
        ret             ; Fin du programme COM
main    endp

Message db      "Hello, world!$"
	
cseg    ends
        end     main
