# Língua — pacote de auditoria da etapa 1

Esta branch disponibiliza o pacote solicitado para download. A etapa 1 permanece pendente da validação estrutural do corpus real no Mac; o pacote registra a revisão dos 19 textos e inclui o auditor e as instruções locais.

Baixe `auditoria/etapa1_auditoria.zip`, descompacte em Downloads e execute:

```bash
bash "$HOME/Downloads/etapa1_auditoria/auditar_no_mac.sh"
```

O auditor usa o Python E5 já validado, lê o corpus original e grava apenas o relatório fora dele. O relatório deverá ser analisado antes de encerrar a etapa 1. Não há conexão ao aplicativo ou geração de novos embeddings neste pacote.

O checksum SHA256 do ZIP está em `auditoria/etapa1_auditoria.zip.sha256`.
