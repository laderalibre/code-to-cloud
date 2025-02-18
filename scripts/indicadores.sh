#!/bin/bash

# Lista de monedas y años
currencies=("uf" "dolar")
years=(2025)

# Directorios para almacenar archivos
JSON_DIR="./indicadores_economicos"
PARQUET_DIR="./files_parquet"
mkdir -p "$JSON_DIR" "$PARQUET_DIR"

# Función para obtener y guardar los datos en JSON
conversor() {
    for currency in "${currencies[@]}"; do
        echo "🔄 Obteniendo datos para: $currency..."
        
        # Archivo JSON de salida
        json_file="${JSON_DIR}/${currency}.json"
        echo "[" > "$json_file"

        first_entry=true
        for year in "${years[@]}"; do
            echo "  📅 Año: $year"
            
            # Llamada a la API
            response=$(curl -s "https://mindicador.cl/api/${currency}/${year}")

            # Extraer la parte relevante del JSON (el array "serie")
            series=$(echo "$response" | jq '.serie')

            # Agregar una coma si no es la primera entrada
            if [ "$first_entry" = false ]; then
                echo "," >> "$json_file"
            else
                first_entry=false
            fi

            echo "$series" | jq -c '.' >> "$json_file"
        done

        echo "]" >> "$json_file"
        echo "✅ Datos guardados en: $json_file"
    done
}

# Función para convertir JSON a Parquet con DuckDB
convert_to_parquet() {
    for currency in "${currencies[@]}"; do
        json_file="${JSON_DIR}/${currency}.json"
        parquet_file="${PARQUET_DIR}/${currency}.parquet"

        echo "🦆🔄 Convirtiendo $json_file a Parquet en $parquet_file con DuckDB..."

        duckdb -s "
        CREATE OR REPLACE TABLE raw_brands AS
        SELECT 
            json_extract(unnest, '$.fecha')::VARCHAR AS fecha,
            json_extract(unnest, '$.valor')::DOUBLE AS valor
        FROM read_json('$json_file') t, 
            UNNEST(t.json);

        COPY (SELECT * FROM raw_brands) TO '$parquet_file' (FORMAT 'parquet');
        "

        echo "✅ Archivo Parquet generado en: $parquet_file"
    done
}

# Ejecutar funciones
conversor
convert_to_parquet
