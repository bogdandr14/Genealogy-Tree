using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface IRelationshipService
    {
        Task AddRelationship();
        Task<Relationship> GetRelationship(int relationshipId);
        Task<Relationship> UpdateRelationship();
        Task DeleteMarriage(int relationshipId);
        Task<List<Relationship>> GetAllRelationshipsForPerson(int personId);
    }
}
