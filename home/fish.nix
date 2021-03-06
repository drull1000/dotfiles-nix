{
  programs.fish = {
    enable = true;

    shellAliases = {
      "cat" = "bat";
      "ls" = "exa";
    };
  };

  programs = {
    # JSON processor.
    jq.enable = true;

    # A cat clone with syntax highlighting and Git integration
    bat = {
      enable = true;
    };

    # Replacement for 'ls' written in Rust
    exa.enable = true;

    # Fuzzy finder written in Go.
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    # Download utility.
    aria2.enable = true;

    # Simple terminal UI for git commands.
    lazygit.enable = true;
  };
}
