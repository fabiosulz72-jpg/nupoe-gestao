# NUPOE — Gestão Operacional

Pacote de implantação do sistema NUPOE na Cloudflare Workers, com banco de dados D1.

## Configuração

1. Execute o conteúdo de `schema.sql` no console do banco D1 `nupoe-gestao-db`.
2. Conecte este repositório ao Cloudflare Workers Builds.
3. Use `npx wrangler deploy` como comando de implantação.

O sistema inicializa automaticamente as equipes, os policiais importados e o histórico de missões na primeira abertura.
