namespace GenealogyTree.Domain.Entities
{
    public class Gender
    {
        /*public Gender()
        {
            this.Persons = new HashSet<Person>();
        }*/

        public int Id { get; set; }
        public string Name { get; set; }

        /*        public virtual ICollection<Person> Persons { get; set; }
        */
    }
}
