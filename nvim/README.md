# Neovim Keybindings & Atalhos

Este documento lista todos os atalhos personalizados do seu setup Neovim, organizados por categoria e função. Use `<leader>` como a tecla espaço (`Space`), conforme definido no seu `init.lua`.

---

## 📁 Buffer

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>b`    | Novo buffer                |
| `<Tab>`        | Próximo buffer             |
| `<S-Tab>`      | Buffer anterior            |
| `<leader>x`    | Fechar buffer atual        |
| `<C-p>`        | Escolher buffer pelo número|

---

## 🔍 Busca & Arquivos

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>ff`   | Buscar arquivo             |
| `<leader>fb`   | Buscar buffer              |
| `<leader>fw`   | Buscar texto (grep)        |
| `<leader>fh`   | Buscar ajuda               |
| `<leader>fd`   | File browser (Telescope)   |

---

## 🗂️ Terminal & Ferramentas

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>fto`  | Abrir terminal flutuante    |
| `<leader>lzg`  | Abrir LazyGit no terminal   |
| `<leader>lzd`  | Abrir LazyDocker no terminal|

---

## 🧑‍💻 Git

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>gvo`  | Abrir Diffview             |
| `<leader>gvc`  | Fechar Diffview            |
| `<leader>grh`  | Git reset --hard           |
| `<leader>gaa`  | Git add all                |
| `<leader>gp`   | Git push                   |
| `<leader>gc`   | Git commit                 |
| `<leader>gu`   | Git push upstream          |
| `<leader>gi`   | Git init                   |

---

## 🐍 Go

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>gsj`  | Adicionar tags JSON        |
| `<leader>gsy`  | Adicionar tags YAML        |
| `<leader>gfs`  | Preencher struct           |

---

## 🦀 Rust

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>re`   | Expandir macro Rust        |
| `<leader>rcu`  | Atualizar crates           |

---

## 🐘 Database

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>dad`  | Alternar DB UI             |

---

## 🐞 Debug

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>db`   | Alternar breakpoint        |
| `<leader>dc`   | Continuar execução         |
| `<leader>ds`   | Step into                  |
| `<leader>do`   | Step out                   |
| `<leader>dn`   | Step over                  |
| `<leader>dh`   | Terminar debug             |
| `<leader>dus`  | Abrir sidebar de debug     |
| `<leader>dw`   | Limpar breakpoints         |
| `<leader>dt`   | Alternar DAP UI            |
| `<leader>dr`   | Resetar DAP UI             |
| `<leader>dT`   | Alternar tipos no DAP UI   |

---

## 📝 LSP & Code

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `gD`           | Ir para declaração          |
| `gd`           | Ir para definição           |
| `gi`           | Ir para implementação       |
| `gr`           | Referências                 |
| `K`            | Hover (documentação)        |
| `<leader>ca`   | Code action                 |
| `<leader>ra`   | Renomear símbolo            |
| `<leader>h`    | Alternar inlay hints        |

---

## 🔢 Números

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>n`    | Alternar número de linha    |
| `<leader>rn`   | Alternar número relativo    |

---

## 🗂️ Folding

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>zc`   | Fechar bloco               |
| `<leader>zo`   | Abrir bloco                |
| `<leader>zM`   | Fechar todos os blocos     |
| `<leader>zR`   | Abrir todos os blocos      |

---

## ⚡ Outros

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<leader>Y`    | Yank buffer inteiro        |
| `<leader>qw`   | Colocar palavra entre aspas|
| `<leader>to`   | Alternar scrolloff         |
| `<leader>gl`   | Ir para linha específica   |
| `<leader>q`    | Forçar saída               |
| `<Esc>`        | Limpar highlight           |
| `<C-s>`        | Salvar arquivo             |

---

## 🖱️ Navegação

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `<C-h/j/k/l>`  | Mover entre splits         |
| `<C-h/j/k/l>` (insert) | Mover cursor        |

---

## 🗨️ Comentários

| Atalho         | Ação                        |
| -------------- | -------------------------- |
| `gcc`          | Comentar linha atual        |
| `gc`           | Comentar seleção           |
| `gbc`          | Comentar bloco atual       |
| `gb`           | Comentar bloco seleção     |


## 🖥️ Terminal Horizontal

| Atalho         | Ação                                         |
| -------------- | -------------------------------------------- |
| `<leader>tt`   | Abrir terminal embaixo (split horizontal)    |

### Navegação no Terminal

- Para alternar entre o terminal e outros splits:
  - `<C-w>h` — Ir para o split à esquerda
  - `<C-w>j` — Ir para o split abaixo
  - `<C-w>k` — Ir para o split acima
  - `<C-w>l` — Ir para o split à direita
  - `<C-w>p` — Voltar para o último split ativo

### Sair do modo terminal (sem fechar o terminal)

- Pressione `Esc` e depois `Ctrl-\` seguido de `Ctrl-n` (`<Esc><C-\><C-n>`) para voltar ao modo normal do Neovim, mantendo o terminal aberto.

---

> **Dica:** Use `<leader>` como a tecla espaço.  
> Muitos atalhos funcionam tanto no modo normal quanto visual.

---