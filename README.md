# hubot-secret-word

A hubot script that creates a daily secret word like Conky

See [`src/secret-word.coffee`](src/secret-word.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-secret-word --save`

Then add **hubot-secret-word** to your `external-scripts.json`:

```json
[
  "hubot-secret-word"
]
```

There is one optional environment variable you can set to override the default
list of secret words of the day

```
export HUBOT_WOTD_LIST="['lunch', 'beer', 'scotch']"
```

## Sample Interaction

```
user1>> Who wants lunch
hubot>> Whoooop! You said the secret word of the day!!
```
