using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IPersonService
    {

        /// <summary>
        /// Retrieves the information about a specific person.
        /// </summary>
        /// <param name="personId"> The Id of the person that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="PersonDetailsModel"/> object which contains all information about 
        /// the person.
        /// </returns>
        Task<PersonDetailsModel> GetPersonAsync(int personId);

        /// <summary>
        /// Retrieves all basic information about the people in the genealogy tree.
        /// </summary>
        /// <param name="treeId"> The Guid of the tree for which to return all basic information about
        /// the people in it.</param>
        /// <returns>
        /// Returns a list of <see cref="GenericPersonModel"/> object, which represents the people in
        /// the genealogy tree.
        /// </returns>
        Task<List<GenericPersonModel>> GetPeopleListInTree(Guid treeId);

        /// <summary>
        /// Retrieves all information about the people and the links between them, such as 
        /// parents, children and spouces. This will be used to show the people in a tree view.
        /// </summary>
        /// <param name="treeId"> The Guid of the tree for which to return all information about
        /// the people in it.</param>
        /// <returns>
        /// Returns a list of <see cref="PersonTreeInfoModel"/> object, which represents the people in
        /// the genealogy tree that can be used to display them in an arborescentic view.
        /// </returns>
        Task<List<PersonTreeInfoModel>> GetPeopleTreeDataInTree(Guid treeId);

        /// <summary>
        /// Computes the list of all people in the genealogy tree that are not related to any other person inside 
        /// the tree. This can be used to determine some options for creating new parent-child or marriage connections.
        /// </summary>
        /// <param name="treeId"> The Guid of the tree from which to determine all people that are not related 
        /// to any other person inside that tree.</param>
        /// <returns>
        /// Returns a list of <see cref="GenericPersonModel"/> object, which represents all people in the 
        /// genealogy tree that are not currently related by ancestors to the requested person.
        /// </returns>
        Task<List<GenericPersonModel>> GetPeopleWithoutRelative(Guid treeId);

        /// <summary>
        /// Retrieves the list of all events that took place in the tree.
        /// </summary>
        /// <param name="treeId"> The Guid of the tree from which to determine all events related to the
        /// people in tree, users linked to them or the tree itself.</param>
        /// <returns>
        /// Returns a list of <see cref="EventInTreeModel"/> object, which represents all the events related to
        /// the people in the genealogy tree.
        /// </returns>
        Task<List<EventInTreeModel>> GetEventsInTree(Guid treeId);

        /// <summary>
        /// Createa a new person in the authenticated user's tree.
        /// </summary>
        /// <param name="person"> Is the <see cref="PersonCreateUpdateModel"/> object which contains all
        /// the information to create a new person in the user's genealogy tree.</param>
        /// <returns>
        /// Returns the <see cref="PersonDetailsModel"/> object for the created person.
        /// </returns>
        Task<PersonDetailsModel> AddPersonAsync(PersonCreateUpdateModel person);

        /// <summary>
        /// Updates an existing person in the tree.
        /// </summary>
        /// <param name="person"> Is the <see cref="PersonCreateUpdateModel"/> object which contains all
        /// the information to update the person.</param>
        /// <returns>
        /// Returns the <see cref="PersonDetailsModel"/> object for the updated person.
        /// </returns>
        Task<PersonDetailsModel> UpdatePersonAsync(PersonCreateUpdateModel person);

        /// <summary>
        /// Updates the picture of a person in the tree.
        /// </summary>
        /// <param name="personId"> Is the id of the person whose picture needs to be updated.</param>
        /// <param name="imageId"> Is the id of the image which must be used for the person.</param>
        /// <returns>
        /// Returns the <see cref="ImageFile"/> object that countains the information about th updated 
        /// person's image.
        /// </returns>
        Task<ImageFile> UpdatePictureAsync(int personId, int imageId);

        /// <summary>
        /// Deletes an existing person.
        /// </summary>
        /// <param name="personId"> The Id for the person that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="PersonDetailsModel"/> object that was removed.
        /// </returns>
        Task<PersonDetailsModel> DeletePersonAsync(int personId);
    }
}
