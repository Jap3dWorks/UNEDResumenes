#!/usr/bin/bash

HOY=`date +%w`                  # Dia de la semana en formato numerico 0 domingo 6 sabado
AYER=`expr $HOY - 1`

echo -n "Ayer fue "
case $AYER in
    -1) echo "Sabado";;
    0) echo "Domingo";;
    1) echo "Lunes";;
    2) echo "Martes";;
    3) echo "Miercoles";;
    4) echo "Jueves";;
    6) echo "Viernes";;
    *) echo "Un d'ia que no existe";;
esac


