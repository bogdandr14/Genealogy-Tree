using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class ImageRepository : RepositoryBase<Image>, IImageRepository
    {
        public ImageRepository(GenealogyTreeDbContext repositoryContext) : base(repositoryContext) { }
    }
}
