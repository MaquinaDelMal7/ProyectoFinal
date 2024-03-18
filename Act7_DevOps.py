import requests
url = "https://www.commonsensemedia.org/movie-reviews"
pelis = requests.get(url)
from bs4 import BeautifulSoup
soup = BeautifulSoup(pagina_principal, 'lxml')

import csv

    peliculas = soup.find_all("li", class_="media-item")

    informacion_peliculas = []

    for pelicula in peliculas[:50]:
        titulo = pelicula.find("h3", class_="title").find("a").text.strip()
        calificacion = pelicula.find("span", class_="css-19i4j5t").text 
        descripcion = pelicula.find("p", class_="css-1p9466j").text  
        ano = pelicula.find("span", class_="css-1782u4j").text.split("(")[1].split(")")[0]

        informacion_peliculas.append([titulo, calificacion, descripcion, ano])

        print(f"Título: {titulo}")
        print(f"Calificación: {calificacion}")
        print(f"Descripción: {descripcion}")
        print(f"Año: {ano}")
        print("-" * 30)

    driver.quit()

    # Escribir la información en un archivo CSV
    with open("peliculas.csv", "w", newline="", encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Título', 'Calificación', 'Descripción', 'Año'])
        writer.writerows(informacion_peliculas)