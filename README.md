# Língua — auditoria e leitura da Camada A

A leitura independente da etapa 2 passou no corpus real do Mac e o código atual do aplicativo foi recebido. O adaptador opcional está implementado, com 38 testes específicos passando; o diagnóstico passou em cinco testes. O pacote de aplicação está em `adaptador/etapa2_adaptador.zip`. Consulte [as instruções](adaptador/README.md) e [as verificações e limites](adaptador/VALIDACAO.json).

A instalação acrescenta três arquivos e preserva os originais; verifica a versão antes de escrever. Falta confirmar a execução do adaptador no corpus completo após aplicar o pacote no Mac. A busca, o backend padrão e as rotas continuam na versão anterior. O pacote anterior do leitor independente permanece em `leitura/etapa2_leitura.zip`.

A etapa 1 foi encerrada com limites documentados após auditoria do corpus real no Mac e conferência do relatório: 12 verificações passaram, zero falhas. Foram confirmados 19 volumes, 7.754 blocos, 8.594 fragmentos e todas as linhas da matriz E5.

Leia [a conclusão](auditoria/CONCLUSAO_ETAPA1.md) e [a síntese técnica](auditoria/CONCLUSAO_ETAPA1.json). O pacote atualizado está em `auditoria/etapa1_auditoria.zip`; seu SHA256 está em `auditoria/etapa1_auditoria.zip.sha256`.

Os limites de qualidade textual e proveniência permanecem registrados. A fonte antiga do volume 19 requer substituição por versão própria; não foram gerados embeddings novos nem conectado o aplicativo.

As instruções para reproduzir a auditoria estão no README do pacote. A execução já recebida não precisa ser repetida agora.
