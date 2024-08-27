namespace GameJam
{

    public class Game
    {   
        // This creates a Deck object that will be used through out the game.
        Deck CurrentDeck {get; set;}

        // Creates a Stack object that will operate as a discard pile.
        Stack<Card> DiscardPile {get; set;}

        /// <summary>
        /// Constructor
        /// </summary>
        public Game()
        {
            CurrentDeck = new();
            DiscardPile = [];
        }

        /// <summary>
        /// Draws a card from the current deck, adds it to the discard, and then returns the drawn Card.
        /// </summary>
        /// <returns></returns>
        public Card DrawCard()
        {
            var tempCard = CurrentDeck.DrawCard();

            DiscardPile.Push(tempCard);

            return tempCard;
        }

        /// <summary>
        /// This resets the Current deck and removes every object in the Discard pile
        /// </summary>
        public void ResetCurrentDeck()
        {
            CurrentDeck = new();
            DiscardPile = [];
        }
    }
}