class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    newCard = @add(@deck.pop()).last()
    if @scores()[0] > 21 then @bust()
    newCard

  bust: -> @trigger 'bust', @

  stand: -> @trigger 'stand', @

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  dealerPlay: ->
    @at(0).flip()
    score = 0
    getScore = (scores) ->
      scores.reduce (memo, score)  ->
        if score > memo and score < 22
          return score
        else
          return memo
      , scores[0]

    count = 0
    while true
      score = getScore @scores()
      if score < 17 then @hit()
      else break
    @stand()
