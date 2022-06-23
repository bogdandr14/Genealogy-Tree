using AutoMapper;
using GenealogyTree.Business.Services;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Auth
{
    public class AuthService : BaseService, IAuthService
    {
        private readonly IMapper _mapper;
        public AuthService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }
        public async Task<LoginResponseModel> Login(LoginModel userLogin)
        {
            User user = unitOfWork.User.Filter(x => x.Username == userLogin.Username).Include(u => u.Person).FirstOrDefault();
            if (Hash.ValidateHash(userLogin.Password, user.PasswordSalt, user.PasswordHash))
            {
                LoginResponseModel loginResponseModel = _mapper.Map<LoginResponseModel>(user);
                loginResponseModel.Token = TokenService.GenerateToken(user, UserRoleEnum.User);
                return loginResponseModel;
            }
            return null;
        }

        public async Task<UserDetailsModel> Register(RegisterModel userRegister)
        {
            if (unitOfWork.User.Filter(x => x.Username == userRegister.Username).FirstOrDefault() != default(User))
            {
                return null;
            }
            if (unitOfWork.User.Filter(x => x.Email == userRegister.Email).FirstOrDefault() != default(User))
            {
                return null;
            }

            Tree userTree = new Tree()
            {
                LastUpdate = DateTime.UtcNow
            };
            userTree = await unitOfWork.Tree.Create(userTree);

            Person person = _mapper.Map<Person>(userRegister);
            person.TreeId = userTree.Id;
            person.LivingPlace = new Location();
            person.BirthPlace = new Location();
            Person personCreated = await unitOfWork.Person.Create(person);
            Position newPosition = new Position();
            Position position = await unitOfWork.Position.Create(newPosition);

            User user = _mapper.Map<User>(userRegister);
            user.Id = Guid.NewGuid();
            user.PersonId = personCreated.Id;
            user.PositionId = position.Id; 
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
                await unitOfWork.User.Update(user);
                UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(user);
                return returnEvent;
            }
            else
            {
                return null;
            }
        }
    }
}
