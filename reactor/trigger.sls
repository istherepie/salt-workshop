React on certain things:
  local.state.apply:
    - tgt: "*"
    - kwarg:
        pillar:
          baz: this is overwritten
          data: {{ data }}
