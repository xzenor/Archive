# events

Tail events (master)
```
salt-run state.event pretty=True
```

Send event (minion)
```
salt-call event.send 'something.something', 'somethingelse'
```
