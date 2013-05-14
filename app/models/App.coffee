#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', ->
      @get('dealerHand').dealerPlay()
    ,@
    @get('dealerHand').on 'stand', ->
      @compareHands()
    ,@
    @set 'state', undefined
    @get('playerHand').on 'bust', ->
      @set 'state', 'lose'
    , @
    @get('dealerHand').on 'bust', ->
      @set 'state', 'win'
    , @



  compareHands: ->
    if @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
      @set 'state', 'lose'
      return 'lose'
    else if @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
      @set 'state', 'win'
      return 'win'
