using AutoMapper;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class UserService : BaseService, IUserService
    {

        private readonly IMapper _mapper;
        private readonly IFileManagementService _fileManagementService;
        public UserService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
        }

        public async Task<UserDetailsModel> GetUserByIdAsync(Guid userId)
        {
            User user = await unitOfWork.User.FindById(userId);
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(user);
            returnEvent.ImageFile = await _fileManagementService.GetFile(user.Person.Image);
            return returnEvent;
        }

        public async Task<UserDetailsModel> GetUser(string username)
        {
            User user = unitOfWork.User.Filter(x => x.Username == username)
                            .Include(u => u.Person)
                            .ThenInclude(p => p.Gender)
                            .Include(u => u.Person.Nationality)
                            .Include(u => u.Person.Religion)
                            .Include(u => u.Person.LivingPlace)
                            .Include(u => u.Person.BirthPlace)
                            .Include(u => u.Person.Image)
                            .Include(u => u.Educations)
                            .Include(u => u.Occupations).FirstOrDefault();
            UserDetailsModel userEntity = _mapper.Map<UserDetailsModel>(user);
            userEntity.ImageFile = await _fileManagementService.GetFile(user.Person.Image);
            return userEntity;
        }

        public async Task<UserDetailsModel> UpdateUser(UserUpdateModel user)
        {
            if (user == null)
            {
                return null;
            }
            User userEntity = _mapper.Map<User>(user);
            User userToUpdate = await unitOfWork.User.FindById(user.UserId);
            userEntity.Id = userToUpdate.Id;
            userEntity.PersonId = userToUpdate.PersonId;
            userEntity = await unitOfWork.User.Update(userEntity);
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(userEntity);
            returnEvent.ImageFile = await _fileManagementService.GetFile(userEntity.Person.Image);
            return returnEvent;
        }

        public async Task<bool> CheckUsernameAvailable(string username)
        {
            User user = unitOfWork.User.Filter(x => x.Username == username).FirstOrDefault();
            return user == default(User);
        }

        public async Task<bool> CheckEmailAvailable(string email)
        {
            User user = unitOfWork.User.Filter(x => x.Email == email).FirstOrDefault();
            return user == default(User);
        }

        public async Task<UserSettingsModel> GetUserSettings(string username)
        {
            User user = unitOfWork.User.Filter(x => x.Username == username).FirstOrDefault();
            return _mapper.Map<UserSettingsModel>(user);
        }

        public async Task<UserSettingsModel> UpdateUserSettings(UserSettingsModel userSettings)
        {
            if (userSettings == null)
            {
                return null;
            }
            User userToUpdate = await unitOfWork.User.FindById(userSettings.Id);
            userToUpdate.NotifyUpdates = userSettings.NotifyUpdates;
            userToUpdate.NotifyBirthdays = userSettings.NotifyBirthdays;
            userToUpdate.SharePersonalInfo = userSettings.SharePersonalInfo;
            userToUpdate.ThemePreference = userSettings.ThemePreference;
            userToUpdate.LanguagePreference = userSettings.LanguagePreference;
            User userEntity = await unitOfWork.User.Update(userToUpdate);
            UserSettingsModel returnEvent = _mapper.Map<UserSettingsModel>(userEntity);
            return returnEvent;
        }
    }
}
