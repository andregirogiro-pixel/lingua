# Conclusão da etapa 1

**Etapa 1 encerrada como validação estrutural concluída com limites documentados.** A execução aconteceu no Mac em 11/10/2026 às 22:45:24 (America/Sao_Paulo). O relatório foi recebido e conferido, incluindo o cruzamento com os textos e metadados previamente analisados.

## Resultados do corpus real

| Verificação | Resultado |
| --- | --- |
| Obras / volumes | 19, cobrindo 1–19 |
| Seções | 874 |
| Páginas PDF | 5.968 |
| Blocos | 7.754 |
| Fragmentos | 8.594 |
| Matriz E5 | 8.594 × 1.024, float32 |
| Linhas vetoriais conferidas | Todas as 8.594; finitas e normalizadas em L2 |
| Verificações estruturais | 12 passaram, zero falhas |
| Hashes antes/depois | 28 arquivos com conteúdo inalterado |

Foram conferidos IDs, cobertura textual, hashes, posições no texto, sequência de páginas, relações entre obras/seções/blocos/fragmentos, vizinhos, JSONLs, SQLite e FTS5. O modelo e a revisão declarados coincidem com o E5 já validado: `intfloat/multilingual-e5-large`, revisão `3d7cfbdacd47fdda877c5cd8a79fbcc4f2a574f3`.

A norma dos vetores variou de 0.999999922363 a 1.000000088247, dentro da tolerância de 0,00003. A auditoria não carregou o modelo nem recalculou vetores.

## Cruzamento com a revisão textual

Os hashes e tamanhos dos **19 TXT do corpus auditado no Mac** coincidem com os arquivos de `obras.zip`. Os hashes do manifesto e do relatório de qualidade também coincidem com os metadados originais já enviados. Assim, a revisão textual anterior aplica-se ao mesmo conjunto efetivamente auditado.

O relatório de origem identifica os **19 PDFs não indexados como arquivos auxiliares AppleDouble** (`__MACOSX/._…`), não como volumes ausentes. As contagens reais confirmam os 19 volumes.

## Decisões e limites preservados

- **Volume 19 antigo:** texto rejeitado como fonte textual aprovada. A fonte nova permanece preparada e aceita tecnicamente como candidata; sua segmentação, novos vetores e índice pertencem às etapas posteriores.
- **Volumes 1 e 6:** correções específicas de caracteres por fonte/contexto, ainda a executar em versão própria.
- **Volumes 4, 5 e 7:** separar publicidade na futura política de busca, preservando originais e suas referências.
- **779 blocos atravessam seções:** o gerador v1 registra a seção da página inicial. Essa limitação foi confirmada e precisa ser respeitada no rastreio dos resultados.
- **Correspondência histórica vetor–texto:** continua sem comprovação por hashes originais confiáveis por linha. A estrutura e a ordem declarada passaram; esses testes não demonstram qual texto gerou cada vetor.
- **Conferência editorial integral:** permanece fora do resultado estrutural. O relatório de origem declara 38 páginas com OCR e 33 sem texto; essas quantidades não provam perda de conteúdo por si só. A paginação registrada é a do PDF.
- **Tokens:** foram conferidos os limites declarados, sem recontagem pelo tokenizador. Papéis/conceitos lexicais continuam provisórios.

## Registro e encerramento

Relatório original: `auditoria_camada_a_20261011_224524_20028.json`. SHA256: `16fc7a27a8693c76ee37e970a6fb373aa1ba1634bd444689b110b16d7a27d0f6`. A síntese com verificações e hashes está em `CONCLUSAO_ETAPA1.json`; o relatório original permanece como evidência recebida.

O trabalho de auditoria e registro das fontes está concluído. As correções textuais e a integração ao aplicativo são trabalhos posteriores. A etapa 2 fica para a próxima conversa; este encerramento não conecta o leitor nem ativa o corpus no aplicativo.
