# 2nd Platoon Zues builder

This repo is setup to build mission files / editables for mission devs in 2nd Platoon.

## Structure

The folders that matter are in the `maps` sub-folder. In there, you will find folders for each map supported for our Zeus missions. Each folder will need to have at least a `mission.sqm` file with the appropriately-named objects placed, and a `.skip-scripts` file if you want to skip installing the Paradigm sub-system and the `FirstCav` configuration.

To add a new map, create the mission in Eden, place as appropriate, then save. Make a folder in `maps` named exactly the same (case-sensitive!) as the map internal name (for example, Twin Lakes is `sws_twinlakes`, but Tanoa is `Tanoa`), and put the `mission.sqm` from that mission save, and an empty file named `.skip-scripts` in the new folder. You can just copy the `.skip-scripts` file from another map folder.  Commit these changes, and push up to the repo. At some point we will have automation that runs to pick up these changes and push out new PBOs. In the mean-time there are scripts and instructions below.


## Manual Build

To build the scripts, you will need to be running Linux, MacOS or Windows 10 or later. 

### Windows

For windows, you will need a few things:

- [WinGet](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
- [RustUp](https://win.rustup.rs/x86_64)

Everything else will be installed using them.

First, install WinGet using the instructions above; then install Rust using RustUp; you can pick the defaults for both.

Second, you will need to install the command-line tools for Zip and Armake2 (these will be expanded to have other options, but for now..).

For Zip, you will need to start a powershell (6+) in visual studio code with this repo open. Run `winget install -e --id GnuWin32.Zip`; this will place it somewhere in C:\Program Files (x86), and you'll need to add it to your path before building; something like `$env:path = "$env:path;C:\Program Files (x86)\GnuWin32\bin"`.

For Armake2 you will need to run `cargo install armake2` and Rust will do the rest for you. 

Once complete, you can run `pwsh tools/build.ps1` and it will create the mission folders, zip them up and also create PBO files to place on the server.

### MacOS / Linux

For MacOS and Linux, use your favorite package installer to install `zip` (not unzip) so we can create ZIP files. Install the appropriate RustUP for your platform, and then use `cargo install armake2` to add armake2 to your path.  You will need ZSH if you do not have it already, and then you can run `tools/build` to generate the zip files and PBOs.