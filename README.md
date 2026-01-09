# dotfiles

my dev setup for macOS

## what's here

- fish shell + modern cli tools
- kitty terminal (tokyo night)
- starship prompt
- neovim config
- git aliases

## tools i use

replaced the old stuff with better alternatives:
- ls → eza (icons!)
- cat → bat (syntax highlighting)
- find → fd (faster)
- grep → rg (way faster)
- cd → zoxide (smart jumps)

## setup

```bash
git clone https://github.com/kamaldhitalofficial/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles
stow fish kitty starship nvim git
```

**important:** setup your git config first:
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

## syncing

when i change something:
```bash
./sync.fish
git add .
git commit -m "update stuff"
git push
```
