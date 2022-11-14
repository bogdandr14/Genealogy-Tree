using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.ParentChild;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IParentChildService
    {
        /// <summary>
        /// Retrieves all parents of a person.
        /// </summary>
        /// <param name="childId"> The Guid of the person for which to return the parents.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents the parents 
        /// of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetAllParentsForPerson(int childId);

        /// <summary>
        /// Retrieves all children of a person.
        /// </summary>
        /// <param name="parentId"> The Guid of the person for which to return the children.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents the children 
        /// of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetAllChildrenForPerson(int parentId);

        /// <summary>
        /// Retrieves all direct ancestors of a person.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to return all direct ancestors.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents the ancestors
        /// of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetAllAncestors(int personId);

        /// <summary>
        /// Retrieves all direct descendants of a person.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to return all direct descendants.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents the descendants
        /// of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetAllDescendants(int personId);

        /// <summary>
        /// Retrieves all related people to a specified person.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to return the related people.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents all related people, 
        /// by ancestors, descendants or both, of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetAllRelatedPeople(int personId);

        /// <summary>
        /// Retrieves all related people by the direct ancestors of a person.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to return all people related by ancestors.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents the people related by
        /// ancestors of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetRelatedByAncestors(int personId);

        /// <summary>
        /// Retrieves all related people by the direct descendants of a person.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to return all people related by descendants.</param>
        /// <returns>
        /// Returns a list of <see cref="ParentChildModel"/> object, which represents the people related by
        /// the descendants of the requested person.
        /// </returns>
        Task<List<ParentChildModel>> GetRelatedByDescendants(int personId);

        /// <summary>
        /// Computes the list of all possible children of a person, that are currently not related
        /// to him/her and do not have yet a father or a mother assigned. This is used to avoid the case 
        /// of a cycle in the genealogy tree.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to compute his/her possible children.</param>
        /// <returns>
        /// Returns a list of <see cref="GenericPersonModel"/> object, which represents the possible choices as 
        /// the children of the requested person.
        /// </returns>
        Task<List<GenericPersonModel>> GetChildrenOptions(int personId);

        /// <summary>
        /// Computes the list of all possible parents or spouces of a person, that are currently not related
        /// to him/her. This is used to avoid the case of a cycle in the genealogy tree.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to compute his/her possible parents or spouces.</param>
        /// <returns>
        /// Returns a list of <see cref="GenericPersonModel"/> object, which represents the possible choices as 
        /// the parent or spouce of the requested person.
        /// </returns>
        Task<List<GenericPersonModel>> GetParentSpouceOptions(int personId);

        /// <summary>
        /// Computes the list of all people in the genealogy tree that are not related by the ancestors.
        /// This is used to determine some options for creating new connections parent-child or marriage.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to determine all people that are not related 
        /// by ancestors.</param>
        /// <returns>
        /// Returns a list of <see cref="GenericPersonModel"/> object, which represents all people in the 
        /// genealogy tree that are not currently related by ancestors to the requested person.
        /// </returns>
        Task<List<GenericPersonModel>> GetNotRelatedByAncestors(int personId);

        /// <summary>
        /// Computes the list of all people in the genealogy tree that are not related by the descendants.
        /// This is used to determine some options for creating new connections parent-child or marriage.
        /// </summary>
        /// <param name="personId"> The Guid of the person for which to determine all people that are not related 
        /// by descendants.</param>
        /// <returns>
        /// Returns a list of <see cref="GenericPersonModel"/> object, which represents all people in the 
        /// genealogy tree that are not currently related by descendants to the requested person.
        /// </returns>
        Task<List<GenericPersonModel>> GetNotRelatedByDescendants(int personId);

        /// <summary>
        /// Retrieves a specific parent-child information.
        /// </summary>
        /// <param name="parentChildId"> The Id of the parent-child information that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="ParentChildDetailsModel"/> object which contains all information about the 
        /// child and its parent.
        /// </returns>
        Task<ParentChildDetailsModel> GetParentChildAsync(int parentChildId);

        /// <summary>
        /// Createa a new parent-child link.
        /// </summary>
        /// <param name="parentChild"> Is the <see cref="ParentChildCreateUpdateModel"/> object which contains all
        /// the information to create a new link for 2 people as parent and child.</param>
        /// <returns>
        /// Returns the <see cref="ParentChildDetailsModel"/> object for the created parent-child link.
        /// </returns>
        Task<ParentChildDetailsModel> AddParentChildAsync(ParentChildCreateUpdateModel parentChild);

        /// <summary>
        /// Updates an existing parent-child link.
        /// </summary>
        /// <param name="parentChild"> Is the <see cref="ParentChildCreateUpdateModel"/> object which contains all
        /// the information to update the parent-child link from between 2 people.</param>
        /// <returns>
        /// Returns the <see cref="ParentChildDetailsModel"/> object for the updated parent-child link.
        /// </returns>
        Task<ParentChildDetailsModel> UpdateParentChildAsync(ParentChildCreateUpdateModel parentChild);

        /// <summary>
        /// Deletes an existing parent-child link.
        /// </summary>
        /// <param name="parentChildId"> The Id for the parent-child link that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="ParentChildDetailsModel"/> object that was removed.
        /// </returns>
        Task<ParentChildDetailsModel> DeleteParentChildAsync(int parentChildId);
    }
}
