namespace GameJam
{

    public class Game
    {   
        // This creates a Deck object that will be used through out the game.
        public Deck CurrentDeck {get; set;}

        // Creates a Stack object that will operate as a discard pile.
        public Stack<Card> DiscardPile {get; set;}

        // Creates the place where the Flop, or three drawn cards will be stored.
        public Card[] Flop = new Card[3];

        /// <summary>
        /// Constructor
        /// </summary>
        public Game()
        {
            CurrentDeck = new();
            DiscardPile = [];
        }

        /// <summary>
        /// Draws a card from the current deck, and puts it into the flop does so 3 times.
        /// </summary>
        public void DrawCards()
        {
            for (int i = 0; i < 3; i++)
            {
                var tempCard = CurrentDeck.DrawCard();
                Flop[i] = tempCard;
            }
        }

        /// <summary>
        /// Method for discarding the flop. Takes every card in the flop Array and pushes it into the DiscardPile stack.
        /// </summary>
        public void DiscardCards()
        {
            foreach (var c in Flop)
            {
                DiscardPile.Push(c);
            }
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