# Makefile for Basic Blog Docker commands

.PHONY: setup up down logs console help

# Setup và start ứng dụng
setup:
	@echo "🐳 Setting up Rails Blog..."
	@docker-compose build
	@docker-compose up -d
	@sleep 10
	@docker-compose exec web rails db:create db:migrate db:seed
	@echo "✅ Done! App running at http://localhost:3000"

# Start services
up:
	@docker-compose up -d

# Stop services  
down:
	@docker-compose down

# View logs
logs:
	@docker-compose logs -f web

# Rails console
console:
	@docker-compose exec web rails console

# Show help
help:
	@echo "Available commands:"
	@echo "  setup   - Setup và start app lần đầu"
	@echo "  up      - Start services"
	@echo "  down    - Stop services"
	@echo "  logs    - View logs"
	@echo "  console - Rails console"
