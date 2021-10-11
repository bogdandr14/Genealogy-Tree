using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IPersonService
    {
        Task AddPerson();
        Task<Person> GetPerson(int personId);
        Task<Person> UpdatePerson();
        Task DeletePerson(int marriageId);
        Task<List<Person>> FindPerson(string name);
    }
}
