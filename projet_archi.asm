# Programme RISC-V : Recherche du maximum entre deux entiers
# Auteur : DAHMANI Chahrazad - DJELLAB Sarah - MGHEZZI Ines
# Description : Ce programme compare deux entiers et affiche le plus grand.
# Environnement utilisé : RARS

#messages pour l'affichage
.data
message_entier1:   .string "Entrez le premier entier : " 
message_entier2:   .string "Entrez le deuxième entier : "
message_max:       .string "Le maximum est : " 

.text
.globl main

main:
    # Afficher le message pour le premier entier printf("lire le premier entier ")
    li a7, 4                # Syscall pour afficher une chaîne
    la a0, message_entier1  # Charger l'adresse du premier message dans a0
    ecall                   # afficher le message (Exécuter l'appel système)

    # Lire le premier entier
    li a7, 5                 
    ecall                   
    addi s0, a0, 0          

    # Afficher le message pour le deuxième entier printf("lire le deuxieme entier ")
    li a7, 4                
    la a0, message_entier2  
    ecall                   

    # Lire le deuxième entier
    li a7, 5                
    ecall                   
    addi s1, a0, 0          

    # Comparaison des deux entiers
    # Si s0>=s1, alorss2 =s0
    # Sinon, s2=s1
    bge s0, s1, entier1_est_plus_grand  # Si s0>=s1, saute à entier1_est_plus_grand

entier2_est_plus_grand:
    addi s2, s1, 0          # s2=s1
    j afficher_max          # Saute à afficher_max

entier1_est_plus_grand:
    addi s2, s0, 0          # resultat est s0

afficher_max:
    # Afficher le message "Le maximum est :"
    li a7, 4                
    la a0, message_max      
    ecall                   

    # Afficher la valeur maximale
    li a7, 1                
    mv a0, s2               # le maximum dans a0
    ecall                   

    # Fin du programme
    li a7, 10               
    ecall
    # Merci pour votre attention
