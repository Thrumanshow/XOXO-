#!/bin/bash
# ROL: SACERDOTE - Custodiando la paz térmica
# ROL: JUEZ - Dictaminando el límite sagrado de 30.0

pkill -f python3
echo "⚖️ Contrato LBH Activo: El Juez ha dictaminado el límite en 30.0"

# El Manager (Auditor) se levanta con la firma del Sacerdote
python3 swarm/manager_alpha/manager.py --limite 30.0 --strict > auditor.log 2>&1 &
sleep 2

# Las Hormigas (Subordinados) entran en el redil de la rectificación
python3 swarm/worker_beta/worker.py --id ALPHA --contract_limit 30.0 > /dev/null 2>&1 &
python3 swarm/worker_beta/worker.py --id BETA --contract_limit 30.0 > /dev/null 2>&1 &
python3 swarm/worker_beta/worker.py --id GAMMA --contract_limit 30.0 > /dev/null 2>&1 &

echo "🕯️ Sacerdote: El enjambre ha sido bendecido. La paz de los 25°C sea con el sistema."
