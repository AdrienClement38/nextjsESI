# Projet Docker J3 - Stack Production-Ready

## Membres du groupe

- Yassin

## Architecture

Rails API + Next.js + PostgreSQL + Nginx

Stack multi-services avec:
- PostgreSQL 16 Alpine (base de données)
- Rails 7.1 API (Ruby 3.2)
- Next.js 14 (Node 20)
- Nginx 1.25 Alpine (reverse proxy)

## Concepts Docker appliqués

- Docker Secrets pour les mots de passe
- Profiles dev/prod avec overrides
- Resource limits sur tous les services
- Restart policies appropriées
- 3 networks isolés (public/backend/database)
- Multi-stage builds pour Rails et Next.js
- Healthchecks sur tous les services
- Logging avec rotation en prod

## Lancement

### Première utilisation

```bash
# Setup initial (créer secrets et volumes)
make setup

# Lancer en développement
make dev
```

### Commandes disponibles

```bash
make help      # Afficher toutes les commandes
make setup     # Configuration initiale
make dev       # Lancer en mode développement
make prod      # Lancer en mode production
make stop      # Arrêter tous les conteneurs
make clean     # Tout supprimer (conteneurs + volumes)
make logs      # Voir les logs
make ps        # Voir l'état des services
```

## URLs

- Frontend: http://localhost
- API: http://localhost/api
- Adminer (dev only): http://localhost:8080
- Health: http://localhost/health

## Architecture réseau

```
Internet → Nginx (80) → Next.js (3000)
                      → Rails API (3000) → PostgreSQL (5432)
                      → Adminer (8080, dev only)
```

### Networks isolés

- **public**: nginx, frontend
- **backend**: nginx, backend, frontend (pour appels API)
- **database** (internal): backend, database, adminer
