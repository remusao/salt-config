
create-user:
    user.present:
        - name: {{ pillars.user.username }}
        - shell: /bin/zsh
        - home: {{ pillar.user.home }}
        - enforce_password: True
        - password: {{ pillar.user.username }}
