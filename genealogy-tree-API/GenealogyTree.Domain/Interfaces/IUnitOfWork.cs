namespace GenealogyTree.Domain.Interfaces.Repositories
{
    public interface IUnitOfWork
    {
        IEducationRepository Education { get; }
        IGenderRepository Gender { get; }
        ILocationRepository Location { get; }
        IMarriageRepository Marriage { get; }
        IOccupationRepository Occupation { get; }
        IPersonRepository Person { get; }
        IReligionRepository Religion { get; }
        ISynchedUsersRepository SynchedUsers { get; }
        ISyncRequestRepository SyncRequest { get; }
        IUserRepository User { get; }
    }
}
