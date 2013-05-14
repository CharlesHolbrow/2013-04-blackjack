describe 'App', ->
  app = null
  ten = null
  three = null
  two = null
  ace = null

  beforeEach ->
    app = new App()
    ten = new Card
      rank: 10
      suit: 0
    three = new Card
      rank: 3
      suit: 0
    two = new Card
      rank: 2
      suit: 0
    ace = new Card
      rank: 1
      suit: 3

  describe 'compareHands', ->
    it "should declare the correct winner", ->
      app.get('dealerHand').pop()
      app.get('dealerHand').pop()
      app.get('dealerHand').set([ten, two])
      app.get('playerHand').pop()
      app.get('playerHand').pop()
      app.get('playerHand').push(ten)
      app.get('playerHand').push(new Card(ten.attributes))
      expect(app.compareHands()).toEqual 'win'

  describe 'hit', ->
    it "should call bust when score is over 21", ->
      playerHand = app.get('playerHand')
      .set([ten, new Card(ten.attributes), ace])
      spyOn(playerHand, 'bust')
      playerHand.hit()
      expect(playerHand.bust).toHaveBeenCalled()




    #it "should call blackjack when score is exactly 21"
