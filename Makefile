.PHONY: help setup dev prod stop clean logs ps

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

setup: ## Initial setup (create secrets and volumes)
	@bash scripts/setup.sh

dev: ## Start development environment
	@bash scripts/dev.sh

prod: ## Start production environment
	@bash scripts/prod.sh

stop: ## Stop all services
	@echo "🛑 Stopping all services..."
	@docker compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.prod.yml down

clean: ## Stop and remove all containers, networks, and volumes
	@echo "🧹 Cleaning up everything..."
	@docker compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.prod.yml down -v
	@echo "✅ Cleanup complete"

logs: ## View logs (use CTRL+C to exit)
	@docker compose logs -f

ps: ## Show service status
	@docker compose ps
