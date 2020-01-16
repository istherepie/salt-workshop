Create a testfile in the /tmp directory:
  file.managed:
    - name: /tmp/testfile.txt
    - source: salt://testing/templates/testfile.j2
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - defaults:
        value_one: This is value one
        value_two: This is value two
        value_three: This is value three
        value_int: 15
        value_truthy: True
        something: no ips
      
    - context: {{ pillar.test_data }}
    - fire_event: magenta/create/testfile
