#!/bin/bash

# Generar un archivo de eventos con datos aleatorios
for (( i=0; i<10; i++ )); do
  fecha=$(date +"%Y-%m-%d")
  hora=$(date +"%H:%M:%S")
  codigo_producto=$((RANDOM % 10000))
  cantidad=$((RANDOM % 100))

  echo "$fecha,$hora,$codigo_producto,$cantidad" >> "otro_evento.txt"
done

# Eliminar archivo de salida si existe
rm -f "consolidado_producto.csv"

# Recorre los códigos de producto únicos
for codigo_producto in $(awk -F, '{print $1}' "otro_evento.txt" | sort | uniq); do

  # Filtra eventos por código de producto
  awk -F, -v codigo_producto="$codigo_producto" '{if ($1 == codigo_producto) print $0}' "otro_evento.txt" > "temporal.txt"

  # Escribir información del producto
  echo "**Producto:** $codigo_producto" >> "consolidado_producto.csv"
  echo "Fecha, Hora, Cantidad" >> "consolidado_producto.csv"

  # Agrega información del archivo temporal al archivo de salida
  cat "temporal.txt" >> "consolidado_producto.csv"

  # Elimina archivo temporal
  rm "temporal.txt"

done

echo "Nombre: O. Javier Hernández Rivera"
echo "Matrícula: 3063774"
echo "Fecha de ejecución: $(date)"

echo "Se ha creado el archivo con éxito: consolidado_producto.csv"