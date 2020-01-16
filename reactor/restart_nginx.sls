
Restart nginx if the service is down:
  local.service.start:
  - tgt: {{ data['id'] }} # Minion id
  - args:
    - name: nginx
