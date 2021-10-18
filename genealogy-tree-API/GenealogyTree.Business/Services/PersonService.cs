using AutoMapper;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        public async Task<List<PersonDetailsModel>> FindPerson(string name)
        {
            List<Person> people = unitOfWork.Person.Filter(x => string.Format("{0} {1}", x.FirstName, x.LastName).Contains(name))
                                    .OrderBy(x => x.FirstName).ToList();
            return _mapper.Map<List<PersonDetailsModel>>(people);
        }

        public async Task<PersonDetailsModel> GetPersonAsync(int personId)
        {
            Person person = await unitOfWork.Person.FindById(personId);
            return _mapper.Map<PersonDetailsModel>(person);
        }

        public async Task<PersonDetailsModel> AddPersonAsync(PersonCreationModel person)
        {
            throw new NotImplementedException();
        }

        public async Task<PersonDetailsModel> UpdatePersonAsync(PersonUpdateModel person)
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
