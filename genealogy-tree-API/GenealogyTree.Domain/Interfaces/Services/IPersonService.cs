using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface IPersonService
    {
        Task AddPerson();
        Task<Person> GetPerson(int personId);
        Task<Person> UpdatePerson();
        Task DeletePerson(int marriageId);
        Task<List<Person>> FindPerson(string name);
    }
}
