using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IRelationshipService
    {
        Task<List<RelationshipModel>> GetAllRelationshipsForPerson(int personId);
        Task<RelationshipModel> GetRelationship(int relationshipId);
        Task<RelationshipModel> AddRelationshipAsync(RelationshipModel relationship);
        Task<RelationshipModel> UpdateRelationshipAsync(RelationshipModel relationship);
        Task<RelationshipModel> DeleteRelationshipAsync(int relationshipId);
    }
}
