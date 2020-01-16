Install some packages on the system:
    pkg.installed:
        - pkgs: {{ pillar.packages }}