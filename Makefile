.PHONY: generate
generate:
	curl -o- https://raw.githubusercontent.com/AI-Engineers-Foundation/agent-protocol/main/schemas/openapi.yml > openapi.yml
	poetry run fastapi-codegen \
		--generate-routers \
		--input openapi.yml \
		--output agent_protocol
	rm openapi.yml
	mv agent_protocol/main.py agent_protocol/server.py
	rm -rf agent_protocol/routers
	rm agent_protocol/dependencies.py
	black .
