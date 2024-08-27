namespace GameJam
{
    /// <summary>
    /// This class represents a Card object.
    /// </summary>
    public class Card
    {
        // String message attribute of the card
        public string Message {get; set;}

        // TO BE IMPLEMENTED; Art file that will display the card's art
        // public image Art {get; set;}

        // Suit of the card; Suit's are explained later in this file
        public Suit CardSuit {get;}

        // Left and right option messages of the card
        public string LeftOption {get;}
        public string RightOption {get;}

        // This is the object of the current CEO the player is playing as.
        public Ceo? CurrentCeo {get; set;}


        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="message"> Message of the card, text that will prompt the user </param>
        /// <param name="suit"> Suit of the card</param>
        /// <param name="LO"> Left Option </param>
        /// <param name="RO"> Right Option </param>
        public Card(string message, /* image art, */ Suit suit, string LO, string RO)
        {
            // Sets variables
            Message = message;
            // Art = art
            CardSuit = suit;
            LeftOption = LO;
            RightOption = RO;
        }
        
        
        /// <summary>
        ///  This method is to be overridden by every Child class of Card. This will hold the fucntionality
        ///  of swiping left on the card's option.
        /// </summary>
        public virtual void SwipeLeft()
        {
            // Something happens here
            return;
        }

        /// <summary>
        ///  This method is to be overridden by every Child class of Card. This will hold the fucntionality
        ///  of swiping right on the card's option.
        /// </summary>
        public virtual void SwipeRight()
        {
            // Something happens here
            return;
        }

        /// <summary>
        ///  This method is to display the Card's data. TO BE IMPROVED LATER. As of now, it is basic information.
        /// </summary>
        public void DisplayCard()
        {   
            // Displays all relevant information about the card.
            Console.WriteLine("\n");
            Console.WriteLine(Message);
            Console.WriteLine("\n");
            Console.WriteLine("Swipe Left Option: {0}", LeftOption);
            Console.WriteLine("Swipe Right Option: {0}", RightOption);
        }
    }

    /// <summary>
    /// This is a Test card class. This demonstrates implementation of the Card class and how to convert to child classes.
    /// </summary>
    public class TestCard : Card
    {   
        public TestCard() : base("This is a test card", Suit.Worker, "This is the left option", "This is the right option") {}
    }

    /// <summary>
    /// BELOW ARE MORE SPECIFIC CARD SUBCLASSES THAT ASSIGN THE SUIT TO THE CARD BASED ON WHAT CHILD CLASS IS CALLED.
    /// </summary>
    /// 

    public class WorkerCard : Card
    {
        public WorkerCard(string message, string leftOption, string rightOption) : base(message, Suit.Worker, leftOption, rightOption) {}
    }

    public class CapitalCard : Card
    {
        public CapitalCard(string message, string leftOption, string rightOption) : base(message, Suit.Capital, leftOption, rightOption) {}
    }

    public class PublicCard : Card
    {
        public PublicCard(string message, string leftOption, string rightOption) : base(message, Suit.Public, leftOption, rightOption) {}
    }

    public class FDACard : Card
    {
        public FDACard(string message, string leftOption, string rightOption) : base(message, Suit.FDA, leftOption, rightOption) {}
    }

    // This enum represents the "suit" of the card and represents
    //  the stat that the card will primarily affect
    public enum Suit
    {
        Worker, // This suit is cards that Primarily affect tthe worker attribute.
        Capital, // This suit is cards that primarily affect the Capital attribute
        Public, // this Suit is cards that primarily affect the public attribute
        FDA // This suit is cards that primarily affect the FDA attribute
    }
}