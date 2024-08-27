namespace GameJam
{
    /// <summary>
    /// This class represents a Deck of card objects
    /// </summary>
    public class Deck
    {

        // RNG Class for random number generation
        public static readonly Random rng = new();

        // The deck of cards that is the focal point of the Deck.cs class
        public Stack<Card> DeckOfCards {get; set;}
        
        public Deck()
        {
            // InitializeDec(); AS OF NOW CONSTRUCTOR HAS A NON-NULLABLE ERROR BECAUSE THE INITDECK FUNC HAS YET TO BE IMPLEMENTED.
            Shuffle();
        }

        // public void InitializeDeck() {} THIS WILL INITIALIZE THE DECK ONCE CARDS ARE MADE


        /// <summary>
        /// This Function shuffles the stack by converting it into a List and then ustilizes the Fisher-Yates randomization shuffle
        /// to sort the list. It then converts the list back into a stack and sets the Deck into the shuffled stack.
        /// </summary>
        public void Shuffle() 
        {
            // Creating the temp list by copying over the DeckOfCards stack
            List<Card> ls = [.. DeckOfCards];
            
            // Creates the n count that is utilized in the Fisher-Yates Shuffle
            int n = ls.Count;

            // While N is less than 1, runs through whole list
            while (n > 1)
            {
                // Decreases N
                n--;
                
                // finds a random int and exchanges the Card object at index N and index K
                int k = rng.Next(n + 1);
                (ls[n], ls[k]) = (ls[k], ls[n]);
            }
            
            // Sets the DeckOfCards stack to the shuffled list
            DeckOfCards = new Stack<Card>(ls);
        }

        /// <summary>
        /// Uses the pop method of Stack to grab the top card of the stack and remove it from the stack.
        /// It the returns the top card of the stack.
        /// </summary>
        /// <returns> The top Card object of the stack</returns>
        public Card DrawCard() 
        {
            // Using Stack.Pop(), returns the top card of  the stack
            return DeckOfCards.Pop();
        }
    }
}