all:

.PHONY: test
test:
	clojure -M:dev:test

.PHONY: fig
fig:
	clojure -A:dev:fig -M -m figwheel.main --build dev --repl

.PHONY: format
format:
	nix fmt

.PHONY: build
build: lock
	nix build

.PHONY: lock
lock: deps-lock.json

deps-lock.json: deps.edn flake.nix
	nix run github:jlesquembre/clj-nix#deps-lock -- --deps-include $<
