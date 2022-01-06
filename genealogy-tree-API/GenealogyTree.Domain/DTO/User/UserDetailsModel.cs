using GenealogyTree.Domain.DTO.Person;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserDetailsModel: PersonDetailsModel
    {
        public ICollection<OccupationModel> occupations { get; set; }
        public ICollection<EducationModel> educations { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
