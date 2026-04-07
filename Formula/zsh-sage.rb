class ZshSage < Formula
  desc "Intelligent zsh autosuggestions with multi-signal ranking"
  homepage "https://github.com/UtsavMandal2022/zsh-sage"
  url "https://github.com/UtsavMandal2022/zsh-sage/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6cd82733fb44c617a847392df17b2b55c64f97d07524c19dbe03b19d55921c4b"
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

        zsh -c 'source #{opt_prefix}/zsh-sage.plugin.zsh && _sage_db_import_history'

      Optional AI suggestions (requires Anthropic API key):

        export ZSH_SAGE_AI_ENABLED=true
        export ZSH_SAGE_API_KEY="sk-your-key"
    EOS
  end

  test do
    assert_match "CREATE TABLE", shell_output("cat #{prefix}/src/core/db.zsh")
  end
end
