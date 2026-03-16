# Nastavení GitHub Pages

## Kroky pro deployment

1. **Vytvoř GitHub repository**
   ```bash
   git init
   git add -A
   git commit -m "Initial commit"
   git remote add origin https://github.com/<username>/<repo>.git
   git push -u origin main
   ```

2. **Nastav GitHub Pages**
   - Jdi do Settings → Pages
   - Source: vybrat `gh-pages` branch, root `/`
   - První push spustí GitHub Actions a vytvoří `gh-pages` větev automaticky

3. **Web bude dostupný na:**
   - `https://<username>.github.io/<repo>` (výchozí)
   - Nebo vlastní doména přes CNAME v Settings → Pages

## Lokální vývoj

```bash
# Spustit vývojový server
make dev

# Otevřít v prohlížeči
http://localhost:1111

# Build produkční verze
make build

# Deploy (commit + push)
make deploy
```

## Požadavky

- Docker (pro lokální vývoj)
- Git
- GitHub účet (pro deployment)

Žádné další závislosti nejsou potřeba – vše běží přes Docker.
