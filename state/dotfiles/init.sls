

{% for file in ["emacs",
                "gitconfig"
                "hgrc",
                "i3",
                "i3status.conf",
                "vim",
                "vimrc",
                "Xdefaults",
                "xinitrc",
                "zshrc",
                "zshrc.pre-oh-my-zsh"] %}
dotfiles-symlinks:
  file.symlink:
    - target: {{ pillas.user.home }}/.dot/{{ file }}
    - name: {{ pillar.user.home}}/.{{ file }}
    - force: True
    - user: {{ pillar.user.username }}
    - require:
      - git: dotfiles-git


dotfiles-git:
  git.latest:
    - name: https://github.com/remusao/dot.git
    - target: {{ pillar.user.home }}/.dot
    - user: {{ pillar.user.username }}
    - submodules: True
    - require:
      - file: s360-deployment-key
      - pkg: dotfiles-git-package


dotfiles-git-package:
  pkg.installed:
    - name: git
