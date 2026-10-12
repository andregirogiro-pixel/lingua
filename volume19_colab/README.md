# Volume 19 corrigido — aplicar no Mac

O resultado real do Colab foi conferido: 440 vetores × 1.024 dimensões, texto integral, offsets e hashes. Leia [a conferência](CONFERENCIA_COLAB.md) e [os testes de aplicação](VALIDACAO_APLICACAO.json).

Encerre o Agente Analista e evite editar o código durante a aplicação. No terminal:

```bash
curl -fL \
  "https://raw.githubusercontent.com/andregirogiro-pixel/lingua/integracao-etapa-3/volume19_colab/aplicar_volume19_colab.zip" \
  -o "$HOME/Downloads/aplicar_volume19_colab.zip" && \
unzip -o "$HOME/Downloads/aplicar_volume19_colab.zip" -d "$HOME/Downloads" && \
bash "$HOME/Downloads/aplicar_volume19_colab/continuar_no_mac.sh"
```

O pacote guarda backup dos dois arquivos modificados, preserva o corpus antigo, importa os 440 vetores em uma pasta própria de `instance` e confere a busca combinada. Não baixa modelos, chama provedores ou ativa servidor. Depois envie `busca_camada_a_*.json`, criado em Downloads. A base completa do Mac ainda não foi conferida com o novo volume neste ambiente.

[Instruções e limites completos](APLICACAO_NO_MAC.md). O checksum do pacote está em `aplicar_volume19_colab.zip.sha256`.
