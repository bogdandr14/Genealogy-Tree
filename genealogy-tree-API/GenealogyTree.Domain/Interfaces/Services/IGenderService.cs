using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IGenderService
    {
        Task AddGender();
        Task<List<Gender>> GetGenders();
    }
}
