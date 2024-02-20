#!/bin/bash

# Verificar si se proporcionó un archivo como argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

# Verificar si el archivo existe
if [ ! -f "$1" ]; then
    echo "El archivo '$1' no existe."
    exit 1
fi

# Buscar puertos filtrados y extraer la IP correspondiente
grep -B 4 "filtered" "$1" | grep "Nmap scan report" | awk '{print $5}' > ips.txt
grep "filtered" "$1" > puertosFiltrados.txt

# Combinar las IPs y los puertos filtrados en un solo archivo
paste -d ' ' ips.txt puertosFiltrados.txt > resultado.txt

echo "Puertos filtrados encontrados:"
cat resultado.txt

# Eliminar archivos temporales
rm ips.txt puertosFiltrados.txt resultado.txt
