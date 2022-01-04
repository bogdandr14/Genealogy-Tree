using AutoMapper;
using GenealogyTree.Business.Authorization;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Enums;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
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
            User user = unitOfWork.User.Filter(x => x.Username == username).FirstOrDefault();
            return _mapper.Map<UserDetailsModel>(user);
        }

        public async Task<LoginResponseModel> LoginUser(LoginModel userLogin)
        {
            /*User user = unitOfWork.User.Filter(x => x.Username == userLogin.Username).Include(u => u.Person).FirstOrDefault();
            if (Hash.ValidateHash(userLogin.Password, user.PasswordSalt, user.PasswordHash))*/
            {
                Person person = new Person()
                {
                    FirstName = "Bogdan",
                    LastName = "Draghici"
                };
                User user = new User()
                {
                    Id = 4,
                    Username = "bimax14",
                    Email = "nu avem",
                    Person = person,
                };
                LoginResponseModel loginResponseModel = _mapper.Map<LoginResponseModel>(user);
                loginResponseModel.Token = TokenService.GenerateToken(user, UserRoleEnum.User);
                return loginResponseModel;
            }
            return null;
        }

        public async Task<UserDetailsModel> RegisterUser(UserRegisterModel userRegister)
        {
            if (unitOfWork.User.Filter(x => x.Username == userRegister.Username).FirstOrDefault()!= default(User))
            {
                return null;
            }
            if (unitOfWork.User.Filter(x => x.Email == userRegister.Email).FirstOrDefault() != default(User))
            {
                return null;
            }
            User user = _mapper.Map<User>(userRegister);
            Person person = _mapper.Map<Person>(userRegister);

            Person personCreated = await unitOfWork.Person.Create(person);
            user.PersonId = personCreated.Id;

            user.PasswordSalt = Salt.Create();
            user.PasswordHash = Hash.CreateHash(userRegister.Password, user.PasswordSalt);
            User createdUser = await unitOfWork.User.Create(user);
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(createdUser);
            return returnEvent;
        }

        public async Task<UserDetailsModel> UpdatePassword(UpdatePasswordModel updatePassword)
        {
            User user = unitOfWork.User.Filter(x => x.Username == updatePassword.Username).FirstOrDefault();
            if (Hash.ValidateHash(updatePassword.CurrentPassword, user.PasswordSalt, user.PasswordHash))
            {
                user.PasswordSalt = Salt.Create();
                user.PasswordHash = Hash.CreateHash(updatePassword.NewPassword, user.PasswordSalt);
                unitOfWork.User.Update(user);
            }
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(user);
            return returnEvent;
        }

        public async Task<UserDetailsModel> UpdateUser(UserUpdateModel user)
        {
            if (user == null)
            {
                return null;
            }
            User userEntity = _mapper.Map<User>(user);
            User userToUpdate = unitOfWork.User.Filter(x => x.Username == user.Username).FirstOrDefault();
            if (userToUpdate == default(User))
            {
                return null;
            }
            if (Hash.ValidateHash(user.Password, userToUpdate.PasswordSalt, userToUpdate.PasswordHash))
            {
                userEntity.Id = userToUpdate.Id;
                userEntity.PersonId = userToUpdate.PersonId;
                userEntity = await unitOfWork.User.Update(userEntity);
            }
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(userEntity);
            return returnEvent;
        }
    }
}
