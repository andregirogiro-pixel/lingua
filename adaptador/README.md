# Etapa 2 — adaptador de leitura do Agente Analista

**Concluída com limites em 12/10/2026.** O adaptador instalado foi verificado no corpus completo do Mac: 11 verificações passaram, zero falhas; todos os 8.594 vetores foram preservados; 57 contextos e 57 citações literais foram conferidos. Consulte [a conclusão](CONCLUSAO_ETAPA2.md). Não é necessário repetir a aplicação já concluída; as instruções abaixo ficam para reprodução.

O leitor independente foi executado no corpus real no Mac: seis verificações passaram, com todos os 8.594 fragmentos, 7.754 blocos e 19 fontes lidos; 67 contextos amostrados conferidos; os 28 hashes continuaram iguais ao baseline da etapa 1.

Com o código atual recebido, foi implementado um adaptador opcional compatível com os campos esperados pelo Agente Analista. Ele preserva IDs, textos, cabeçalhos E5, hashes, ordem das linhas vetoriais e vizinhos. Acrescenta referências de obra/seção e os campos do contrato legado sem converter arquivos ou copiar a matriz.

## Aplicar e verificar no Mac

Depois de descompactar o pacote em Downloads:

```bash
bash "$HOME/Downloads/etapa2_adaptador/aplicar_e_verificar_no_mac.sh"
```

O script usa o Python E5 já validado e não instala bibliotecas. O projeto padrão é `/Users/rodrigodevellis/lingua-agente`; o corpus padrão é `/Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a`. Caso estejam em outro lugar, os três argumentos são projeto, corpus e pasta de saída:

```bash
bash "$HOME/Downloads/etapa2_adaptador/aplicar_e_verificar_no_mac.sh" \
  "/caminho/lingua-agente" "/caminho/camada_a" "$HOME/Downloads"
```

A instalação verifica hashes de quatro módulos originais, recusa versões diferentes e arquivos novos já existentes com outro conteúdo. Acrescenta somente:

- `agente_analista/camada_a.py`
- `agente_analista/tests/test_agente_analista_camada_a.py`
- `agente_analista/tests/test_agente_analista_camada_a_core.py`

Os 107 arquivos recebidos permaneceram intactos. Arquivos novos iguais são aceitos numa repetição; os originais não são sobrescritos. O recibo identifica o que foi adicionado. Nenhum modelo, vetor ou banco de relatos é alterado; a página continua usando o backend anterior.

Em uma execução, são criados em Downloads `instalacao_adaptador_*.json` e `adaptador_camada_a_*.json`. A execução recebida já foi concluída e conferida; guarde os dois arquivos como evidência local.

## Interface preparada

```python
from agente_analista.camada_a import abrir_camada_a

with abrir_camada_a("/caminho/camada_a") as corpus:
    fragmento = corpus.fragmento("ID ORIGINAL DO FRAGMENTO")
    bloco = corpus.bloco(fragmento["bloco_id"])
    contexto = corpus.contexto(fragmento["id"], raio=1)
```

O adaptador expõe `manifesto`, `fragmentos`, `por_id`, `indice_por_id`, `blocos` e `vetores` no formato esperado. A matriz é o mesmo mmap completo somente leitura, com duração limitada ao corpus aberto; não use arrays ou views após `close()`.

Nos registros adaptados, `original` conserva a origem e `paginas_origem` conserva o metadado amplo. `paginas` contém as páginas PDF derivadas das posições do fragmento/bloco. Os offsets de fragmentos e citações permanecem locais ao bloco, Unicode base zero e fim exclusivo; as posições globais ficam no rastreio. O título completo vem da obra no SQLite, sem deduzi-lo do cabeçalho truncado.

## Situação e validação

Passaram 38 testes novos/do core, incluindo citações pelo validador existente, referências, campos JSON, ordem vetorial, fechamento de recursos e erros compatíveis. O driver do adaptador passou em cinco testes específicos. A instalação foi verificada quanto a preservação dos originais, adição de três arquivos, repetição, conflitos, diferença de versão, recibo existente e rollback de falha simulada.

Nas regressões existentes, foram executados 69 métodos. Dois apresentam divergências anteriores a esta mudança: `EntradaTests.test_vazio_e_paragrafos_invalidos` espera exatamente dois parágrafos, mas a regra atual aceita relatos não vazios até 400 palavras; `BuscaTests.test_estrategia_analista_continua_restrita_a_paragrafos_e_documento` espera rejeição de períodos/contextos, mas o código atual os aceita. Essas regras e testes permaneceram intactos. A importação completa também depende de dez fixtures JSON congeladas não incluídas no ZIP; não foi apresentada como validada.

O servidor Flask foi verificado em ambiente de desenvolvimento: página, JavaScript e status responderam; o status informou a ausência esperada do índice legado neste ambiente. Nenhum provedor foi chamado. A execução do adaptador sobre os dados completos no Mac foi concluída e conferida conforme [CONCLUSAO_ETAPA2.json](CONCLUSAO_ETAPA2.json).

## Limites para a próxima etapa

O adaptador marca a fonte antiga do volume 19, preservando suas 1.372 linhas. O pacote ZIP e seu checksum conservam a versão aplicada; este README, VALIDACAO.json e a conclusão registram a conferência posterior do Mac. **O Buscador legado ainda ignora essa marca.** A conexão da busca só deve ocorrer na etapa 3, com exclusão dessa fonte e BM25/FTS5 tratados no backend correspondente. Nenhuma rota, backend padrão ou RRF foi alterado nesta entrega.

A igualdade com o NPY auditado comprova preservação da matriz, não a origem histórica de cada embedding. Qualidade editorial, correções dos volumes 1/6, publicidade em 4/5/7 e a nova versão vetorial do volume 19 permanecem conforme as decisões da etapa 1.
