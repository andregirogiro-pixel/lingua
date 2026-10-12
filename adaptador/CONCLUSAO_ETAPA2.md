# Conclusão da etapa 2 — leitura da Camada A

A etapa 2 está concluída com limites documentados. O adaptador opcional foi instalado no projeto do Mac e executado no corpus completo em 12/10/2026, às 05:15 (America/Sao_Paulo). As 11 verificações passaram, com zero falhas.

## O que foi confirmado

- Compatibilidade de IDs, aliases, referências e offsets para os 8.594 fragmentos e 7.754 blocos de 19 fontes.
- Preservação de todas as 8.594 linhas da matriz original de 1.024 dimensões, float32, no mesmo mmap somente leitura do leitor, sem cópia integral ou remoção de linhas.
- Igualdade dos 28 hashes do corpus com o baseline da etapa 1 e a leitura independente anterior; seis módulos do projeto mantiveram seus hashes durante a execução e correspondem ao código recebido/adaptador entregue.
- Conferência de 57 contextos e 57 citações literais, com três amostras por fonte. Destas citações, 23 cobrem mais de um fragmento e foram aceitas pelo validador local existente.
- Marcação das 1.372 linhas da fonte antiga do volume 19, preservando sua posição e conteúdo.

O relatório recebido é `adaptador_camada_a_20261012_051529_31262.json`, de 104.703 bytes, SHA256 `d6768f415e471aa9867c9326a897f59e8c80ec47882731ab533d38f926323d2c`. A conferência compara seu conteúdo com as evidências e os hashes já registrados; o corpus completo permanece no Mac e não foi reexecutado na nuvem. O relatório original recebido permanece intacto; esta síntese não publica seus caminhos locais nem substitui a evidência original.

A aplicação observada no terminal adicionou três arquivos e usou o Python E5 existente com NumPy 1.26.4. O pacote de instalação e seu checksum permanecem na versão já aplicada. O recibo da instalação não foi recebido; a evidência técnica aqui é o relatório da execução e o log enviado.

## Limites e próxima etapa

O backend de busca não foi ativado. O Buscador legado ignora a marca do volume 19; a conexão depende de implementar a exclusão efetiva na etapa 3, tanto na busca vetorial quanto na lexical. A etapa 3 não foi iniciada.

A comparação de todas as linhas comprova preservação da matriz auditada; não comprova a correspondência semântica histórica de cada embedding com seu texto. As citações verificam literalidade e offsets por amostragem, sem interpretação ou avaliação por provedor. As páginas são as do PDF; referências bibliográficas completas e numeração impressa continuam pendentes.

A fonte antiga do volume 19 exige substituição por nova versão com índices/vetores próprios. Mantêm-se as pendências editoriais dos volumes 1/6 e de publicidade nos volumes 4/5/7. Os 38 testes do adaptador e cinco do diagnóstico passaram na entrega anterior; duas divergências nos testes existentes e dez fixtures JSON ausentes impedem apresentar a suíte completa como validada. Veja [VALIDACAO.json](VALIDACAO.json) e [a síntese técnica](CONCLUSAO_ETAPA2.json).

Não é necessário repetir a instalação ou a conferência já concluída.
