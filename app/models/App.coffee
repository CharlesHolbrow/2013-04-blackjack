#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', ->
      @get('dealerHand').playTill16()
    ,@
    @get('dealerHand').on 'stand', ->
      @compareHands()
    ,@


  compareHands: ->
    if @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
      console.log 'You Loose'
    else if @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
      console.log 'You Win'
      return 'You Win'