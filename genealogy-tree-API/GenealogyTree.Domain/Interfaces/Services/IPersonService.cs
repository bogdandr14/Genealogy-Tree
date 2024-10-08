﻿using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IPersonService
    {
        Task<PersonDetailsModel> GetPersonAsync(int personId);
        Task<List<GenericPersonModel>> GetPeopleListInTree(Guid treeId);
        Task<List<PersonTreeInfoModel>> GetPeopleTreeDataInTree(Guid treeId);
        Task<List<GenericPersonModel>> GetPeopleWithoutRelative(Guid treeId);
        Task<List<EventInTreeModel>> GetEventsInTree(Guid treeId);
        Task<PersonDetailsModel> AddPersonAsync(PersonCreateUpdateModel person);
        Task<PersonDetailsModel> UpdatePersonAsync(PersonCreateUpdateModel person);
        Task<ImageFile> UpdatePictureAsync(int personId, int imageId);
        Task<PersonDetailsModel> DeletePersonAsync(int personId);
    }
}
