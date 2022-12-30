## Funktionen zur Berechnung des Mittelwertes

## Weg 1
def mean(x1, x2, x3, x4):
    zahlen = [x1, x2, x3, x4]
    summe = sum(zahlen)
    mittelwert = summe/len(zahlen)
    print(f'Der Mitelwert beträgt: {mittelwert}')

mean(1, 2, 3, 4)

## Weg 2
def mean(*args):
    summe = sum(args)
    return summe/len(args)

print(f'Der Mittelwert beträgt: {mean(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)}')
