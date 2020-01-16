
Send event when the above task is complete:
  event.send:
    - name: magenta/create/testfile
    - data:
        completed: True
        status: ok
