# Ambiente local do Língua e do Agente Analista

Leia este arquivo antes de executar os aplicativos. Use o Python existente
pelo caminho completo: uma `.venv` ativa no terminal pode pertencer a outro
projeto. Os comandos abaixo partem da instalação já verificada no Mac Intel.
Não reinstalam dependências nem baixam modelos.

## Caminhos verificados

| Item | Caminho |
| --- | --- |
| Projeto | `/Users/rodrigodevellis/lingua-agente` |
| Python com Flask, spaCy, Torch e SentenceTransformers | `/Users/rodrigodevellis/lingua-agente/instance/venv-agente-e5-intel/bin/python` |
| Cache E5 Hugging Face | `/Users/rodrigodevellis/lingua-agente/instance/huggingface/hub` |
| Corpus original Camada A | `/Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a` |
| Agente Analista | `/Users/rodrigodevellis/lingua-agente/agente_analista` |
| Língua | `/Users/rodrigodevellis/lingua-agente/lingua` |

Nesse Python foram confirmados Torch 2.2.2 e NumPy 1.26.4. O E5 é
`intfloat/multilingual-e5-large`, revisão fixa
`3d7cfbdacd47fdda877c5cd8a79fbcc4f2a574f3`. O comando `--descrever`
conseguiu abrir o modelo no cache acima. O Agente Analista usa os vetores
prontos; somente o Língua ou o notebook do Colab precisam inferir embeddings.

## Iniciar os dois aplicativos

Abra um terminal para cada servidor. O Língua usa a porta 5001:

```bash
cd /Users/rodrigodevellis/lingua-agente/lingua
export LINGUA_CACHE_MODELOS=/Users/rodrigodevellis/lingua-agente/instance/huggingface/hub
../instance/venv-agente-e5-intel/bin/python app.py
```

O Agente Analista usa a porta 5002. Seu padrão continua sendo o índice legado:

```bash
cd /Users/rodrigodevellis/lingua-agente
AGENTE_ANALISTA_CORPUS_BACKEND=legado \
  ./instance/venv-agente-e5-intel/bin/python -m agente_analista.app
```

Abra `http://127.0.0.1:5001` ou `http://127.0.0.1:5002` e mantenha os terminais
abertos. `Ctrl+C` encerra o servidor. O Agente Analista libera seus índices e
matrizes ao encerrar; os relatos e resultados salvos permanecem no banco.

## Selecionar a Camada A depois da validação local da etapa 3

Instalar o código e criar o corpus corrigido não alteram o índice selecionado.
Depois de conferir o relatório de busca no Mac, a seleção é explícita:

```bash
cd /Users/rodrigodevellis/lingua-agente
AGENTE_ANALISTA_CORPUS_BACKEND=camada_a \
AGENTE_ANALISTA_CAMADA_A=/Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a \
  ./instance/venv-agente-e5-intel/bin/python -m agente_analista.app
```

Para incluir o volume 19 corrigido, acrescente
`AGENTE_ANALISTA_VOLUME19_CORRIGIDO=/caminho/do/corpus/corrigido` no mesmo
comando, antes do caminho do Python. Use a pasta validada que contém
`manifesto.json`, `corpus.sqlite`, `fragmentos.jsonl` e `vetores_e5.npy`.
O novo corpus permanece separado do original; suas matrizes não são
concatenadas nem regravadas. A fonte antiga
`obra-3b8627dba63512a2` é sempre excluída da busca na Camada A, incluindo os
contextos. Se a fonte corrigida não estiver presente, a busca usa as outras
obras disponíveis e informa essa ausência no status.

Confira `http://127.0.0.1:5002/api/status`: ele declara o backend, as contagens
totais e elegíveis, a exclusão fixa e a presença do volume corrigido. A
importação de uma vetorização confere o manifesto desse mesmo corpus.

## Variáveis de configuração

As variáveis são lidas do processo ao iniciar o serviço. Alterá-las em outro
terminal não muda um servidor que já está aberto. Reinicie o processo para
aplicar a configuração. Este arquivo documenta a configuração; não é
executado automaticamente pelo Python.

| Variável | Aplicativo e comportamento |
| --- | --- |
| `AGENTE_ANALISTA_CORPUS_BACKEND` | `legado` por padrão; `camada_a` seleciona a nova busca. Outros valores interrompem a inicialização com orientação. |
| `AGENTE_ANALISTA_CAMADA_A` | Pasta do corpus base; obrigatória quando o backend é `camada_a`. Definir somente esta variável não ativa a Camada A. |
| `AGENTE_ANALISTA_VOLUME19_CORRIGIDO` | Pasta opcional do corpus corrigido, usada somente com `camada_a`. A fonte precisa passar pelo contrato do mesmo espaço E5. |
| `AGENTE_ANALISTA_DB` | SQLite do histórico do agente. Padrão: `instance/agente_analista.sqlite3` na raiz do projeto. Não é o banco do Língua nem o `corpus.sqlite` de leitura. |
| `LINGUA_CACHE_MODELOS` | Cache do modelo para o Língua. Use o caminho verificado acima; uma opção explícita `cache_modelos` no perfil prevalece. Trabalhos já salvos mantêm seu cache de origem. |
| `ANALISE_DB` | SQLite do Língua; padrão no projeto: `instance/textos.sqlite3` quando a raiz contém `.git`, ou `lingua/instance/textos.sqlite3` numa cópia sem `.git`. |
| `AGENTE_ANALISTA_PROVEDOR` | Usada por diagnóstico e funções de justificativas chamadas diretamente: `openrouter` por padrão ou `openai`. A página exige a escolha explícita. |
| `AGENTE_ANALISTA_MODELO` | Modelo de justificativas para diagnóstico/funções diretas. Na página o modelo selecionado prevalece; não seleciona E5. |
| `AGENTE_ANALISTA_API_KEY` | Credencial para diagnóstico/funções diretas. A página exige uma chave no campo próprio, independentemente desta variável. Não salve a chave neste arquivo ou no GitHub. |
| `SSL_CERT_FILE`, `SSL_CERT_DIR` | Caminhos de certificados nativos reconhecidos pelo Python. Só configure quando houver uma necessidade concreta da rede. |
| `REQUESTS_CA_BUNDLE`, `CURL_CA_BUNDLE` | Arquivo de certificados adicional do transporte das justificativas; o primeiro tem precedência. Certifi também é carregado quando disponível. |
| `HTTPS_PROXY`, `HTTP_PROXY`, `ALL_PROXY` e versões minúsculas | Configurações de proxy da rede reconhecidas pelo diagnóstico e transporte HTTP. Não são necessárias para a busca local. |
| `NO_PROXY`, `no_proxy` | Hosts que devem evitar o proxy; a execução dos aplicativos é local. |
| `HF_HOME`, `HF_HUB_CACHE`, `HF_XET_CACHE` | Configurações da biblioteca Hugging Face. O Língua passa `cache_dir` do perfil explicitamente; definir `HF_HOME` não substitui `LINGUA_CACHE_MODELOS`. `HF_XET_CACHE`, se ausente, é definido sob o cache selecionado ao carregar o modelo. |
| `HF_HUB_OFFLINE`, `TRANSFORMERS_OFFLINE` | Modos offline das bibliotecas. A execução local do Língua usa `somente_local` no perfil e requer os arquivos já presentes no cache. |
| `AGENTE_ANALISTA_VETORIZACAO_REAL` | Caminho de exportação real opcional, usado por testes; não altera o servidor. |
| `AGENTE_ANALISTA_TESTE_E5_REAL` | Habilita teste neural opcional documentado em `PREPARACAO_NUVEM.md`; não é necessário para consultar vetores prontos. |

`NARRATIVA_API_KEY` pertence ao fluxo anterior do Língua. O Agente Analista
atual não a usa como substituta da sua chave. Os arquivos sob `legado/`
possuem configurações históricas, incluindo `LINGUA_EMBEDDINGS_CONFIG` e
`LINGUA_EMBEDDINGS_*`; elas não configuram a busca atual do agente.

## Conferir antes de corrigir o ambiente

```bash
cd /Users/rodrigodevellis/lingua-agente
./instance/venv-agente-e5-intel/bin/python -c 'import sys, flask, numpy; print("Python:", sys.executable); print("NumPy:", numpy.__version__)'
```

Para conferir o modelo local sem baixá-lo:

```bash
cd /Users/rodrigodevellis/lingua-agente/lingua
../instance/venv-agente-e5-intel/bin/python modelo_embeddings.py \
  --descrever --perfil e5_simetrico \
  --cache-modelos /Users/rodrigodevellis/lingua-agente/instance/huggingface/hub
```

Se aparecer `No module named ...`, primeiro confira `sys.executable`. Se
aparecer erro de cache, confira o cache selecionado no perfil e reinicie o
Língua com `LINGUA_CACHE_MODELOS`. Uma execução antiga pode conservar o cache
que tinha quando foi criada; gere uma nova execução após ajustar o processo.
O download do modelo só deve ser executado explicitamente quando faltar um
artefato e houver autorização para baixar.

Para uma porta ocupada, identifique o processo antes de encerrá-lo:

```bash
lsof -nP -iTCP:5001 -sTCP:LISTEN
lsof -nP -iTCP:5002 -sTCP:LISTEN
```

Encerre pelo terminal que abriu o servidor quando possível. Não mate todos
os processos Python: outros projetos podem estar usando o mesmo sistema.

O Colab executa em outro computador. O notebook precisa conter o texto
corrigido, seus registros e o contrato E5 fixo. Seus caminhos Mac e cache
local não são usados no Colab. O pacote resultante deve ser conferido antes
de configurar `AGENTE_ANALISTA_VOLUME19_CORRIGIDO`.
