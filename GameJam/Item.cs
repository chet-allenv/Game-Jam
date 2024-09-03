namespace GameJam
{
    /// <summary>
    /// This class represents an Item
    /// </summary>
    public class Item
    {

        // Name of the Item
        public string Name {get; }

        // Description of the Item
        public string Description {get; }

        // Constructor for the Item
        public Item(string name, string description)
        {
            Name = name;
            Description = description;
        }

        /// <summary>
        /// Overrideable method that is to be called when the Item is used.
        /// </summary>
        public virtual void UseItem()
        {
            Console.WriteLine("This Item has been used!");
        }
    }

    /// <summary>
    /// Example Item
    /// </summary>
    public class Item_Example : Item
    {
        public Item_Example() : base("Example Item", "This is an example item") {}

        public override void UseItem()
        {
            Console.WriteLine("This Example Item has been used");
        }
    }
}