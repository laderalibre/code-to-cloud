# Code to Cloud 🚀
Automatización de indicadores económicos con GitHub Actions y DuckDB

Este repositorio contiene un script en Bash que obtiene datos de indicadores económicos desde la API de mindicador.cl, los guarda en formato JSON y los convierte a Parquet usando DuckDB. Todo el proceso está automatizado con GitHub Actions, ejecutándose automáticamente cada día.

📌 ¿Qué hace este proyecto?
✅ Obtiene datos de indicadores económicos (UF, Dólar) de mindicador.cl.
✅ Guarda los datos en JSON en la carpeta indicadores_economicos/.
✅ Convierte los datos a Parquet en files_parquet/ usando DuckDB.
✅ GitHub Actions ejecuta el script automáticamente y sube los archivos actualizados al repositorio.
Este repositorio contiene un script en Bash que obtiene datos de indicadores económicos desde la API de mindicador.cl, los guarda en formato JSON y los convierte a Parquet usando DuckDB. Todo el proceso está automatizado con GitHub Actions, ejecutándose automáticamente cada día.

🚀 Automatización con GitHub Actions
Cada vez que se hace un push a main o a las 12:00 UTC, GitHub Actions ejecuta el flujo de trabajo que:

Clona el repositorio.
Instala las dependencias necesarias (DuckDB y curl).
Ejecuta el script scripts/indicadores.sh para obtener los datos.
Convierte los archivos JSON a Parquet con DuckDB.
Sube automáticamente los archivos actualizados al repositorio.
