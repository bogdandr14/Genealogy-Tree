namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonCreationModel : PersonUpdateModel
    {
        //For making the link in the tree
        public int? ParentId { get; set; }
        public int? ChildId { get; set; }
        public int? SpouceId { get; set; }
    }
}
