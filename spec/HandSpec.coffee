describe 'Hand', ->
  ten = null
  three = null
  two = null
  six = null
  deck = null
  ace = null
  dealerHand = null

  beforeEach ->
    deck = new Deck
    dealerHand = new Hand (deck.dealDealer())
    ten = new Card
      rank: 10
      suit: 0
    three = new Card
      rank: 3
      suit: 0
    two = new Card
      rank: 2
      suit: 0
    six = new Card
      rank: 6
      suit: 3
    ace = new Card
      rank: 1
      suit: 0

  describe 'dealerPlay', ->
    it 'should hit until score is 17 or less', ->
      hand = new Hand([ten, six], deck, true)
      hand.at(0).flip()
      hand.dealerPlay()
      expect(hand.length).toEqual 3
    describe 'with and ace', ->
      it 'should hit until score is 17 or more', ->
        hand = new Hand([three, two, ace], deck, true)
        hand.dealerPlay()
        expect(hand.length).toBeGreaterThan(3)

  describe 'hit', ->
    it "should call bust when score is over 21", ->
      hand = new Hand([ten, new Card(ten.attributes), ace], deck, false);
      spyOn(hand, 'bust')
      hand.hit()
      expect(hand.bust).toHaveBeenCalled()


