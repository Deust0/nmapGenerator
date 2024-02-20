#!/bin/bash

# Verificar que se hayan proporcionado argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre_archivo> <parte_nmap>"
    echo "Ejemplo: $0 scope.txt '-sn'"
    exit 1
fi

# Verificar si el archivo de entrada existe
if [ ! -f "$1" ]; then
    echo "El archivo '$1' no existe."
    exit 1
fi
echo "#!/bin/bash" >> scriptsGenerated.ssh
# Iterar sobre cada línea del archivo de entrada
while IFS= read -r line; do
    # Extraer la dirección IP y el puerto de la línea
    ip_port=$(echo "$line" | cut -d '/' -f 1)
    ip=$(echo "$ip_port" | cut -d ':' -f 1)
    port=$(echo "$ip_port" | cut -d ':' -f 2)

    # Reemplazar guiones por puntos en la dirección IP
    ip_formatted=$(echo "$ip" | tr '-' '.')
    ip_file_output=$(echo "$ip" | tr '.' '-')
    command_output2=$(echo "$2" | tr '-' ' ')
    command_output=$(echo "$command_output2" | tr ' ' '_')
    
    # Crear el comando nmap y escribirlo en el nuevo archivo
    echo "sudo nmap $2 $ip_formatted -p $port -oN ${ip_file_output}_${port}_$command_output" >> scriptsGenerated.ssh

done < $1

echo "Se han generado los comandos de sondeo en el archivo 'scriptsGenerated.txt'."
sudo chmod u+x u+w scriptsGenerated.ssh


