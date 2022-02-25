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
                            .ThenInclude(e => e.EducationLevel)
                            .Include(u => u.Occupations).FirstOrDefault();
            UserDetailsModel userEntity = _mapper.Map<UserDetailsModel>(user);
            userEntity.ImageFile = await _fileManagementService.GetFile(user.Person.Image);
            return userEntity;
        }

        public async Task<UserDetailsModel> UpdateUser(Guid userId, UserUpdateModel user)
        {
            User userToUpdate = await unitOfWork.User.FindById(userId);
            if (userToUpdate == null || user == null)
            {
                return null;
            }
            userToUpdate.About = user.About;
            userToUpdate.Email = user.Email;
            userToUpdate.PhoneNumber = user.PhoneNumber;
            User userEntity = await unitOfWork.User.Update(userToUpdate);
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(userEntity);
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

        public async Task<UserSettingsModel> GetUserSettings(Guid userId)
        {
            User user = await unitOfWork.User.FindById(userId);
            return _mapper.Map<UserSettingsModel>(user);
        }

        public async Task<UserSettingsModel> UpdateUserSettings(Guid userId, UserSettingsModel userSettings)
        {
            User userToUpdate = await unitOfWork.User.FindById(userId);
            if (userToUpdate == null || userSettings == null)
            {
                return null;
            }
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
