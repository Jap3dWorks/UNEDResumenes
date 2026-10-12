#!/usr/bin/bash

echo Param value is $1

function puntos()
{
    if [ $1 ]; then
        INTERVALO=$1
    else
        INTERVALO=1
    fi

    echo $INTERVALO

    while true ; do
        echo -n "."             # Imprimir un punto sinsalto de línea
        sleep $INTERVALO        # Esperar intervalo
    done
}

puntos 2 &

# Programa largo

# programa que tarda mucho

for (( n=1; n<=500000; n++ )); do
    echo hola > /dev/null
done

echo fin

kill -9 $! > /dev/null          # Se mata el ultimo proceso en background

