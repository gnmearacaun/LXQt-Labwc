# LXQt-LabWC

My config for running Labwc (Window Manager) in an LXQt (Wayland) session.

I am using Endeavour OS (Arch Linux) as my base OS. It makes sense to use a rolling release OS to get the latest packages for LabWC, though in future I may use something like [Mabox](https://forum.maboxlinux.org/t/labwc-in-mabox-status/2138), a 'relaxed' rolling release based on Manjaro for less frequent Arch Linux updates. I began using lightweight Wayland window compositors a couple of years back, beginning with Sway and moving onto Hyprland & Wayfire. When Raspberry Pi switched switched from Wayfire to LabWC in their Bookworm release (Oct '24) I decided use it on my laptop as well.  

[Labwc](https://labwc.github.io/index.html) is a wlroots-based stacking compositor for wayland. It is light-weight and independent with a focus on simply stacking windows well and rendering some window decorations. It relies on clients for panels, screenshots, wallpapers and so on to create a full desktop environment. It takes a no-bling/frills approach and says no to features such as animations. It's inspired by openbox and BunsenLabs (lightweight Debian + Openbox-based distro). 

LXQt 2.1, released in November 2024, offers the option to run LabWC, as one of several Wayland compositors within LXQt itself. Instead of having to set up a bar etc. separately you get lxpanel and lxqt-runner and labwc-tweaks and other LXQt desktop components. Some (not all) setting can be made in LXQt Configuration Center. In general, you'll want to poke around in the menu and read the [wiki]( https://github.com/lxqt/lxqt/wiki).

Users can select the Wayland session (“LXQt (Wayland)”) from the SDDM login manager and choose `labwc` in LXQt Session Settings > Wayland Settings > Wayland compositor. 

To install LXQt and LabWC:
```
sudo pacman -S lxqt lxqt-config lxqt-policykit lxqt-powermanagement lxqt-wayland-session labwc labwc-tweaks 
```

I drew my configs, theme and other elements from various sources including https://github.com/stefonarch. His Vent-dark theme belongs in `~/.local/share/themes/` (& can also be specified via `labwc-tweaks`)

![screenshot](screenshots/2024-12-31.png)

![screenshot](screenshots/2024-12-31b.png)

![screenshot](screenshots/2024-12-31c.png)
