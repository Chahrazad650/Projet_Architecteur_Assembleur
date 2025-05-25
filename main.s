# Programme RISC-V : Recherche du maximum entre deux entiers
# Auteur : DAHMANI Chahrazad - DJELLAB Sarah - MGHEZZI Ines
# Description : Ce programme calcule la factorielle d'un entier positif saisi par l'utilisateur.
# Environnement utilisé : RARS

# Stocker les messages pour l'affichage
.data
message_saisie:    .string "Entrez un nombre pour calculer sa factorielle : "
message_resultat:  .string "La factorielle est : "

.text
.globl main

main:
    # Afficher le message de saisie
    li a7, 4                 # Syscall pour afficher une chaîne de caractères
    la a0, message_saisie    # Charger l'adresse du message dans a0
    ecall                    # Exécuter l'appel système

    # Lire l'entier saisi par l'utilisateur
    li a7, 5                 # Syscall pour lire un entier
    ecall                    # Exécuter l'appel système
    mv t0, a0                # Stocker le nombre saisi dans t0

    # Initialisation de la factorielle
    li t1, 1                 # t1 contient le résultat de la factorielle (initialisé à 1)
    li t2, 1                 # t2 contient le compteur (initialisé à 1)

boucle:             
    mul t1, t1, t2           # Multiplier la factorielle par le compteur : fact = fact * i
    addi t2, t2, 1           # Incrémente le compteur : i = i + 1
    ble t2, t0, boucle       # Si le compteur (t2) est inférieur ou égal au nombre saisi (t0), continuer la boucle

    # Afficher le message de résultat
    li a7, 4                 # Code pour afficher une chaîne de caractères
    la a0, message_resultat  # Charger l'adresse du message de résultat dans a0
    ecall                    # Exécuter l'appel système

    # Afficher le résultat de la factorielle
    mv a0, t1               # Charger le résultat de la factorielle dans a0
    li a7, 1                # Syscall pour afficher un entier
    ecall                   # Exécuter l'appel système

fin:
    # Terminer le programme
    li a7, 10               # Syscall pour terminer le programme
    ecall                   # Exécuter l'appel système