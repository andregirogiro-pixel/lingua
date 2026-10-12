# Volume 19 — resultado real do Colab conferido

O corpus novo foi recebido e aceito com limites. O ZIP e os dez arquivos conferem com o relatório do Colab. A geração declarou CUDA, float32, E5 multilingual large na revisão fixa e lote 2.

Foram conferidos todos os **440 vetores de 1.024 dimensões**, finitos, distintos, normalizados L2 e vinculados aos hashes das entradas e linhas. O texto é byte a byte igual à preparação auditada: 537.994 caracteres Unicode, preservando as páginas PDF 10–232 em 223 blocos, com 49 seções do sumário. O consumidor real abriu a matriz em mmap somente leitura; SQLite, referências e FTS5 passaram.

A recuperação composta foi exercitada com o corpus novo real e uma base sintética. Três consultas técnicas, usando linhas já presentes no corpus, recuperaram candidatos e passaram na conferência literal das citações. Esse teste confirma integração técnica; não avalia pertinência interpretativa de relatos. Não foi reexecutada inferência nesta auditoria, nem retokenização independente. A revisão editorial integral, bibliografia e numeração impressa continuam pendentes.

A conferência junto à base completa do Mac foi recebida depois deste resultado do Colab: dezoito verificações passaram, com 9.034 fragmentos totais e 7.662 elegíveis (7.222 da base após excluir o volume 19 antigo, mais 440 novos). Veja [a conclusão da etapa 3](../busca/CONCLUSAO_ETAPA3.md). As 1.372 linhas antigas continuam no NPY original, fora da recuperação. As matrizes permanecem separadas.

Veja [a conferência técnica](CONFERENCIA_COLAB.json). A geração e a validação técnica da busca no corpus completo foram concluídas; a ativação do servidor e a avaliação com relatos reais são os próximos passos.
