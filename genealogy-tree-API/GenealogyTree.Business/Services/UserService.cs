using AutoMapper;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class UserService : BaseService, IUserService
    {

        private readonly IMapper _mapper;
        public UserService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<UserDetailsModel> GetUserByIdAsync(int userId)
        {
            User user = await unitOfWork.User.FindById(userId);
            return _mapper.Map<UserDetailsModel>(user);
        }

        public async Task<UserDetailsModel> GetUser(string username)
        {
            User user = unitOfWork.User.Filter(x => x.Username == username)
                            .Include(u => u.Person)
                            .ThenInclude(p=>p.Gender)
                            .Include(u =>u.Person.Nationality)
                            .Include(u =>u.Person.Religion)
                            .Include(u =>u.Person.LivingPlace)
                            .Include(u =>u.Person.BirthPlace)
                            .Include(u => u.Educations)
                            .Include(u=>u.Occupations).FirstOrDefault();
            return _mapper.Map<UserDetailsModel>(user);
        }

        public async Task<UserDetailsModel> UpdateUser(UserUpdateModel user)
        {
            if (user == null)
            {
                return null;
            }
            User userEntity = _mapper.Map<User>(user);
            User userToUpdate = unitOfWork.User.Filter(x => x.Username == user.Username).FirstOrDefault();
            userEntity.Id = userToUpdate.Id;
            userEntity.PersonId = userToUpdate.PersonId;
            userEntity = await unitOfWork.User.Update(userEntity);
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(userEntity);
            return returnEvent;
        }

        public async Task<UserSettingsModel> GetUserSettings(string username)
        {
            User user = unitOfWork.User.Filter(x => x.Username == username).Include(u => u.Person).FirstOrDefault();
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
