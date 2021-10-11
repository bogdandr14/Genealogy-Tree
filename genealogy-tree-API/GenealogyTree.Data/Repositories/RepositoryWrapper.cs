using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private readonly ApplicationDbContext _repoContext;
        private IEducationRepository _education;
        private IGenderRepository _gender;
        private ILocationRepository _location;
        private IMarriageRepository _marriage;
        private IOccupationRepository _occupation;
        private IPersonRepository _person;
        private IRelationshipRepository _relationship;
        private IReligionRepository _religion;
        private ISynchedUsersRepository _synchedUsers;
        private ISyncRequestRepository _syncRequest;
        private IUserRepository _user;

        public RepositoryWrapper(ApplicationDbContext repositoryContext)
        {
            _repoContext = repositoryContext;
        }

        public IEducationRepository Education => _education ??= new EducationRepository(_repoContext);
        public IGenderRepository Gender => _gender ??= new GenderRepository(_repoContext);
        public ILocationRepository Location => _location ??= new LocationRepository(_repoContext);
        public IMarriageRepository Marriage => _marriage ??= new MarriageRepository(_repoContext);
        public IOccupationRepository Occupation => _occupation ??= new OccupationRepository(_repoContext);
        public IPersonRepository Person => _person ??= new PersonRepository(_repoContext);
        public IRelationshipRepository Relationship => _relationship ??= new RelationshipRepository(_repoContext);
        public IReligionRepository Religion => _religion ??= new ReligionRepository(_repoContext);
        public ISynchedUsersRepository SynchedUsers => _synchedUsers ??= new SynchedUsersRepository(_repoContext);
        public ISyncRequestRepository SyncRequest => _syncRequest ??= new SyncRequestRepository(_repoContext);
        public IUserRepository User => _user ??= new UserRepository(_repoContext);

        public void Save()
        {
            _repoContext.SaveChanges();
        }
    }
}
