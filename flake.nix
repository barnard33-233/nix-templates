{
  description = "Mo's nix templates";
  outputs = {self, ...}@args: {
    templates = {
      devshell = {
        path = ./devshell;
        description = "Empty devshell.";
      };
      latex = {
        path = ./latex;
        description = "Basic latex template.";
      };
      beamer = {
        path = ./beamer;
        description = "Beamer template";
      };
      python = {
        path = ./python;
        description = "Python template";
      };
      fhs = {
        path = ./fhs;
        description = "Empty FHS devshell.";
      };
      kernel-fhs = {
        path = ./kernel-fhs;
        description = "For Kernel development.";
      };
    };
  };
}
