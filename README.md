# LXQt-LabWC

- Config for running Labwc (Window Manager/Compositor) within an LXQt Wayland Session.

`>=` LXQt 2.1 supports several Wayland Compositors to control the desktop. LXQt provides lxpanel (the bar) and lxqt-runner (the launcher). Theming, power management, notifications, scaling and wallpaper slideshow are configured in LXQt Settings. 

[Labwc](https://labwc.github.io/index.html) takes a no-animation approach, focusing on stacking windows well whilst rendering some window decorations (tiling is done manually with keybindings as desired). WM shortcuts, monitor settings and screenshots are invoked via `~/.config/labwc/*`.

- If you didn't select LXQt Desktop Environment initially, install:

```
lxqt lxqt-config lxqt-policykit lxqt-powermanagement lxqt-wayland-session 
```

Install `labwc` & `playerctl` for media-player shortcuts.

Clone this repo 

```
git clone https://github.com/gnmearacaun/LXQt-Labwc.git
```

Move the `labwc` directory into your `~/.config/ directory` 

- Programs invoked from `autostart` and `rc.xml` may need to be installed separately. 

Enter `/usr/bin/labwc` into the input box in `LXQt Settings > Session Settings > Wayland Settings > Wayland Compositor`

Logout and select `LXQt (Wayland)` in the display manager for the next session. 


![screenshot](screenshots/2024-12-31.png)

![screenshot](screenshots/2024-12-31b.png)

![screenshot](screenshots/2024-12-31c.png)


### Things I Do On A New Build 

#### _Space2meta_ and _Caps2esc_ 

- Window managers make liberal use of the `Super` key to get around. 
[Space2meta](https://gitlab.com/interception/linux/plugins/space2meta) treats your spacebar as Meta (a.k.a. `Super`) when chorded with other keys. 

- [Caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc): _transforms the most useless key ever into the most useful one_ `<Caps_lock>` is `Esc` when tapped and `Ctrl` when held down with another key. 

Compile `space2meta` (Debian, `caps2esc` is available in the repo) 

```
sudo apt-get update
sudo apt-get install cmake ninja-build interception-caps2esc interception-tools interception-tools-compat 
git clone https://gitlab.com/interception/linux/plugins/space2meta.git
cd space2meta
cmake -Bbuild
cmake --build build
sudo mv build/space2meta /usr/local/bin  
cd .. && rm -r space2meta
```

Put the udevmon.yaml in place, enable and start the service  

```
sudo mkdir -p /etc/interception/udevmon.d
sudo mv udevmon.yaml /etc/interception/udevmon.d/
sudo systemctl enable --now udevmon.service
```

The following command increases the priority. 

```
sudo nice -n -20 udevmon -c udevmon.yaml >udevmon.log 2>udevmon.err &
```

- You may have to logout/login to get the effect.

#### Zsh and Zap Plugin Manager 

To set zsh as your default shell, execute the following.
```
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
```

Log out and back in. You're prompt will be basic. 

Install [zap](https://github.com/zap-zsh/zap) (replaces `oh-my-zsh`)

```
sudo apt-get install zsh zoxide
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

Reopen the shell, `zap` automajically installs the default plugins. 

- More plugins can be found on the [homepage](https://www.zapzsh.com/) 

#### [Nerdfonts](https://github.com/getnf/getnf)

Used by zsh and neovim, ranger (file manager) and other tui programs.

```
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
```

Run `getnf` in the terminal and follow the prompts. The fonts you select will be available system-wide.

#### A Minimal Vim Configuration 

I use a simple config (no plugins) authored by [jdhao](https://github.com/jdhao) while I'm  setting thing up and before neovim is built. It's also useful for occasional editing as `sudo`.

- The package `vim-gtk3` has better clipboard support than `vim` proper. Wayland users need `wl-clipboard` to copy and paste. 

```
sudo apt-get install vim-gtk3 wl-clipboard 
mv ~/.vimrc ~/.vimrc.bak
mkdir -p ~/.vim && cd ~/.vim
git clone https://github.com/jdhao/minimal_vim.git .
cd && sudo cp -r .vim /root
```


- Add the following line to your `init.vim` to yank to `wl-clipboard`. 

```
xnoremap <silent> <leader>y y:call system("wl-copy --trim-newline", @*)<cr>:call system("wl-copy -p --trim-newline", @*)<cr>
```

- Visually highlight the text with `v` or `shift+v` and the motion keys `h,j,k,l` and press `<leader>` (`,` by default) and then `y` to copy to system clipboard. Most terminals have `Ctrl+Shift+v` as the paste command. 

#### And A Fully Featured Neovim Starterplate 

To use the awesome [LazyVim](https://www.lazyvim.org/installation) config (see link for instructions) we need to build a newer version of Neovim than Trixie can offer. 

- Use `CMAKE_BUILD_TYPE=RelWithDebInfo` instead if you like reading debugging logs. `Release` used here runs a bit lighter.

- Use `git checkout stable` instead if preferred, I've never encountered any problems with `nightly`.

```
sudo apt-get install ninja-build gettext cmake unzip curl build-essential ripgrep fd-find fzf wl-clipboard 
git clone https://github.com/neovim/neovim.git
git checkout nightly 
make CMAKE_BUILD_TYPE=Release
cd build && sudo cpack -G DEB && sudo dpkg -i nvim-linux64.deb
nvim -V1 -v

```
Make it the default, add this line to your `.zshrc`

```
export EDITOR="nvim"
```

- Un/comment lines easily with 'gcc'. I often open nvim just to find a file on my system by `grepping` a keyword. Lazyvim displays all keyboard shortcuts after pressing the spacebar (leader key) via a plugin by the same developer/hero [Folke](https://github.com/folke).

Later when you want to upgrade, go back into the neovim directory (wherever it's stashed). Assuming you're on the branch you want, to rebuild from scratch and replace the current build:

```
git pull
sudo make distclean && make CMAKE_BUILD_TYPE=Release
cd build && sudo cpack -G DEB && sudo dpkg -i nvim-linux64.deb
nvim -V1 -v
```

In case you want uninstall or use a different git branch:

```
cd neovim && sudo cmake --build build/ --target uninstall
```

- Alternatively, just delete the CMAKE_INSTALL_PREFIX artifacts:
```

sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
```

____

The dark window dressing and some other elements of my config are thanks to https://github.com/stefonarch amongst other sources. 
____
