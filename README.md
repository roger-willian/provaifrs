[![principal](https://github.com/roger-willian/provaifrs/actions/workflows/principal.yml/badge.svg)](https://github.com/roger-willian/beamerthemeifrs/actions/workflows/principal.yml)

# Modelo de prova para o IFRS

Esse repositório contém um modelo em LaTeX das provas que eu aplico no IFRS.

Esse não é um repositório oficial do IFRS.

# Gerar o PDF

A seguir, algumas instruções para gerar o PDF com os slides.

## Arquivos estritamente necessários

O arquivo da classe LaTeX é esse:

```
provaifrs.cls
```

Além desse, é preciso um arquivo em LaTeX com a prova como o arquivo `prova.tex`.

## Arquivos de exemplo

É fornecida uma imagem de exemplo no diretório `images/`

## Sugestões de como gerar

São sugeridas duas maneiras de produzir os slides:

1. Gerar localmente com o latexmk
2. Gerar remotamente com o Overleaf

### Latexmk

Aqui é assumido que o TexLive e o latexmk já estão instalados na máquina.
Se ainda não instalou, veja a seção [Dependências](#dependencias)
Baixe o arquivo compactado com a release desejada [aqui](https://github.com/roger-willian/beamerthemeifrs/releases).
Descompacte o arquivo para um diretório próprio.
Entre no diretório e, se , para gerar o PDF use o comando:

`latexmk -pdf prova.tex`

### Overleaf

O [Overleaf](https://www.overleaf.com) é um serviço de edição de LaTeX e geração de PDF muito usado no meio acadêmico.

Para copiar os arquivos necessários para um novo projeto no Overleaf e já sair editando esse projeto, basta clicar [aqui](https://www.overleaf.com/docs?snip_uri=https://github.com/roger-willian/beamerthemeifrs/releases/download/v1.0.1/release.zip).

# <a name="dependencias"></a>Dependências

Para instalar o TexLive e o latexmk no Ubuntu, use:

```
apt-get -y update && apt-get install -y \
texlive-latex-extra \
texlive-fonts-extra \
texlive-publishers \
texlive-science \
texlive-lang-portuguese \
latexmk
```
