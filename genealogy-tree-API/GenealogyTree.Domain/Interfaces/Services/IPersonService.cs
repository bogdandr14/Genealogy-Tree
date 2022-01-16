using GenealogyTree.Domain.DTO.Person;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IPersonService
    {
        Task<List<PersonDetailsModel>> FindPeople(string name);
        Task<PersonDetailsModel> GetPersonAsync(int personId);
        Task<List<GenericPersonModel>> GetAllPeopleInTree(Guid treeId);
        Task<PersonDetailsModel> AddPersonAsync(PersonCreateUpdateModel person);
        Task<PersonDetailsModel> UpdatePersonAsync(PersonCreateUpdateModel person);
        Task<PersonDetailsModel> DeletePersonAsync(int personId);
    }
}
