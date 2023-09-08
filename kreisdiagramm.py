import matplotlib.pyplot as plt

labels = ['A', 'B', 'C', 'D']
sizes = [15, 30, 45, 10]
explode = (0, 0, 0, 0.1)
colors = ['#E3CF57', '#53868B', '#BCEE68', '#00BFFF']


# Erstelle nun das Kreisdiagramm
plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=140,
        explode=explode, colors=colors, wedgeprops={'linewidth': 1, 'edgecolor': "black"})
plt.legend()
plt.axis('equal')
plt.title('Verkaufszahlen der Produkte A, B, C und D')
plt.show()