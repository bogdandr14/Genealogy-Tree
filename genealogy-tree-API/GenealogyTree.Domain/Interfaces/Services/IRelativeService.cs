using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.User;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IRelativeService
    {
        Task<List<RelativeModel>> GetAllRelativesForUser(Guid userId);
        Task<RelativeModel> GetRelative(int relativeId);
        Task<RelativeModel> AddRelativeUser(UsersToLinkModel usersToLink);
        Task<RelativeModel> DeleteRelative(int relativeId);
        Task<List<UserPositionModel>> GetRelativesPosition(Guid userId);
    }
}
