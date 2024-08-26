namespace GameJam
{
    public class Card
    {
        public string Message {get; set;}
        // public image Art {get; set;}
        public Suit CardSuit {get;}
        public string LeftOption {get;}
        public string RightOption {get;}

        public Card(string message, /* image art, */ Suit suit, string LO, string RO)
        {
            Message = message;
            // Art = art
            CardSuit = suit;
            LeftOption = LO;
            RightOption = RO;
        }
        
        public virtual void SwipeLeft()
        {
            // Something happens here
            return;
        }

        public virtual void SwipeRight()
        {
            // Something happens here
            return;
        }

        public void DisplayCard()
        {
            Console.WriteLine("\n");
            Console.WriteLine(Message);
            Console.WriteLine("\n");
            Console.WriteLine("Swipe Left Option: {0}", LeftOption);
            Console.WriteLine("Swipe Right Option: {0}", RightOption);
        }
    }

    public class TestCard : Card
    {
        public TestCard() : base("This is a test card", Suit.Worker, "This is the left option", "This is the right option") {}
    }

    // This enum represents the "suit" of the card and represents
    //  the stat that the card will primarily affect
    public enum Suit
    {
        Worker,
        Capital,
        Public,
        FDA
    }

    /*
        
    */
}