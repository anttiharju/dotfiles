setup: fish/completions
	./scripts/setup.sh
.PHONY: setup

fish/completions:
	./scripts/completions.sh
