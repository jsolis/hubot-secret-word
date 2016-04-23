# Description:
#   A hubot script that creates a daily secret word like Conky
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Jason Solis

secretWords = process.env.HUBOT_WOTD_LIST || ['anyone', 'know', 'annoying', 'lunch', 'prod', 'qa', 'beer', 'home']

secretWord = {}

module.exports = (robot) ->

  getSecretWord = () ->
    date = new Date()
    today = "" + date.getFullYear() + date.getMonth() + date.getDate()

    if ! secretWord[today]
      wotdi = Math.floor(Math.random() * secretWords.length)
      secretWord[today] = secretWords[wotdi]

    return secretWord[today]

  robot.hear /(.*)/, (res) ->
    spokenWord = res.match[1]
    if spokenWord and spokenWord.length > 0 and !new RegExp("^" + robot.name).test(spokenWord)
      wotd = getSecretWord()
      console.log "wotd: " + wotd
      if spokenWord.indexOf(wotd) > -1
        res.send "Whoooop! You said the secret word of the day!!"
