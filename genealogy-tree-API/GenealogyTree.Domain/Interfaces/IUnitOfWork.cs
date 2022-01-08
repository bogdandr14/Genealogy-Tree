using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Domain.Interfaces
{
    public interface IUnitOfWork
    {
        IEducationLevelRepository EducationLevel { get; }
        IEducationRepository Education { get; }
        IGenderRepository Gender { get; }
        ILocationRepository Location { get; }
        IMarriageRepository Marriage { get; }
        INationalityRepository Nationality { get; }
        IOccupationRepository Occupation { get; }
        IParentChildRepository ParentChild { get; }
        IPersonRepository Person { get; }
        IReligionRepository Religion { get; }
        ISyncedUsersRepository SynchedUsers { get; }
        ISyncRequestRepository SyncRequest { get; }
        IUserRepository User { get; }
    }
}
