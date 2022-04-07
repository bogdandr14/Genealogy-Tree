namespace GenealogyTree.Domain
{
    public class InfiniteScrollFilter
    {
        public int Skip { get; set; }
        public int Take { get; set; } = 15;
        public string Name { get; set; }
    }
}
