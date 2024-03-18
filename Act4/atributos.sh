#! /bin/bash

directorio="$1"

if [ -z "$directorio" ]; then
  echo "Error: Debe especificar un directorio como parámetro."
  exit 1
fi

if [ ! -d "$directorio" ]; then
    echo "El directorio $directorio no existe"
    exit 1
fi

archivo_salida="atributos.txt"
rm -f "$archivo_salida"

for archivo in "$directorio"/*; do

  if [ -f "$archivo" ] && [ ! -h "$archivo" ]; then
  
    permisos=$(stat -c "%a" "$archivo")

    usuario=$(whoami)
    
    grupo=$(stat -c "%G" "$archivo")
    
    tamanio=$(du -b "$archivo" | tr -dc '0-9')

    fecha_modificacion=$(date -r "$archivo" +"%Y-%m-%d %H:%M:%S")

    echo "**Nombre del archivo:** $archivo" >> "$archivo_salida"
    echo "**Permisos:** $permisos" >> "$archivo_salida"
    echo "**Usuarios:** $usuario" >> "$archivo_salida"
    echo "**Grupo:** $grupo" >> "$archivo_salida"
    echo "**Tamaño:** $tamaio bytes" >> "$archivo_salida"
    echo "**Fecha y hora de la modificacion:** $fecha_modificacion" >> "$archivo_salida"
    echo "" >> "$archivo_salida"
  fi
done

echo "Se creó el archivo $archivo_salida con la informacion proveniente del directorio $directorio"

echo "Nombre: O. Javier Hernández Rivera"
echo "Matrícula: 3063774"
echo "Fecha de ejecución: $(date)"