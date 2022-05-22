using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Domain.Interfaces
{
    public interface IUnitOfWork
    {
        IEducationLevelRepository EducationLevel { get; }
        IEducationRepository Education { get; }
        IImageRepository Image { get; }
        ILocationRepository Location { get; }
        IMarriageRepository Marriage { get; }
        INationalityRepository Nationality { get; }
        IOccupationRepository Occupation { get; }
        IParentChildRepository ParentChild { get; }
        IPersonRepository Person { get; }
        IPositionRepository Position { get; set; }
        IReligionRepository Religion { get; }
        IRelativeRepository Relatives { get; }
        IRequestRepository Requests { get; }
        ITreeRepository Tree { get; }
        IUserRepository User { get; }
    }
}
