using AutoMapper;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class PersonService : BaseService, IPersonService
    {
        private readonly IMapper _mapper;

        public PersonService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<PersonDetailsModel>> FindPeople(string name)
        {
            List<Person> people = unitOfWork.Person.Filter(x => string.Format("{0} {1}", x.FirstName, x.LastName).Contains(name))
                                    .OrderBy(x => x.FirstName).ToList();
            return _mapper.Map<List<PersonDetailsModel>>(people);
        }

        public async Task<PersonDetailsModel> GetPersonAsync(int personId)
        {
            Person person = await unitOfWork.Person.FindById(personId);
            User user = unitOfWork.User.Filter(u => u.PersonId == person.Id).FirstOrDefault();
            PersonDetailsModel personEntity = _mapper.Map<PersonDetailsModel>(person);
            if (user != default(User))
            {
                personEntity.UserId = user.Id;
            }
            return personEntity;
        }

        public async Task<PersonDetailsModel> AddPersonAsync(PersonCreateUpdateModel person)
        {
            if (person == null)
            {
                return null;
            }
            Person personEntity = _mapper.Map<Person>(person);
            personEntity = await unitOfWork.Person.Create(personEntity);
            PersonDetailsModel returnEvent = _mapper.Map<PersonDetailsModel>(personEntity);
            return returnEvent;
        }

        public async Task<PersonDetailsModel> UpdatePersonAsync(PersonCreateUpdateModel person)
        {
            if (person == null)
            {
                return null;
            }
            Person personEntity = _mapper.Map<Person>(person);
            personEntity = await unitOfWork.Person.Update(personEntity);
            return _mapper.Map<PersonDetailsModel>(personEntity);
        }

        public async Task<PersonDetailsModel> DeletePersonAsync(int personId)
        {
            Person personEntity = await unitOfWork.Person.Delete(personId);
            return _mapper.Map<PersonDetailsModel>(personEntity);
        }
    }
}
