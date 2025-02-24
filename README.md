# 🚀 **Code to Cloud** | Automatización de Indicadores Económicos 🌎📊  

Flujo automatizado para obtener y procesar **indicadores económicos** de forma eficiente, utilizando **GitHub Actions** y **DuckDB**.  

Este pipeline descarga datos de [mindicador.cl](https://mindicador.cl/), los almacena en **JSON**, los transforma en **Parquet** y sube automáticamente los archivos actualizados al repositorio. Todo sin intervención manual. ⚡  
---

## 🔧 **Tecnologías utilizadas:**  
🔹 **GitHub Actions** → Automatización del proceso 📡  
🔹 **DuckDB** → Conversión y manipulación de datos 🦆  
🔹 **Bash & Curl** → Extracción de datos desde API REST 🖥️  
🔹 **JSON & Parquet** → Formatos de almacenamiento estructurado 📂  

---

## 🔄 **Flujo de Automatización:**  
✅ **Extracción de datos** desde la API de [mindicador.cl](https://mindicador.cl/) 🌍  
✅ **Almacenamiento en JSON** en `indicadores_economicos/` 📝  
✅ **Conversión a Parquet** con DuckDB en `files_parquet/` 📦  
✅ **Automatización con GitHub Actions** → Descarga y transformación diaria ⚙️  
✅ **Commit & push automático** de los archivos actualizados al repositorio 🔄  

---

## 📌 **Estado actual:**  
✔️ **El flujo ya está en producción** y ejecuta diariamente la actualización de datos.  
📆 **Frecuencia de ejecución:** Todos los días entre las **12:00 - 14:00 UTC** vía **GitHub Actions**.  

---

## 🛠️ **¿Cómo usarlo manualmente?**  
Si quieres ejecutarlo localmente, sigue estos pasos:  

1️⃣ **Clona el repositorio**  
```bash
git clone https://github.com/tu-usuario/code-to-cloud.git
cd code-to-cloud
```
2️⃣ **Instala DuckDB**  
```bash
curl -sSL install.duckdb.org | sh && \
mv ~/.duckdb/cli/latest/duckdb /usr/local/bin/duckdb
```
3️⃣ **Ejecuta el script**
```bash
chmod +x scripts/indicadores.sh
./scripts/indicadores.sh
```
4️⃣ **Revisar los archivos generados**  
📁 JSON → `indicadores_economicos/`  
📁 Parquet → `files_parquet/`  
