# Gerar o volume 19 corrigido no Google Colab

Abra `gerar_volume19_colab.ipynb` no Colab. Se possível, selecione **Ambiente de
execução → Alterar tipo de ambiente de execução → GPU**. Execute as células em
ordem, ou use **Executar tudo**.

O notebook baixa a versão fixa do pacote `etapa3_busca.zip`, confere seu SHA-256
e usa o texto preparado das páginas PDF 10–232. Não exige o PDF nem depende do
ambiente Python do Mac. O texto e os registros serão processados no Google Colab.

O E5 Large é baixado explicitamente na revisão
`3d7cfbdacd47fdda877c5cd8a79fbcc4f2a574f3`. A inferência usa float32, prefixo
`passage: `, pooling médio e normalização L2. O lote inicial é 2; reduza para 1
se necessário. Não há truncamento do texto e os vetores antigos não são usados.

Ao terminar, baixe os dois arquivos:

- `volume19_vetores_colab_….zip`: corpus novo, vetores, entradas e proveniência;
- `volume19_vetores_colab_….json`: relatório de geração e validação com os hashes.

Envie o JSON para conferência e guarde o ZIP para a integração no Mac. A busca
não é ativada automaticamente. A conferência estrutural não equivale à revisão
editorial integral do livro.

Se o navegador bloquear downloads múltiplos, use o painel **Arquivos** do Colab,
abra `volume19_execucoes`, depois a pasta da execução, e baixe os dois arquivos
pelo menu. Faça isso antes de encerrar a sessão: `/content` é temporário.

O notebook recusa sobrescrever uma geração ou empacotamento existente. Uma
repetição das células de preparação reaproveita apenas arquivos cujos bytes
continuam iguais aos do pacote conferido. Para gerar outra execução, abra uma
nova sessão do Colab. Os hashes de cada arquivo e o ZIP final são conferidos
antes do download.
