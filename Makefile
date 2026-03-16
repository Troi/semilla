ZOLA = docker run --rm -u "$$(id -u):$$(id -g)" -v "$$(pwd):/site" -w /site -p 1111:1111 -p 1024:1024 ghcr.io/getzola/zola:v0.19.2

.PHONY: dev build init clean deploy help

dev:          ## Spustí vývojový server na http://localhost:1111
	$(ZOLA) serve --interface 0.0.0.0 --port 1111 --base-url localhost

build:        ## Vygeneruje produkční výstup do ./public
	$(ZOLA) build

init:         ## Inicializuje nový Zola projekt (jen pro první spuštění)
	$(ZOLA) init .

clean:        ## Smaže vygenerované soubory
	rm -rf public

deploy:       ## Commitne a pushne – GitHub Actions se postará o build a deploy
	git add -A
	git commit -m "deploy: $$(date '+%Y-%m-%d %H:%M')"
	git push origin main

help:         ## Zobrazí tuto nápovědu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
