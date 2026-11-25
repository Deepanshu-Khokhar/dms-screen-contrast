# Screen Contrast for DMS

A [Dux Modular Shell](https://github.com/duxlabs-dev/dux-shell) Control Center plugin for adjusting display contrast from 50% to 200% in 5-point steps.

## Requirements

- DMS 2.1.0 or newer (tested with DMS v2.1.2).
- A Wayland compositor with a gamma-control backend supported by DMS. Only Niri was tested for this release. When DMS reports gamma control as unavailable, the tile shows "Unavailable" and the controls are disabled.

The plugin does not modify Niri settings and does not require a compositor rule.

## Install (manual clone)

```sh
plugins="${XDG_CONFIG_HOME:-$HOME/.config}/dms/plugins"
mkdir -p "$plugins" &&
    git clone https://github.com/Deepanshu-Khokhar/dms-screen-contrast.git "$plugins/screenContrast"
```

1. Open DMS Settings -> Plugins (use **Scan** if the plugin is not listed yet).
2. Open **Screen Contrast** and enable it.
3. Open the Control Center, enter edit mode, select **Add widget**, and add **Screen Contrast**. Then select **Finish**.

## Usage

- Slider range: 50% (softer) to 200% (stronger), step 5%.
- 100% is normal contrast; **Reset to 100%** restores it.
- The plugin changes the same display contrast value as DMS's built-in gamma controls. Changes made in either place stay in sync.
- DMS persists the value as part of its own settings.

## Uninstall

1. Set contrast back to 100% first, using **Reset to 100%** or the DMS Gamma control page. Removing the plugin does not reset the shared DMS contrast value.
2. Remove the **Screen Contrast** tile in Control Center edit mode.
3. Disable the plugin in DMS Settings -> Plugins, then remove `screenContrast` from your DMS plugin directory.
4. No Niri settings or compositor rules were changed, so nothing else needs reverting.
