=begin
Snap

(Level 6 Kata)

Flash has invited his nemesis The Turtle (He actually was a real villain! ) to play his favourite card game, SNAP. In this game a 52 card deck is dealt out so both Flash and the Turtle get 26 random cards.

Each players cards will be represented by an array like below

Flash’s pile: [ 'A', '5', 'Q', 'Q', '6', '2', 'A', '9', '10', '6', '4', '3', '10', '9', '3', '8', 'K', 'J', 'J', 'K', '7', '9', '5', 'J', '7', '2' ]

Turtle’s pile: [ '8', 'A', '2', 'Q', 'K', '8', 'J', '6', '4', '8', '7', 'A', '5', 'K', '3', 'Q', '6', '9', '4', '3', '4', '10', '2', '7', '10', '5' ]

The players take it in turn to take the top card from their deck (the first element in their array) and place it in a face up pile in the middle. Flash goes first.

When a card is placed on the face up pile that matches the card it is placed on top of the first player to shout ‘SNAP!’ wins that round. Due to Flash's speed he wins every round.

Face up pile in the middle: [ 'A', '8', '5', 'A', 'Q', '2', 'Q', 'Q', => SNAP!

The face up pile of cards in the middle are added to the bottom of Flash's pile.

Flash’s pile after one round: ['6', '2', 'A', '9', '10', '6', '4', '3', '10', '9', '3', '8', 'K', 'J', 'J', 'K', '7', '9', '5', 'J', '7', '2', 'A', '8', '5', 'A', 'Q', '2', 'Q', 'Q' ]

Flash then starts the next round by putting down the next card.

When Turtle runs out of cards the game is over.

How many times does Flash get to call Snap before Turtle runs out of cards?

If both the player put down all their cards into the middle without any matches then the game ends a draw and Flash calls SNAP 0 times.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SnapMySolution < Minitest::Test

  def snap(flash_pile, turtle_pile)
    
  end  

  def test_1
    skip
    flash = [ '3','K','5','A','5','6','7','J','7','9','10','Q','Q','6','8','7','4','J','8','9','K','J','10','4','K','4' ]
    turtle = [ '2','8','9','Q','A','K','6','3','J','2','4','3','3','8','A','2','6','7','9','10','A','5','Q','10','2','5' ]
    assert_equal(2, snap(flash, turtle))
  end
  
  def test_2
    skip
    flash = [ '9','5','4','4','A','8','4','3','K','J','J','Q','Q','9','8','5','J','6','7','6','A','J','9','K','3','8' ]
    turtle = [ 'K','10','3','4','5','Q','2','7','A','A','Q','10','6','5','K','6','7','10','2','9','2','10','7','8','2','3' ]
    assert_equal(6, snap(flash, turtle))
  end
  
  def test_3
    skip
    flash = [ '3','9','8','2','6','Q','9','3','6','9','6','A','7','10','6','7','A','Q','Q','10','5','2','9','4','A','3' ]
    turtle = [ 'Q','K','5','7','10','4','8','2','3','J','J','5','8','5','10','8','K','K','7','2','J','4','A','J','4','K' ]
    assert_equal(0, snap(flash, turtle))
  end
  
  def test_4
    skip
    flash = [ '3','Q','2','4','2','K','7','8','6','K','2','4','3','8','A','10','Q','8','10','J','K','7','6','9','J','9' ]
    turtle = [ '3','4','9','J','5','8','4','10','A','7','Q','A','9','10','J','K','2','Q','3','6','5','5','5','A','6','7' ]
    assert_equal(1, snap(flash, turtle))
  end
  
  def test_5
    skip
    flash = [ 'K','5','7','10','10','10','7','3','3','9','9','8','4','J','6','J','Q','J','K','9','4','A','5','5','2','J' ]
    turtle = [ '6','4','8','3','4','10','9','A','5','Q','2','K','A','6','2','8','A','7','6','7','Q','K','8','3','2','Q' ]
    assert_equal(2, snap(flash, turtle))
  end
  
  def test_6
    skip
    flash = [ '8','8','4','7','7','A','3','4','5','2','J','2','J','K','7','K','J','10','5','A','8','3','3','Q','9','K' ]
    turtle = [ '6','6','5','A','A','Q','6','9','6','3','10','5','10','9','8','2','10','2','Q','J','4','Q','9','K','4','7' ]
    assert_equal(5, snap(flash, turtle))
  end
  
end