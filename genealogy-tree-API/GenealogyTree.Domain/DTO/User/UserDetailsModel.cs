using GenealogyTree.Domain.DTO.Person;
using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserDetailsModel : PersonDetailsModel
    {
        public ICollection<OccupationModel> Occupations { get; set; }
        public ICollection<EducationModel> Educations { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string About { get; set; }
        public DateTime LastTreeUpdate { get; set; }
    }
}
