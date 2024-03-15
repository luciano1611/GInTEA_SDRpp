#!/bin/bash

#----------------------------------------------------------------------------------------------


# Función para verificar si un archivo existe
check_file() {
    if [ ! -f "$1" ]; then
        echo "El archivo $1 no existe o no es accesible."
        exit 1
    fi
}

#----------------------------------------------------------------------------------------------

# Funciónes de escritura de archivos
option_1_function(){

    echo "Abriendo SDR++"
    # Dirección del directorio de los archivos de configuración
    config_dir="$HOME/.config/sdrpp"         # Dirección de la carpeta de configuración de SDR++
    set_dir="$HOME/Desktop/sdrppEXE/Set_1"   # Dirección de los archivos de configuración del ejecutable

    # Verifica si existen los archivos en la carpeta "sdrppEXE"
    check_file "$set_dir/Device_1/config.json"
    check_file "$set_dir/Device_1/bladerf_config.json"
    mkdir -p "$config_dir"
    
    # Copia los archivos a la carpeta de configuración
    cp "$set_dir/Device_1/config.json" "$config_dir"
    cp "$set_dir/Device_1/bladerf_config.json" "$config_dir"

    # Ejecutar SDR++
    /usr/bin/sdrpp &

    sleep 7s

    # Segunda ventana
    echo "2da Ventana"
    check_file "$set_dir/Device_2/config.json"
    check_file "$set_dir/Device_2/bladerf_config.json"

    cp "$set_dir/Device_2/config.json" "$config_dir"
    cp "$set_dir/Device_2/bladerf_config.json" "$config_dir"

    /usr/bin/sdrpp &

    sleep 7s

    # Tercera ventana
    echo "3ra Ventana"
    check_file "$set_dir/Device_3/config.json"
    check_file "$set_dir/Device_3/rtl_sdr_config.json"

    cp "$set_dir/Device_3/config.json" "$config_dir"
    cp "$set_dir/Device_3/bladerf_config.json" "$config_dir"

    /usr/bin/sdrpp &

    sleep 7s
}

#----------------------------------------------------------------------------------------------

option_2_function(){

    echo "Abriendo SDR++"
    # Dirección del directorio de los archivos de configuración
    config_dir="$HOME/.config/sdrpp"            # Dirección de la carpeta de configuración de SDR++
    set_dir="$HOME/Desktop/sdrppEXE/Set_2"   # Dirección de los archivos de configuración del ejecutable

    # Verifica si existen los archivos en la carpeta "sdrppEXE"
    check_file "$set_dir/Device_1/config.json"
    check_file "$set_dir/Device_1/bladerf_config.json"
    mkdir -p "$config_dir"
    
    # Copia los archivos a la carpeta de configuración
    cp "$set_dir/Device_1/config.json" "$config_dir"
    cp "$set_dir/Device_1/bladerf_config.json" "$config_dir"

    # Ejecutar SDR++
    /usr/bin/sdrpp &

    sleep 7s

    # Segunda ventana
    echo "2da Ventana"
    check_file "$set_dir/Device_2/config.json"
    check_file "$set_dir/Device_2/bladerf_config.json"

    cp "$set_dir/Device_2/config.json" "$config_dir"
    cp "$set_dir/Device_2/bladerf_config.json" "$config_dir"

    /usr/bin/sdrpp &

    sleep 7s

    # Tercera ventana
    echo "3ra Ventana"
    check_file "$set_dir/Device_3/config.json"
    check_file "$set_dir/Device_3/rtl_sdr_config.json"

    cp "$set_dir/Device_3/config.json" "$config_dir"
    cp "$set_dir/Device_3/rtl_sdr_config.json" "$config_dir"

    /usr/bin/sdrpp &

    sleep 7s
}

#----------------------------------------------------------------------------------------------

option_3_function(){

    echo "Abriendo SDR++"
    # Dirección del directorio de los archivos de configuración
    config_dir="$HOME/.config/sdrpp"         # Dirección de la carpeta de configuración de SDR++
    set_dir="$HOME/Desktop/sdrppEXE/Set_3"   # Dirección de los archivos de configuración del ejecutable
    # Verifica si existen los archivos en la carpeta "sdrppEXE"
    check_file "$set_dir/Device_1/config.json"
    check_file "$set_dir/Device_1/rtl_sdr_config.json"
    mkdir -p "$config_dir"
    # Copia los archivos a la carpeta de configuración
    cp "$set_dir/Device_1/config.json" "$config_dir"
    cp "$set_dir/Device_1/rtl_sdr_config.json" "$config_dir"

    # Ejecutar SDR++
    /usr/bin/sdrpp &

    sleep 7s

    # Segunda ventana
    echo "2da Ventana"
    check_file "$set_dir/Device_2/config.json"
    check_file "$set_dir/Device_2/rtl_sdr_config.json"

    cp "$set_dir/Device_2/config.json" "$config_dir"
    cp "$set_dir/Device_2/rtl_sdr_config.json" "$config_dir"

    /usr/bin/sdrpp &

    sleep 7s

    # Tercera ventana
    echo "3ra Ventana"
    check_file "$set_dir/Device_3/config.json"
    check_file "$set_dir/Device_3/rtl_sdr_config.json"

    cp "$set_dir/Device_3/config.json" "$config_dir"
    cp "$set_dir/Device_3/rtl_sdr_config.json" "$config_dir"

    /usr/bin/sdrpp &

    sleep 7s
}

#----------------------------------------------------------------------------------------------

exit_function(){
    # Bucle de salida
    clear
    exit_word="exit"
    user_input=""

    while [ "$user_input" != "$exit_word" ]; do
        echo "Escriba 'exit' para cerrar las ventanas"
        read  user_input
    done

    # Cerrar todas las instancias de SDR++
    killall sdrpp

    echo "SDR++ cerrado"
    sleep 2s
    clear
}





#----------------------------------------------------------------------------------------------
# Bucle para ingresar una opción del menu
while [[ $OPTION -lt 1 || $OPTION -gt 4 ]]; do
    clear

    echo "Seleccióne los controladores segun el tipo de placas:"
    echo "1. Controladores de 3 BladeRF"
    echo "2. Controladores de 2 BladeRF y 1 SDR-RTL"
    echo "3. Controladores de 3 SDR-RTL"
    echo "4. Para salir del programa"

    read -p "Ingrese su opción: " OPTION

    if [[ $OPTION -lt 1 || $OPTION -gt 4 ]]; then
        echo "Opción no válida. Por favor, seleccione una opción válida."
    fi
done
clear
#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
# Selección 
case $OPTION in

    1)  echo "1. Controladores de 3 BladeRF"
        option_1_function
        exit_function
        ;;
    
    2)  echo "2. Controladores de 2 BladeRF y 1 SDR-RTL"
        option_2_function
        exit_function
        ;;
    
    3)  echo "3. Controladores de 3 SDR-RTL"
        option_3_function
        exit_function
        ;;
    
    4)
        echo "Saliendo del programa"
        exit 0
        ;;
    
esac

#----------------------------------------------------------------------------------------------

