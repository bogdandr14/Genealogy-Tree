using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    interface IRepositoryWrapper
    {
        IEducationRepository Education { get; }
        IGenderRepository Gender { get; }
        ILocationRepository Location { get; }
        IMarriageRepository Marriage { get; }
        IOccupationRepository Occupation { get; }
        IPersonRepository Person { get; }
        IRelationshipRepository Relationship { get; }
        IReligionRepository Religion { get; }
        ISynchedUsersRepository SyncedUser { get; }
        ISyncRequestRepository SyncRequest { get; }
        IUserRepository User { get; }
    }
}
