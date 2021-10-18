using AutoMapper;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System;
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

        public async Task<UserDetailsModel> GetUserAsync(int userId)
        {
            User user = await unitOfWork.User.FindById(userId);
            return _mapper.Map<UserDetailsModel>(user);
        }

        public Task<UserDetailsModel> LoginUser(LoginModel userLogin)
        {
            throw new NotImplementedException();
        }

        public Task<UserDetailsModel> RegisterUser(UserRegisterModel userRegister)
        {
            throw new NotImplementedException();
        }

        public Task<UserDetailsModel> UpdatePassword(UpdatePasswordModel updatePassword)
        {
            throw new NotImplementedException();
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
            userEntity.Id = userToUpdate.Id;
            userEntity.PersonId = userToUpdate.PersonId;
            userEntity = await unitOfWork.User.Update(userEntity);
            UserDetailsModel returnEvent = _mapper.Map<UserDetailsModel>(userEntity);
            return returnEvent;
        }
    }
}
