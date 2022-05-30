using AutoMapper;
using GenealogyTree.Domain;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
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

        public async Task<UsersFound> FindUsers(InfiniteScrollFilter filter)
        {
            if (filter.Name == null)
            {
                filter.Name = "";
            }
            List<string> names = filter.Name.Split(" ").ToList();
            IEnumerable<User> filteredUsers = unitOfWork.User.GetAll()
                .Include(user => user.Person)
                .ThenInclude(person => person.Image).ToList();
            filteredUsers = filteredUsers.Where((user) => names.All(name => user.Person.FirstName.Contains(name) || user.Person.LastName.Contains(name))).ToList();


            UsersFound usersFound = new UsersFound();
            List<User> foundUsers = filteredUsers.Skip(filter.Skip).Take(filter.Take).ToList();
            usersFound.totalUsers = filteredUsers.Count();
            usersFound.skippedUsers = filter.Skip;
            usersFound.takenUsers = filter.Take;
            usersFound.areLast = usersFound.totalUsers <= filter.Skip + filter.Take;
            foreach (var user in foundUsers)
            {
                GenericPersonModel personToReturn = _mapper.Map<GenericPersonModel>(user);
                personToReturn.ImageFile = await _fileManagementService.GetFile(user.Person.Image);
                usersFound.users.Add(personToReturn);
            }
            return usersFound;
        }

        public async Task<UserDetailsModel> GetUserByIdAsync(Guid userId)
        {
            User user = unitOfWork.User.Filter(user => user.Id == userId)
                            .Include(u => u.Person)
                            .Include(u => u.Person.Nationality)
                            .Include(u => u.Person.Religion)
                            .Include(u => u.Person.LivingPlace)
                            .Include(u => u.Person.BirthPlace)
                            .Include(u => u.Person.Image)
                            .Include(u => u.Educations)
                            .ThenInclude(e => e.EducationLevel)
                            .Include(u => u.Occupations)
                            .FirstOrDefault();
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(user);
            returnEvent.ImageFile = await _fileManagementService.GetFile(user.Person.Image);
            return returnEvent;
        }

        public async Task<UserDetailsModel> GetUser(string username)
        {
            User user = unitOfWork.User.Filter(x => x.Username == username)
                            .Include(u => u.Person)
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

        public async Task<int> GetNotificationsCount(Guid userId)
        {
            User user = unitOfWork.User.Filter(u => u.Id == userId).Include(u => u.Person).Include(u => u.ReceivedRequests).FirstOrDefault();
            int requestsCount = user.ReceivedRequests.Count();
            int birthdayCount = unitOfWork.Person.Filter(p => p.TreeId == user.Person.TreeId && p.BirthDate.HasValue && p.BirthDate.Value.DayOfYear == DateTime.Now.DayOfYear).Count();
            int marriageCount = unitOfWork.Marriage.Filter(m => m.FirstPerson.TreeId == user.Person.TreeId && m.StartDate.DayOfYear == DateTime.Now.DayOfYear).Count();
            return requestsCount + birthdayCount + marriageCount;
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
            User userEntity = await unitOfWork.User.Update(userToUpdate);
            UserSettingsModel returnEvent = _mapper.Map<UserSettingsModel>(userEntity);
            return returnEvent;
        }

        public async Task<UserPositionModel> UpdateUserPosition(int positionId, PositionModel position)
        {
            Position positionToUpdate = await unitOfWork.Position.FindById(positionId);
            if (positionToUpdate == null || position == null)
            {
                return null;
            }
            positionToUpdate.LastVerified = DateTime.Now;
            positionToUpdate.Latitude = position.Latitude;
            positionToUpdate.Longitude = position.Longitude;
            Position positionEntity = await unitOfWork.Position.Update(positionToUpdate);
            UserPositionModel returnEvent = _mapper.Map<UserPositionModel>(positionEntity);
            return returnEvent;
        }
    }
}
