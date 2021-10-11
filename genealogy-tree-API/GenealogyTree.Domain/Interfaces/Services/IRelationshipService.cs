using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IRelationshipService
    {
        Task AddRelationship();
        Task<Relationship> GetRelationship(int relationshipId);
        Task<Relationship> UpdateRelationship();
        Task DeleteMarriage(int relationshipId);
        Task<List<Relationship>> GetAllRelationshipsForPerson(int personId);
    }
}
