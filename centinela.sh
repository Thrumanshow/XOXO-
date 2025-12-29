#!/bin/bash

# --- Configuración ---
# Usamos el python del entorno virtual directamente para evitar errores de módulos
PYTHON_VENV="./venv_xoxo/bin/python3"
SCRIPT_GRAFICA="swarm/manager_alpha/generador_reporte.py"

echo "🚀 [$(date)] Iniciando ciclo de actualización del Centinela..."

# 1. Generar la nueva gráfica usando el Python del VENV
$PYTHON_VENV $SCRIPT_GRAFICA

# 2. Verificar si la gráfica existe
if [ -f "REPORTE_RENDIMIENTO_HORMIGAS.png" ]; then
    echo "📊 Gráfica actualizada localmente."
    
    # 3. Sincronizar
    git add .
    git commit -m "🤖 Centinela: Sincronización con Python Path validado [$(date +'%Y-%m-%d %H:%M')]"
    git push origin main
    
    echo "✅ [$(date)] Dashboard y Scripts sincronizados globalmente."
else
    echo "❌ Error: No se pudo generar el reporte gráfico. ¿Pandas está instalado en el venv?"
fi
