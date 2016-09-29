# Description:
#   A hubot script that creates a daily secret word like Conky
#
# Configuration:
#   HUBOT_WOTD_LIST
#
# Commands:
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Jason Solis

secretWords = ['anyone', 'know', 'annoying', 'lunch', 'prod', 'qa', 'beer', 'home']

if process.env.HUBOT_WOTD_LIST
  secretWords = JSON.parse(process.env.HUBOT_WOTD_LIST)

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
      if spokenWord.indexOf(wotd) > -1
        res.send "Whoooop! You said the secret word of the day!!"
