namespace GameJam 
{
    /// <summary>
    /// This class represents the CEO object; IE the Player and the ceos they will play as throughout the game.
    /// </summary>
    public class Ceo
    {   
        // Name of the CEO
        public string Name {get; set;}

        private readonly Random rng = new();

        // number rating how moral the CEO is, determines probability of getting evil cards, from 0 - 100
        public int Morality {get; set;}  // THIS STAT IS NOT VISIBLE TO THE PLAYER

        // These are the attributes of the CEO object. All correspond to their respective names and are numbers 0-100
        public int Stat_WorkerOpinion {get; set;}
        public int Stat_PublicOpinion {get; set;}
        public int Stat_Capital {get; set;}
        public int Stat_FDA {get; set;}

        // public List<Card> crimes = new(); TO BE IMPLEMENTED

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="name"> Name of CEO </param>
        /// <param name="morality"> Rating of the morality of the CEO </param>
        public Ceo(string name)
        {
            Name = name;
            Morality = 50;

            InitializeStats();
        }

        /// <summary>
        ///  Constructor that uses the Random name generator meothd to give the CEO a random name
        /// </summary>
        public Ceo()
        {
            Name = GenerateRandName();
            Morality = 50;

            InitializeStats();
        }

        private string GenerateRandName()
        {
            List<string> Names = [.. File.ReadAllLines("Names.txt")]; 
            int RandIndexNum = rng.Next(0, Names.Count);

            return Names[RandIndexNum];
        }

        /// <summary>
        /// Initializes the stats for a CEO. ONLY TO BE USED WHEN CREATING A NEW CEO OBJECT. Sets all stats
        /// to 50.
        /// </summary>
        private void InitializeStats()
        {
            Stat_WorkerOpinion = 50;
            Stat_PublicOpinion = 50;
            Stat_Capital = 50;
            Stat_FDA = 50;
        }

        /// <summary>
        /// Checks that all stats are above 0.
        ///  Returns boolean statement of that check
        /// </summary>
        /// <returns> Returns True if CEO has lost, False if they have not. </returns>
        public bool CheckIfLost()
        {
            return Stat_Capital > 0 && Stat_FDA > 0 && Stat_PublicOpinion > 0 && Stat_WorkerOpinion > 0;
        }
    }
}