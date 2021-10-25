using GenealogyTree.Domain.Interfaces.Repositories;
using System.Threading.Tasks;

namespace GenealogyTree.Data.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly GenealogyTreeDbContext _repoContext;
        private IEducationRepository _education;
        private IGenderRepository _gender;
        private ILocationRepository _location;
        private IMarriageRepository _marriage;
        private IOccupationRepository _occupation;
        private IPersonRepository _person;
        private IReligionRepository _religion;
        private ISynchedUsersRepository _synchedUsers;
        private ISyncRequestRepository _syncRequest;
        private IUserRepository _user;

        public UnitOfWork(GenealogyTreeDbContext repositoryContext)
        {
            _repoContext = repositoryContext;
        }

        public IEducationRepository Education => _education ??= new EducationRepository(_repoContext);
        public IGenderRepository Gender => _gender ??= new GenderRepository(_repoContext);
        public ILocationRepository Location => _location ??= new LocationRepository(_repoContext);
        public IMarriageRepository Marriage => _marriage ??= new MarriageRepository(_repoContext);
        public IOccupationRepository Occupation => _occupation ??= new OccupationRepository(_repoContext);
        public IPersonRepository Person => _person ??= new PersonRepository(_repoContext);
        public IReligionRepository Religion => _religion ??= new ReligionRepository(_repoContext);
        public ISynchedUsersRepository SynchedUsers => _synchedUsers ??= new SynchedUsersRepository(_repoContext);
        public ISyncRequestRepository SyncRequest => _syncRequest ??= new SyncRequestRepository(_repoContext);
        public IUserRepository User => _user ??= new UserRepository(_repoContext);
    }
}
