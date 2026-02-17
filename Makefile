COMPOSE=docker-compose
shell:
	$(COMPOSE) run --rm go-builder

upd:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) down
