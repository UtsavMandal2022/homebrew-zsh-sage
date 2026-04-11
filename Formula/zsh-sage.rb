class ZshSage < Formula
  desc "Intelligent zsh autosuggestions with multi-signal ranking"
  homepage "https://github.com/UtsavMandal2022/zsh-sage"
  url "https://github.com/UtsavMandal2022/zsh-sage/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "21d5d56022e9937f3e817bb1177c50d9630406f2f601e493d8bf96d72dcf7af0"
  license "MIT"

  depends_on "sqlite"

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      To activate zsh-sage, add the following to your ~/.zshrc:

        source #{opt_prefix}/zsh-sage.plugin.zsh

      Or if using Oh My Zsh, symlink the plugin:

        ln -sf #{opt_prefix} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-sage

      Then add 'zsh-sage' to your plugins array in ~/.zshrc:

        plugins=(git zsh-sage zsh-syntax-highlighting)

      Import your existing history for instant suggestions:

        zsh -ic '_sage_db_import_history'

      Optional AI suggestions (requires Anthropic API key):

        export ZSH_SAGE_AI_ENABLED=true
        export ZSH_SAGE_API_KEY="sk-your-key"
    EOS
  end

  test do
    assert_match "CREATE TABLE", shell_output("cat #{prefix}/src/core/db.zsh")
  end
end
