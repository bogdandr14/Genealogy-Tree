using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IReligionService
    {
        void AddReligion(Religion religion);
        List<Religion> GetReligions();
        List<Religion> FindReligion(string religionName);
    }
}
