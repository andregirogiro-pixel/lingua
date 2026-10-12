# Etapa 2 — leitura da Camada A

Esta entrega prepara e verifica o leitor independente sobre o mesmo corpus aprovado estruturalmente na etapa 1. A adaptação à interface do aplicativo ainda depende do código atual de `lingua` e `agente_analista`, que não está no repositório disponível neste ambiente.

## O que está preparado

`componentes/corpus_camada_a.py` abre SQLite e a matriz NumPy somente para leitura, preserva IDs e campos originais e oferece `fragmento(id)`, `bloco(id)` e `contexto(id, raio=1)`. As páginas derivadas aparecem separadamente em `rastreio.paginas_pdf`; o metadado original `paginas` permanece intacto. O contexto respeita a obra de origem. O leitor fecha os recursos e libera os caches ao terminar, inclusive quando rejeita um arquivo.

A fonte antiga do volume 19 fica identificada como bloqueada nas buscas do componente. Sua leitura continua disponível para auditoria. Esta execução não pesquisa o corpus, não conecta o aplicativo e não gera embeddings.

`ferramentas/verificar_leitura.py` compara os hashes do corpus com a conclusão da etapa 1 antes de abrir o leitor. Percorre os fragmentos e blocos pelas APIs públicas, confere campos originais e referências/páginas e verifica contextos por amostragem determinística. Ao terminar, confere os hashes novamente. O relatório contém apenas IDs, hashes, contagens e páginas, sem textos ou vetores.

`ferramentas/coletar_codigo.py` copia código de `lingua` e `agente_analista` para um ZIP novo. Exclui `.env`, dados, `instance`, ambientes, dependências, caches e symlinks. Mantém Python, templates, CSS/JS, documentação e arquivos de configuração/dependências selecionados. Não altera a origem nem publica o código automaticamente.

## Executar no Mac

Depois de baixar e descompactar o pacote em Downloads:

```bash
bash "$HOME/Downloads/etapa2_leitura/executar_no_mac.sh"
```

Usa o Python que passou na etapa 1:

`/Users/rodrigodevellis/lingua-agente/instance/venv-agente-e5-intel/bin/python`

O corpus padrão é `/Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a`; a origem do código é `/Users/rodrigodevellis/lingua-agente`. O NumPy já validado no Mac é 1.26.4. Nenhum modelo é carregado e não é necessário configurar o cache E5 para esta verificação.

O script cria dois arquivos em Downloads:

- `leitura_camada_a_*.json`: diagnóstico da leitura ligada ao baseline da etapa 1.
- `lingua_codigo_*.zip`: cópia do código para analisar as interfaces reais do aplicativo.

Envie esses dois arquivos para adaptar a resposta do leitor ao contrato do aplicativo. A coleta de código também será tentada caso a leitura encontre falhas, permitindo diagnosticar ambas as partes. Um erro de ambiente ou de pasta de saída pode impedir o início.

Se os caminhos forem diferentes, os argumentos são corpus, projeto e diretório de saída:

```bash
bash "$HOME/Downloads/etapa2_leitura/executar_no_mac.sh" \
  "/caminho/camada_a" "/caminho/lingua-agente" "$HOME/Downloads"
```

Para executar somente a leitura:

```bash
/Users/rodrigodevellis/lingua-agente/instance/venv-agente-e5-intel/bin/python \
  "$HOME/Downloads/etapa2_leitura/ferramentas/verificar_leitura.py" \
  --corpus /Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a \
  --auditoria "$HOME/Downloads/etapa2_leitura/dados/CONCLUSAO_ETAPA1.json" \
  --saida "$HOME/Downloads/leitura_camada_a_$(date +%Y%m%d_%H%M%S).json"
```

## Situação e critérios

A etapa 1 foi concluída no corpus real, com 12 verificações passando e os limites registrados. O leitor desta etapa 2 passou em testes sintéticos; sua execução sobre o corpus real ainda precisa ser recebida e analisada. A correspondência histórica vetor–texto continua sem comprovação independente por linha.

O núcleo do leitor passou em 26 testes; o driver, em 8 testes específicos. A coleta de código foi conferida com arquivos de exemplo, incluindo preservação da origem, exclusão de dados/env/dependências/symlinks e recusa de sobrescrever o ZIP. Não houve teste do aplicativo ou benchmark do corpus real nesta entrega.

Para concluir a etapa 2, precisamos verificar a leitura local e adaptar seus resultados aos campos esperados pelo aplicativo atual, preservando IDs, textos, origem, páginas e contexto. A conexão da busca BM25/E5/RRF pertence à etapa 3 e será tratada depois.
