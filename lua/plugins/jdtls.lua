-- NOTE: For Java with JavaFX support
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    -- Keymaps for JavaFX development
    vim.keymap.set('n', '<leader>jfc', 
      ':!javac --module-path /usr/lib/jvm/java-24.0.2-openjfx/lib --add-modules javafx.controls,javafx.fxml -d build %<CR>', 
      { desc = "Compile current Java file with JavaFX" })
    
    vim.keymap.set('n', '<leader>jfr', 
      ':!java --module-path /usr/lib/jvm/java-24.0.2-openjfx/lib --add-modules javafx.controls,javafx.fxml -cp build src.Main<CR>', 
      { desc = "Run JavaFX app" })
    
    vim.keymap.set('n', '<leader>jfa', 
      ':!javac --module-path /usr/lib/jvm/java-24.0.2-openjfx/lib --add-modules javafx.controls,javafx.fxml -d build src/*.java && java --module-path /usr/lib/jvm/java-24.0.2-openjfx/lib --add-modules javafx.controls,javafx.fxml -cp build src.Main<CR>', 
      { desc = "Compile & Run all JavaFX" })
    
    -- JavaFX debug configuration for nvim-dap (if installed)
    vim.keymap.set('n', '<leader>jfd', 
      ':lua require("dap").run({type = "java", request = "launch", name = "Debug JavaFX", vmArgs = "--module-path /usr/lib/jvm/java-24.0.2-openjfx/lib --add-modules javafx.controls,javafx.fxml", mainClass = "src.Main", projectPaths = { vim.fn.getcwd() }})<CR>', 
      { desc = "Debug JavaFX app" })
    
    -- Create build directory automatically
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.java",
      callback = function()
        vim.fn.system("mkdir -p build")
      end
    })
  end
}
