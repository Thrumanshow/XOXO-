#!/usr/bin/env bash
# 🐜 HormigasAIS — Guardián Nivel 3
set -e

TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
EVAL_FILE="EVALUATION_L3.lbh"
LOG_FILE="centinela_limpieza.log"

echo "🔍 [LBH] Iniciando verificación Nivel 3..."

# REGLAS NIVEL 3
REQUIRED_FILES=("CONTRACT_HUMAN.lbh" "LBH_PROTOCOL.md" "LICENSE" "README.md" "EXTERNAL_INTERPRETER.md")
FORBIDDEN_PATHS=(".github")

# TEST 1 & 2: Vínculo Humano
if [ ! -f "CONTRACT_HUMAN.lbh" ] || ! grep -q "Cristhiam Leonardo Hernández Quiñonez" CONTRACT_HUMAN.lbh; then
  echo "❌ FALLO: Autoridad humana no válida o ausente"
  exit 3
fi

# TEST 3: Archivos mínimos (incluyendo el nuevo de interpretación)
for f in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "❌ FALLO: Archivo requerido faltante: $f"
    exit 3
  fi
done

# TEST 4: Superficie de ataque
for p in "${FORBIDDEN_PATHS[@]}"; do
  if [ -e "$p" ]; then
    echo "❌ FALLO: Ruta prohibida detectada: $p"
    exit 3
  fi
done

# SELLADO L3
HASH=$(git rev-parse --short HEAD 2>/dev/null || echo "detached")
HOST=$(uname -n)

cat << EOE > "$EVAL_FILE"
{
  "artifact": "EVALUATION_L3",
  "timestamp": "$TIMESTAMP",
  "repository": "XOXO-",
  "status": "LEVEL_3_CONFIRMED",
  "automation": "CONTRATO_AGENTS",
  "sovereignty": "HUMAN_ENFORCED",
  "authority": "Cristhiam Leonardo Hernández Quiñonez",
  "git_hash": "$HASH"
}
EOE

echo "✅ Nivel 3 confirmado y sellado."
echo "[$TIMESTAMP] OK — Nivel 3 confirmado ($HASH)" >> "$LOG_FILE"
