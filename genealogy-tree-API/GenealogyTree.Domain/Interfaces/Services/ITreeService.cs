using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ITreeService
    {
        Task GetTreeForUser(int userId, int? rootPersonId);
    }
}
