{ flake, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 16;
        normal = {
          family = "NotoMono Nerd Font Mono";
          style = "Regular";
        };
      colors = {
        primary = {
          background = "0x282828";
          foreground = "0xd4be98";
        };
        normal = {
          black =   "0x3c3836";
          red =     "0xea6962";
          green =   "0xa9b665";
          yellow =  "0xd8a657";
          blue =    "0x7daea3";
          magenta = "0xd3869b";
          cyan =    "0x89b482";
          white =   "0xd4be98";
        };
        bright = {
          black =   "0x3c3836";
          red =     "0xea6962";
          green =   "0xa9b665";
          yellow =  "0xd8a657";
          blue =    "0x7daea3";
          magenta = "0xd3869b";
          cyan =    "0x89b482";
          white =   "0xd4be98";
        };
      };
      keyboard.bindings = [
        { key = J, mods = "Alt", chars = "\\x1bj" }
        { key = K, mods = "Alt", chars = "\\x1bk" }
        { key = H, mods = "Alt", chars = "\\x1bh" }
        { key = L, mods = "Alt", chars = "\\x1bl" }
        { key = N, mods = "Alt", chars = "\\x1bn" }
        { key = P, mods = "Alt", chars = "\\x1bp" }
        { key = Key1, mods = "Alt", chars = "\\x1b1" }
        { key = Key2, mods = "Alt", chars = "\\x1b2" }
        { key = Key3, mods = "Alt", chars = "\\x1b3" }
        { key = Key4, mods = "Alt", chars = "\\x1b4" }
        { key = Key5, mods = "Alt", chars = "\\x1b5" }
        { key = Key6, mods = "Alt", chars = "\\x1b6" }
        { key = Key7, mods = "Alt", chars = "\\x1b7" }
        { key = Key8, mods = "Alt", chars = "\\x1b8" }
        { key = Key9, mods = "Alt", chars = "\\x1b9" }
        { key = Key0, mods = "Alt", chars = "\\x1b0" }
      ]
    };
  };
}
