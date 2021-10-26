using GenealogyTree.Domain.DTO.Person;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IPersonService
    {
        Task<List<PersonDetailsModel>> FindPerson(string name);
        Task<PersonDetailsModel> GetPersonAsync(int personId);
        Task<PersonDetailsModel> AddPersonAsync(PersonCreationModel person);
        Task<PersonDetailsModel> UpdatePersonAsync(PersonUpdateModel person);
        Task<PersonDetailsModel> DeletePersonAsync(int personId);
    }
}
