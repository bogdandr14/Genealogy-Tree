using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.SynchedUser;
using GenealogyTree.Domain.DTO.SyncRequest;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;

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
               .ForMember(x => x.EducationLevelId, y => y.MapFrom(z => (int)z.EducationLevel))
               .ForMember(x => x.PersonName, y => y.MapFrom(z => string.Format("{0} {1}", z.User.Person.FirstName, z.User.Person.LastName)))
               .ReverseMap();

            CreateMap<Marriage, MarriageModel>()
                .ForMember(x => x.MarriageStarted, y => y.MapFrom(z => z.DateStarted))
                .ForMember(x => x.MarriageEnded, y => y.MapFrom(z => z.DateEnded))
                .ReverseMap();

            CreateMap<Person, PersonDetailsModel>()
                .ForMember(x => x.LivingPlace, y => y.MapFrom(z => z.PlaceOfLiving))
                .ForMember(x => x.ReligionName, y => y.MapFrom(z => z.Religion.Name))
                .ForMember(x => x.BirthPlace, y => y.MapFrom(z => z.PlaceOfBirth))
                .ForMember(x => x.GenderName, y => y.MapFrom(z => z.Gender.Name))
                .ReverseMap();

            CreateMap<Person, PersonUpdateModel>()
                .ForMember(x => x.BirthPlace, y => y.MapFrom(z => z.PlaceOfBirth))
                .ForMember(x => x.LivingPlace, y => y.MapFrom(z => z.PlaceOfLiving))
                .ReverseMap();

            CreateMap<Occupation, OccupationModel>()
                .ReverseMap();

            CreateMap<SynchedUsers, SynchedUserModel>()
                .ReverseMap();

            CreateMap<SyncRequest, SyncRequestForReceiverModel>()
                .ReverseMap();

            CreateMap<SyncRequest, SyncRequestForSenderModel>()
                .ForMember(x => x.SenderUserId, y => y.MapFrom(z => z.SenderId))
                .ReverseMap();

            CreateMap<User, UserDetailsModel>()
                .ReverseMap();

            CreateMap<User, LoginResponseModel>()
                .ReverseMap();

            CreateMap<User, UserRegisterModel>()
                .ReverseMap();

            CreateMap<User, UserUpdateModel>()
                .ReverseMap();
        }
    }
}
