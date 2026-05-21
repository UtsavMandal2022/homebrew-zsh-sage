class ZshSage < Formula
  desc "Intelligent zsh autosuggestions with multi-signal ranking"
  homepage "https://github.com/UtsavMandal2022/zsh-sage"
  url "https://github.com/UtsavMandal2022/zsh-sage/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f7baf1ef8f1166fc5451c72e52aff3fe540967c9de38d96da27f6a43fe9a3b89"
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

      Optional AI commands (requires Claude Code CLI):

        zsage ai

      After installing or upgrading, reload your shell to pick up changes:

        source ~/.zshrc

      (or open a new terminal window)
    EOS
  end

  test do
    assert_match "CREATE TABLE", shell_output("cat #{prefix}/src/core/db.zsh")
  end
end
