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
    };
  };
}
