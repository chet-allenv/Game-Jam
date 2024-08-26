using System.Collections.Generic;

namespace GameJam 
{
    public class Ceo

    /*
    This CEO class will be used for each CEO and give them the properties needed
    */  

    {
        public string Name {get; set;}
        public int Evilness {get; set;} // number rating how evil the CEO is, determines probability of getting evil cards, from 0 - 100
        public List<Card> crimes = new List<Card>();

        public Ceo (string name, int evilness)
        {
            Name = name;
            Evilness = evilness;
        }
    }
}