import random

## Erstelle zwei Spielerscores und die Rundennummer
player1_score = 0
player2_score = 0
round_number = 1

## Schleife, die solange läuft, bis einer der beiden Spieler 15 Punkte und mehr hat als der andere
while player1_score < 15 and player2_score < 15:
    ## Warte auf Eingabetaste
    input("Drücke Eingabetaste, um Runde {} zu starten".format(round_number))

    ## Würfel eine Zufallszahl für beide Spieler
    player1_roll = random.randint(1, 6)
    player2_roll = random.randint(1, 6)

    ## Füge den gewürfelten Wert dem aktuellen Spielerscore hinzu, falls der Wurf != 0 ist
    if player1_roll != 0:
       player1_score += player1_roll
    if player2_roll != 0:
       player2_score += player2_roll

    ## Erhöhe die Rundennummer
    round_number += 1

    ## Ausgabe der aktuellen Punktezahl und der gewürfelten Werte
    print("Gewürfelter Wert von Spieler 1:", player1_roll)
    print("Gewürfelter Wert von Spieler 2:", player2_roll)
    print(f'Spieler 1 hat: {player1_score} Punkte')
    print(f'Spieler 2 hat: {player2_score} Punkte')

    ## Ermittle einen Gewinner
    if player1_score >= 15 and player1_score > player2_score and player2_score < 15:
       print("Spieler 1 hat das Spiel gewonnen")
    if player2_score >= 15 and player2_score > player1_score and player1_score < 15:
       print("Spieler 2 hat das Spiel gewonnen")