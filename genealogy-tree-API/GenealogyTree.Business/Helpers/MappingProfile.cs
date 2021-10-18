using AutoMapper;
using GenealogyTree.Domain.DTO.Person;
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

            CreateMap<User, UserDetailsModel>()
                .ReverseMap();
            CreateMap<User, LoginResponseModel>()
                .ReverseMap();
            CreateMap<Person, PersonUpdateModel>()
                .ForMember(x => x.BirthPlace, y => y.MapFrom(z => z.PlaceOfBirth))
                .ForMember(x => x.LivingPlace, y => y.MapFrom(z => z.PlaceOfLiving));
            CreateMap<Person, PersonDetailsModel>()
                .ForMember(x => x.GenderName, y => y.MapFrom(z => z.Gender.Name))
                .ForMember(x => x.ReligionName, y => y.MapFrom(z => z.Religion.Name));//TODO add for abou email and phone
        }
    }
}
