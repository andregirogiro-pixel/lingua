# Aplicar os vetores reais do volume 19 no Mac

Este pacote contém exatamente o resultado recebido do Colab na execução
`20261012T103312Z_9f45c9aa`: 440 vetores reais E5, em float32, de dimensão 1024,
normalizados em L2. A fonte corrigida é `obra-1b4ea213276f48f7`. A geração cobre
223 blocos/páginas de corpo, nas páginas PDF 10–232. A conferência editorial
integral continua pendente.

Antes de executar, feche o Agente Analista e evite editar os arquivos Python
do projeto durante a instalação. O instalador guarda backup de `app.py` e
`busca.py`; a conferência antes da escrita detecta alterações locais, mas a
substituição desses dois arquivos não fornece bloqueio contra um editor que
salve entre a última conferência e a escrita.

Depois de descompactar em Downloads, execute:

```bash
bash "$HOME/Downloads/aplicar_volume19_colab/continuar_no_mac.sh"
```

O script usa o ambiente Python já instalado:
`/Users/rodrigodevellis/lingua-agente/instance/venv-agente-e5-intel/bin/python`.
Não instala dependências, carrega modelos nem baixa o E5 novamente. Para esta
conferência, Python 3.10+ e NumPy são suficientes.

1. Confere os SHA256 do código, JSON e ZIP recebidos, antes de extrair/executar
   o código de instalação.
2. Aplica a etapa 3 pelo instalador já revisado, com dois arquivos substituídos
   e seis arquivos novos. Guarda backup e recibo em Downloads. Se a versão do
   projeto divergir da revisada, recusa a instalação.
3. Confere os dez arquivos do volume 19 e executa o validador real sobre todas
   as 440 linhas. Publica o corpus em uma pasta própria:
   `/Users/rodrigodevellis/lingua-agente/instance/volume19_camada_a_20261012T103312Z_9f45c9aa`.
   O corpus histórico permanece intacto. Uma pasta já idêntica é aceita; um
   conflito é preservado e recusado.
4. Executa a conferência de busca usando a Camada A original mais o volume 19
   corrigido, e escreve `busca_camada_a_<execução>.json` em Downloads.

Envie o último relatório JSON. Guarde `backup_busca_<execução>/`,
`instalacao_busca_<execução>.json` e `importacao_volume19_<execução>.json`.
Nenhum servidor ou backend é ativado pelo script. A seleção do backend será
feita após a conferência do relatório real do Mac.

O resultado integral da busca sobre a Camada A histórica depende dos arquivos
existentes no Mac. Esses SQLite/NPY não foram enviados à nuvem. A importação dos
440 vetores reais e seus testes foi conferida na nuvem; a execução combinada
com o corpus histórico permanece pendente do relatório do Mac.

Para caminhos diferentes, os argumentos posicionais são projeto, corpus base e
pasta de saída. O Python pode ser selecionado pela variável somente deste comando:

```bash
PYTHON_VOLUME19="/caminho/do/python" bash continuar_no_mac.sh \
  "/caminho/do/projeto" "/caminho/da/camada_a" "/caminho/da/saida"
```

O destino do volume 19 é sempre uma subpasta dedicada em `instance` do projeto
selecionado. Tanto `instance` quanto a pasta de saída devem existir previamente.
Se uma etapa falhar, o script termina com o código dessa etapa. Uma falha da
conferência final não desfaz a instalação já concluída nem o corpus validado;
os recibos e o backup permitem verificar os passos realizados.

Para repetir os testes deste importador no Python escolhido:

```bash
"/caminho/do/python" -B -m unittest discover \
  -s ferramentas -p test_importar_volume19.py -v
```
