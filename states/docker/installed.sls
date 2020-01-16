Create namespace for docker applications:
  file.directory:
    - name: /opt/docker
    - user: root
    - group: root

Create bin directory for docker scripts:
  file.directory:
    - name: /opt/docker/bin
    - user: root
    - group: root

Add official docker repository to apt:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
    - file: /etc/apt/sources.list.d/docker.list
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/ubuntu/gpg

Install docker community edition:
  pkg.installed:
    - pkgs:
        - docker-ce
        - docker-ce-cli
        - containerd.io
    - refresh: True

Install docker tooling:
  pip.installed:
    - pkgs:
        - docker-compose>=1.5.0
        - docker

Create docker daemon configuration:
  file.serialize:
    - name: /etc/docker/daemon.json
    - dataset_pillar: docker_config
    - formatter: json
    - user: root
    - group: root
    - mode: 644

Reload docker configuration if daemon.json has changed:
  service.running:
    - name: docker
    - reload: True
    - restart: True
    - watch:
        - file: /etc/docker/daemon.json
