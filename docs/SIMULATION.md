# Kalpataru Simulation

> Waste Management & Circular Economy System - Simulation Guide

## Overview

Kalpataru is a digital transformation initiative for community-driven waste management. This simulation allows you to experience the complete waste collection and circular economy system locally.

## Prerequisites

- Docker 20.10+
- Docker Compose v2+
- Node.js 18+ (for npm commands)
- 4GB+ RAM recommended

## Quick Start

### Option 1: Using vsp-porto (Recommended)

```bash
# Install vsp-porto
curl -fsSL https://porto.vspatabuga.io/ | sh

# Install Kalpataru simulation
vsp-porto install kalpataru

# Start the simulation
vsp-porto start kalpataru -o

# View logs
vsp-porto logs kalpataru -f
```

### Option 2: Direct Docker

```bash
# Clone and run
git clone https://github.com/vspatabuga/kalpataru-backend-configuration.git
cd kalpataru-backend-configuration
./simulate.sh
```

## Access URLs

| Service | URL | Description |
|---------|-----|-------------|
| Web UI | http://localhost:3001 | Main user interface |
| API | http://localhost:3000 | REST API endpoint |

## Demo Accounts

| Role | Username | Password | Description |
|------|----------|----------|-------------|
| Member | ahmad@example.com | demo123 | Regular user with balance |
| Operator | budi@example.com | demo123 | Can process collections |

## Features

- **Waste Catalog** - Browse categorized waste with dynamic pricing
- **Collection Cart** - Add items to collection cart
- **Transaction Manager** - Process waste collections
- **Balance System** - Track member credits
- **Reporting** - View transaction history

## Stopping the Simulation

```bash
# Using vsp-porto
vsp-porto stop kalpataru

# Or using docker-compose
docker compose -p vsp-kalpataru down
```

## Troubleshooting

### Port already in use

```bash
# Check what's using port 3000 or 3001
lsof -i :3001

# Change port in docker-compose.yml if needed
```

### Database issues

```bash
# Reset database
docker compose -p vsp-kalpataru down -v
docker compose -p vsp-kalpataru up -d
```

## Documentation

- [Architecture](./ARCHITECTURE.md)
- [Development Setup](./SETUP.md)
