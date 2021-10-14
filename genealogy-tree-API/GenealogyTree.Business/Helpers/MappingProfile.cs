using AutoMapper;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Models;

namespace GenealogyTree.Business.Helpers
{
    public class MappingProfile : Profile
    {
        public static string MemberExclusionKey { get; } = "exclude";

        public MappingProfile()
        {
            ConfigureMappings();
        }

        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        ///
        private void ConfigureMappings()
        {
            CreateMap<Education, EducationModel>()
               .ForMember(x => x.EducationLevelId, y => y.MapFrom(x =>  (int)x.EducationLevel))
               .ForMember(x => x.PersonName, y => y.MapFrom(x => string.Format("{0} {1}", x.User.Person.FirstName, x.User.Person.LastName)))
               .ReverseMap();
        }
    }
}
