#! /bin/bash

if [ -z "$1" ]; 
then
    echo "Por favor, proporciona el nombre del archivo como parámetro"
    exit 1
fi

archivo="copia_eventos.txt"

cat eventos.txt > "$archivo"

echo "Se ha copiado con exito el contenido de 'eventos.txt' a archivo $archivo."

echo "Nombre: O. Javier Hernández Rivera"
echo "Matrícula: 3063774"
echo "Fecha de ejecución: $(date)"