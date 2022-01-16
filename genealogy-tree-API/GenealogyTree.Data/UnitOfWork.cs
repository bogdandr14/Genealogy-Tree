using GenealogyTree.Data.Repositories;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly GenealogyTreeDbContext _repoContext;
        private IEducationLevelRepository _educationLevel;
        private IEducationRepository _education;
        private IGenderRepository _gender;
        private ILocationRepository _location;
        private IMarriageRepository _marriage;
        private INationalityRepository _nationality;
        private IOccupationRepository _occupation;
        private IParentChildRepository _parentChild;
        private IPersonRepository _person;
        private IReligionRepository _religion;
        private ISyncedUsersRepository _synchedUsers;
        private ISyncRequestRepository _syncRequest;
        private ITreeRepository _tree;
        private IUserRepository _user;

        public UnitOfWork(GenealogyTreeDbContext repositoryContext)
        {
            _repoContext = repositoryContext;
        }

        public IEducationLevelRepository EducationLevel => _educationLevel ??= new EducationLevelRepository(_repoContext);
        public IEducationRepository Education => _education ??= new EducationRepository(_repoContext);
        public IGenderRepository Gender => _gender ??= new GenderRepository(_repoContext);
        public ILocationRepository Location => _location ??= new LocationRepository(_repoContext);
        public IMarriageRepository Marriage => _marriage ??= new MarriageRepository(_repoContext);
        public INationalityRepository Nationality => _nationality ??= new NationalityRepository(_repoContext);
        public IOccupationRepository Occupation => _occupation ??= new OccupationRepository(_repoContext);
        public IParentChildRepository ParentChild => _parentChild ??= new ParentChildRepository(_repoContext);
        public IPersonRepository Person => _person ??= new PersonRepository(_repoContext);
        public IReligionRepository Religion => _religion ??= new ReligionRepository(_repoContext);
        public ISyncedUsersRepository SynchedUsers => _synchedUsers ??= new SynchedUsersRepository(_repoContext);
        public ISyncRequestRepository SyncRequest => _syncRequest ??= new SyncRequestRepository(_repoContext);
        public ITreeRepository Tree => _tree ??= new TreeRepository(_repoContext);
        public IUserRepository User => _user ??= new UserRepository(_repoContext);
    }
}
