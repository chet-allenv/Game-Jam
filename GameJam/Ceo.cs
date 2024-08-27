namespace GameJam 
{
    /// <summary>
    /// This class represents the CEO object; IE the Player and the ceos they will play as throughout the game.
    /// </summary>
    public class Ceo
    {   
        // Name of the CEO
        public string Name {get; set;}

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
        public Ceo(string name, int morality)
        {
            Name = name;
            Morality = morality;

            InitializeStats();
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
    }
}