COMPOSE=docker-compose

COLIMA_IP := $(shell colima status 2>&1 | sed -n 's/.*msg="address: \([^"]*\)".*/\1/p')

shell:
	$(COMPOSE) run --rm go-builder

upd:
	@echo "Using Colima IP: $(COLIMA_IP)"
	@if [ -z "$(COLIMA_IP)" ]; then \
		echo "❌ Cannot detect Colima IP"; \
		exit 1; \
	fi
	@sudo mkdir -p /etc/resolver
	@echo "nameserver $(COLIMA_IP)" | sudo tee /etc/resolver/localstack.dev > /dev/null
	@sudo dscacheutil -flushcache
	@sudo killall -HUP mDNSResponder
	@echo "✅ DNS configured"
	@COLIMA_IP=$(COLIMA_IP) $(COMPOSE) up -d

stop:
	$(COMPOSE) down
