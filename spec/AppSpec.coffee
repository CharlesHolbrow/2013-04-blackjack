describe 'App', ->
  app = null
  ten = null
  three = null
  two = null

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

  describe 'compareHands', ->
    it "should declare the correct winner", ->
      app.get('dealerHand').pop()
      app.get('dealerHand').pop()
      app.get('dealerHand').set([ten, two])
      app.get('playerHand').pop()
      app.get('playerHand').pop()
      app.get('playerHand').push(ten)
      app.get('playerHand').push(new Card(ten.attributes))
      expect(app.compareHands()).toEqual 'You Win'
