_: {
  services = {
    ollama = {
      enable = false;
      acceleration = "cuda";
      # Optional: load models on startup
      # loadModels = [ ... ];
    };
    nextjs-ollama-llm-ui = {
      enable = false;
      ollamaUrl = "";
    };
  };
}
