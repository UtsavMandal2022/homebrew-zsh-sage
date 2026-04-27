class ZshSage < Formula
  desc "Intelligent zsh autosuggestions with multi-signal ranking"
  homepage "https://github.com/UtsavMandal2022/zsh-sage"
  url "https://github.com/UtsavMandal2022/zsh-sage/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "b93c9112bd66ef54be727a97b6d37e78b2d5c0806afe3c5010e601457cbb939c"
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
