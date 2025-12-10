#### Click to [English version](./README_EN.md)

# 💤 Mi Configuración LazyVim

Esta es mi configuración personalizada de [LazyVim](https://github.com/LazyVim/LazyVim) diseñada para aumentar la productividad y proporcionar una experiencia de desarrollo agradable con Neovim moderno.

Si quieres aprender más sobre Vim/NeoVIM, puedes seguir este curso gratuito en español sobre [Vim y NeoVim Fácil](https://youtube.com/playlist?list=PLt8PjPook45ZemtwXONrL5mrN-NTd71Lo&si=CKZKMrOKoWXqQ2Tw) para la comunidad.

## 📁 Estructura de Directorios

Aquí tienes un desglose rápido de la estructura:

![Estructura de Directorios](./assets/dir.jpg)

## 🔌 Plugins

Algunos de los plugins notables configurados:

- **cmp.lua** – Autocompletado (probablemente usando `nvim-cmp`)
- **codeium.lua / copilot.lua** – Asistentes de código impulsados por IA
- **colorscheme.lua** – Configuración de tema
- **toggleterm.lua** – Gestión integrada del terminal
- **treesitter.lua** – Análisis y resaltado de sintaxis
- **refactoring.lua** – Herramientas de refactorización
- **vim-visual-multi.lua** – Soporte para múltiples punteros visuales

## 🛠 Características

- Mapas de teclado personalizados para la productividad
- Sugerencias de código impulsadas por IA
- Formateo de código con `stylua`
- Terminal integrado y herramientas de refactorización
- Soporte para fragmentos de código (consulta `snack.lua`)
- Edición con múltiples punteros visuales

## 🚀 Comienzo

### Requisitos Previos

- [Neovim 0.9+](https://neovim.io/)
- Git
- `LazyGit`, `ripgrep`, `fd` y otras herramientas CLI comunes
- Para autenticarte con copilot en el modo comando escribe :copilot auth

### Instalación

- Proporcionado por [LazyVim.com](https://www.lazyvim.org/installation)

```bash
# requerido
mv ~/.config/nvim{,.bak}

# opcional pero recomendado
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

```bash
git clone https://github.com/shashinvision/lazyvimCustomConfig.git ~/.config/nvim
nvim
```

- Si quieres usar tu propio repositorio basado en este proyecto, puedes usar el siguiente comando:

```bash
rm -rf ~/.config/nvim/.git
```

- ERRORES de esta version en Mac
  Edita esta linea

```
nvim ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/lsp/init.lua
```

Reemplaza

```
vim.lsp.inlay_hint.enable(buffer, true)
```

por esto

```
if vim.lsp.inlay_hint and type(vim.lsp.inlay_hint.enable) == "function" then
  vim.lsp.inlay_hint.enable(buffer, true)
end
```

## Alerta en el caso de usar Linux o Mac y veas estos errores para C# omnisharp on NeoVim/LazyVim

```bash
sudo apt update
sudo apt install mono-complete
sudo apt install cargo
```

Or on Mac

```bash
brew install mono

```

- C#

```bash
dotnet tool install -g dotnet-omnisharp
```

```bash
# Download the latest version of omnisharp-roslyn
git clone https://github.com/OmniSharp/omnisharp-roslyn.git
cd omnisharp-roslyn
./build.sh
```
