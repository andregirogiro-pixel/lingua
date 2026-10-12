# Língua — integração da Camada A

A etapa 3 está implementada e aguarda a geração real do volume 19 no Colab e a conferência da busca no corpus completo do Mac. Abra [o notebook do volume 19](https://colab.research.google.com/github/andregirogiro-pixel/lingua/blob/integracao-etapa-3/colab/gerar_volume19_colab.ipynb). As [instruções](busca/README.md), o [ambiente local](busca/AMBIENTE.md) e a [validação com limites](busca/VALIDACAO.json) acompanham o pacote `busca/etapa3_busca.zip`. Passaram 77 testes de fonte, sete do diagnóstico e oito do notebook sem inferência real. A fonte antiga do volume 19 é excluída efetivamente pela nova busca; a fonte corrigida recebe corpus e matriz próprios.

A etapa 2 foi concluída com limites após aplicação do adaptador no corpus completo do Mac: 11 verificações passaram, zero falhas. Foram preservados 8.594 vetores e conferidos 57 contextos e 57 citações literais. Leia [a conclusão](adaptador/CONCLUSAO_ETAPA2.md) e [a síntese técnica](adaptador/CONCLUSAO_ETAPA2.json). Os 38 testes específicos do adaptador e cinco do diagnóstico também passaram na entrega anterior. O pacote aplicado está em `adaptador/etapa2_adaptador.zip`; consulte [as instruções](adaptador/README.md) e [as verificações e limites](adaptador/VALIDACAO.json).

A instalação acrescenta três arquivos e preserva os originais; verifica a versão antes de escrever. A execução no corpus completo foi confirmada; não é necessário repetir a instalação ou o diagnóstico. A busca, o backend padrão e as rotas continuam na versão anterior. O pacote anterior do leitor independente permanece em `leitura/etapa2_leitura.zip`.

A etapa 1 foi encerrada com limites documentados após auditoria do corpus real no Mac e conferência do relatório: 12 verificações passaram, zero falhas. Foram confirmados 19 volumes, 7.754 blocos, 8.594 fragmentos e todas as linhas da matriz E5.

Leia [a conclusão](auditoria/CONCLUSAO_ETAPA1.md) e [a síntese técnica](auditoria/CONCLUSAO_ETAPA1.json). O pacote atualizado está em `auditoria/etapa1_auditoria.zip`; seu SHA256 está em `auditoria/etapa1_auditoria.zip.sha256`.

Os limites de qualidade textual e proveniência permanecem registrados. A fonte antiga do volume 19 requer substituição por versão própria; não foram gerados embeddings novos nem conectado o aplicativo.

As instruções para reproduzir a auditoria estão no README do pacote. A execução já recebida não precisa ser repetida agora.
