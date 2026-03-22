#!/usr/bin/env bash

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "BANNER"
   ╔═╗╔═╗╔╦╗╔═╗╦ ╦╔═╗╔═╗╔═╗
   ║ ║╠═╣║║║║ ║║║║║ ╦║ ║╚═╗
   ╚═╝╩ ╩╩ ╩╚═╝╚╩╝╚═╝╚═╝╚═╝
   
   KALPATARU - Waste Management Simulation
BANNER
echo -e "${NC}"

SIM_DIR="/tmp/vsp-kalpataru"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${YELLOW}>> Initializing Kalpataru in ${SIM_DIR}...${NC}"

rm -rf "$SIM_DIR"
mkdir -p "$SIM_DIR"
cp -r "$PROJECT_DIR"/* "$SIM_DIR/"
cd "$SIM_DIR"

echo -e ">> Building Docker images..."
if command -v docker-compose &> /dev/null; then
    docker-compose -p vsp-kalpataru up --build -d
else
    docker compose -p vsp-kalpataru up --build -d
fi

echo -e "\n${GREEN}✔ Kalpataru Successfully Simulated!${NC}"
echo -e "================================================================================="
echo -e "🌍 ${BLUE}Web UI${NC}:  http://localhost:3001"
echo -e "🔌 ${BLUE}API${NC}:     http://localhost:3000"
echo -e ""
echo -e "🛑 To teardown: cd $SIM_DIR && docker compose -p vsp-kalpataru down"
echo -e "================================================================================="
