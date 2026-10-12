# Etapa 3 — busca da Camada A e volume 19 no Colab

Esta entrega prepara a busca opcional e a geração de vetores novos do volume 19. A execução real dos embeddings no Colab e a busca no corpus completo no Mac ainda precisam ser realizadas. O texto corrigido tem identidade própria; os 1.372 vetores antigos do volume 19 permanecem no arquivo original e são excluídos antes da seleção de resultados, âncoras e fusão RRF.

## Primeiro: gerar no Colab

Abra [o notebook](https://colab.research.google.com/github/andregirogiro-pixel/lingua/blob/integracao-etapa-3/colab/gerar_volume19_colab.ipynb), selecione GPU se disponível e use **Executar tudo**. CPU também é aceita. Não precisa enviar novamente o PDF: o pacote contém o texto e mapas auditados das páginas PDF 10–232, com todos os seus hashes. O modelo baixado é E5 multilingual large, na revisão fixa `3d7cfbdacd47fdda877c5cd8a79fbcc4f2a574f3`; o processamento usa float32, mean pooling, prefixo passage e L2, sem truncar conteúdo.

O texto e seus registros são processados no ambiente do Google. Nenhum relato pessoal é incluído neste notebook. Ao terminar, baixe `volume19_vetores_colab_*.zip` e `volume19_vetores_colab_*.json`. Envie o JSON para conferência e guarde o ZIP. O notebook confere cada arquivo antes de exportar; vetores sintéticos de teste não são aceitos.

## Depois: aplicar e verificar no Mac

Encerre o Agente Analista pelo terminal e evite editar seus arquivos durante a aplicação. O instalador confere a versão recebida antes de escrever, salva backup dos dois módulos modificados (`app.py` e `busca.py`) e acrescenta seis arquivos. Recusa alterações locais, versões diferentes ou arquivos novos conflitantes. O rollback restaura apenas alterações detectadas como pertencentes à instalação; não oferece garantia contra uma edição que ocorra no intervalo entre conferência e substituição.

Para reproduzir a busca sobre a base atual, sem incluir ainda o volume corrigido:

```bash
bash "$HOME/Downloads/etapa3_busca/aplicar_e_verificar_no_mac.sh"
```

Isso não ativa um servidor nem altera os corpora ou o banco de relatos. A verificação usa consultas técnicas com linhas já presentes na matriz; não é uma avaliação de relevância de relatos. Os 18 outros volumes participam, e a fonte antiga do volume 19 permanece excluída.

Após conferir o resultado do Colab, extraia o ZIP em uma pasta nova e mantenha o conjunto completo, sem misturá-lo com a matriz antiga. A pasta `volume19_camada_a_novo` contém o manifesto, banco, referências, vetores e proveniência. Para validar também essa fonte:

```bash
bash "$HOME/Downloads/etapa3_busca/aplicar_e_verificar_no_mac.sh" \
  "/Users/rodrigodevellis/lingua-agente" \
  "/Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a" \
  "/caminho/novo/volume19_camada_a_novo"
```

Arquivos já instalados e iguais são aceitos sem reescrita. O relatório `busca_camada_a_*.json` é a evidência da conferência local. Guarde também o recibo e a pasta `backup_busca_*` em Downloads. Uma falha do diagnóstico retorna código diferente de zero e não significa que a instalação foi desfeita; o relatório indica o problema e o backend padrão continua legado.

## Seleção explícita da busca

Depois da conferência local, os comandos para selecionar a Camada A ficam em `agente_analista/AMBIENTE.md`, instalado no projeto. O padrão continua legado. A variável `AGENTE_ANALISTA_VOLUME19_CORRIGIDO` aponta para a pasta nova e não substitui a base auditada. Cada fonte conserva seu mmap; não é produzida uma matriz concatenada. O índice FTS5 temporário reúne somente documentos elegíveis para manter BM25 comparável entre fontes. A RRF, os pesos, âncoras e o contrato de citações são reutilizados.

A importação agora confere o corpus real selecionado. Um manifesto isolado, sem os arquivos do índice, não basta para importar no serviço real. Serviços fake usados em testes conservam o contrato anterior de `.pasta`.

## Validação e limites

Consulte `VALIDACAO.json`, `VALIDACAO_INSTALADOR.json` e o relatório de validação do notebook no GitHub. A fonte nova foi preparada a partir do PDF SHA256 `1b4ea213276f48f77b53349109c9d9a352ade2225de43aa50765225db5c0a3ba`, com 244 páginas, 223 selecionadas e 49 entradas de sumário.

A geração registra cada entrada de embedding e o hash da linha correspondente. Esse registro documenta a geração e detecta alterações posteriores; não é uma segunda inferência independente. A correspondência histórica entre vetores e textos da base antiga continua não comprovada. Bibliografia, numeração impressa e revisão editorial integral permanecem pendentes, assim como as correções dos volumes 1/6 e publicidade em 4/5/7. Os novos vetores não alteram esses volumes. Nenhum provedor de justificativas é chamado pela geração ou pelo diagnóstico.

O campo `pronto_para_busca=False` no manifesto da geração registra que exportar os embeddings não ativa a busca nem conclui a revisão editorial. O backend aceita a fonte somente após conferir a geração real e seus hashes.
