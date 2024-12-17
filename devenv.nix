{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  packages = [pkgs.git pkgs.entr];

  languages.elixir.enable = true;
}
