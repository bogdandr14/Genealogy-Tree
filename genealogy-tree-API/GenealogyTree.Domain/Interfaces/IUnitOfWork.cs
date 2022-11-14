using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Domain.Interfaces
{

    /// <summary>
    /// Class <c>UnitOfWork</c> stores all repositories that can be used to make transactions with the database throughout the database.
    /// </summary>
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
        IPositionRepository Position { get; }
        IReligionRepository Religion { get; }
        IRelativeRepository Relatives { get; }
        IRequestRepository Requests { get; }
        ITreeRepository Tree { get; }
        IUserRepository User { get; }
    }
}
