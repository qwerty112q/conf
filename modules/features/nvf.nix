{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nvf = {pkgs, ...}: {
    imports = [
      inputs.nvf.nixosModules.default
    ];
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };
          options = {
            tabstop = 2;
            shiftwidth = 2;
            expandtab = true;
          };
          extraPackages = with pkgs; [
            nixd
            alejandra
          ];
          clipboard = {
            enable = true;
            registers = "unnamedplus";
          };
          filetree.neo-tree.enable = true;
          binds.whichKey.enable = true;
          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          lsp = {
            enable = true;
            formatOnSave = true;
          };
          languages = {
            enableFormat = true;
            enableTreesitter = true;

            nix = {
              enable = true;
              format = {
                enable = true;
                type = ["alejandra"];
              };
              lsp = {
                enable =
                  true;
                servers = ["nixd"];
              };
            };
          };
        };
      };
    };
  };
}
