# configs
This is how I organize all my random configs. 

## Usage
Clone this into your home directory.

Root level files are "environment" files that source all configs for specific setting environment (i.e. work, home, etc). Those files load plugins found in `/plugins` that are usually program, app, or system specific.

In macOS, remove everything and add `source ~/config/<env>.bash` to your `~/.bash_profile`

In other systems, probably to `~/.bashrc`. (I have the default Ubuntu 16.04 `.bashrc` as a plugin)

## Notes
Any file prefixed `local*` are ignored. This is for any configurations you don't want checked in publicly.