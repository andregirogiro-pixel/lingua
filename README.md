# Língua — auditoria e leitura da Camada A

A etapa 2 está em preparação: o leitor independente e a verificação local passaram em testes; faltam a execução no corpus real e o código atual do aplicativo para adaptar as interfaces. O pacote está em `leitura/etapa2_leitura.zip`. Consulte [as instruções](leitura/README.md).

A etapa 1 foi encerrada com limites documentados após auditoria do corpus real no Mac e conferência do relatório: 12 verificações passaram, zero falhas. Foram confirmados 19 volumes, 7.754 blocos, 8.594 fragmentos e todas as linhas da matriz E5.

Leia [a conclusão](auditoria/CONCLUSAO_ETAPA1.md) e [a síntese técnica](auditoria/CONCLUSAO_ETAPA1.json). O pacote atualizado está em `auditoria/etapa1_auditoria.zip`; seu SHA256 está em `auditoria/etapa1_auditoria.zip.sha256`.

Os limites de qualidade textual e proveniência permanecem registrados. A fonte antiga do volume 19 requer substituição por versão própria; não foram gerados embeddings novos nem conectado o aplicativo.

As instruções para reproduzir a auditoria estão no README do pacote. A execução já recebida não precisa ser repetida agora.
