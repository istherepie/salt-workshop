Create settings file:
    file.serialize:
        - name: /tmp/settings.json

        - dataset:
            default:
                setting_one: This is setting one
                setting_two: This is setting two
                setting_int: 15
                setting_boolean: True
                mathias:
                    - juice
                    - ost
                    - boef

        - formatter: configparser
        - mode: 644
        - user: root
        - group: root
