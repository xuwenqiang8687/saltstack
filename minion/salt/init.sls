Install_epel:
    cmd.run:
      - name: yum -y install epel-release

Install_minion:
  pkg.installed:
    - name: salt-minion

/etc/salt/minion:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://minion/files/minion
    - mode: 640
    - user: root
    - template: jinja

Service_minion:
  service.running:
    - name: salt-minion
    - enable: Ture
    - reload: Ture
    - watch:
      - file: /etc/salt/minion
    - require:
      - pkg: salt-minion
