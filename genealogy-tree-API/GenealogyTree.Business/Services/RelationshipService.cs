using AutoMapper;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class RelationshipService : BaseService, IRelationshipService
    {
        private readonly IMapper _mapper;
        public RelationshipService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<RelationshipModel>> GetAllRelationshipsForPerson(int personId)
        {
            List<Relationship> relationshipEntities = unitOfWork.Relationship.Filter(x => x.FirstPersonId == personId || x.SecondPersonId == personId).ToList();
            List<RelationshipModel> returnEvent = _mapper.Map<List<RelationshipModel>>(relationshipEntities);
            return returnEvent;
        }

        public async Task<RelationshipModel> GetRelationship(int relationshipId)
        {
            Relationship relationshipEntity = await unitOfWork.Relationship.FindById(relationshipId);
            RelationshipModel returnEvent = _mapper.Map<RelationshipModel>(relationshipEntity);
            return returnEvent;
        }

        public async Task<RelationshipModel> AddRelationshipAsync(RelationshipModel relationship)
        {
            if(relationship == null)
            {
                return null;
            }
            Relationship relationshipEntity = _mapper.Map<Relationship>(relationship);
            Relationship relationshipCreated = await unitOfWork.Relationship.Create(relationshipEntity);
            RelationshipModel returnEvent = _mapper.Map<RelationshipModel>(relationshipCreated);
            return returnEvent;
        }

        public async Task<RelationshipModel> UpdateRelationshipAsync(RelationshipModel relationship)
        {
            if(relationship == null)
            {
                return null;
            }
            Relationship relationshipEntity = _mapper.Map<Relationship>(relationship);
            Relationship relationshipUpdated = await unitOfWork.Relationship.Update(relationshipEntity);
            RelationshipModel returnEvent = _mapper.Map<RelationshipModel>(relationshipUpdated);
            return returnEvent;
        }

        public async Task<RelationshipModel> DeleteRelationshipAsync(int relationshipId)
        {
            Relationship relationship = await unitOfWork.Relationship.Delete(relationshipId);
            RelationshipModel returnEvent = _mapper.Map<RelationshipModel>(relationship);
            return returnEvent;
        }
    }
}
