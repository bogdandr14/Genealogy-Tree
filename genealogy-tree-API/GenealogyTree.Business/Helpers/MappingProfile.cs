using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Sync;
using GenealogyTree.Domain.DTO.SyncRequest;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using System;
using System.IO;

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
               .ReverseMap();

            CreateMap<EducationLevel, GenericNameModel>()
               .ReverseMap();

            CreateMap<Gender, GenericNameModel>()
               .ReverseMap();
            CreateMap<Image, ImageFile>()
                .ForMember(x => x.Name, y => y.MapFrom(z => Guid.Parse(Path.GetFileNameWithoutExtension(z.FileName))));
            CreateMap<ImageFile, Image>();

            CreateMap<Location, LocationModel>()
               .ReverseMap();

            CreateMap<Marriage, MarriedPersonModel>()
                .ForMember(x => x.MarriageStarted, y => y.MapFrom(z => z.StartDate))
                .ForMember(x => x.MarriageEnded, y => y.MapFrom(z => z.EndDate))
                .ReverseMap();
            CreateMap<Marriage, MarriageDetailsModel>()
                .ForMember(x => x.MarriageStarted, y => y.MapFrom(z => z.StartDate))
                .ForMember(x => x.MarriageEnded, y => y.MapFrom(z => z.EndDate))
                .ReverseMap();
            CreateMap<Marriage, MarriageCreateUpdateModel>()
                .ReverseMap();

            CreateMap<Nationality, GenericNameModel>()
               .ReverseMap();

            CreateMap<Occupation, OccupationModel>()
               .ReverseMap();

            CreateMap<ParentChild, ChildModel>()
               .ReverseMap();
            CreateMap<ParentChild, ParentModel>()
               .ReverseMap();
            CreateMap<ParentChild, ParentChildDetailsModel>()
               .ReverseMap();
            CreateMap<ParentChild, ParentChildCreateUpdateModel>()
               .ReverseMap();

            CreateMap<Person, GenericPersonModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.UserId, y => y.MapFrom(z => z.SyncedUserToPerson.SyncedUserId))
                .ReverseMap();
            CreateMap<Person, PersonDetailsModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.UserId, y => y.MapFrom(z => z.SyncedUserToPerson.SyncedUserId))
                .ReverseMap();
            CreateMap<Person, PersonCreateUpdateModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.UserId, y => y.MapFrom(z => z.SyncedUserToPerson.SyncedUserId))
                .ReverseMap();

            CreateMap<Religion, GenericNameModel>()
                .ReverseMap();

            CreateMap<Sync, SyncedUserModel>()
                .ReverseMap();
            CreateMap<Sync, UsersToSyncModel>()
                .ReverseMap();

            CreateMap<SyncRequest, SyncRequestDetailsModel>()
                 .ForMember(x => x.ReceiverUser, y => y.MapFrom(z => z.Receiver))
                .ForMember(x => x.SenderUser, y => y.MapFrom(z => z.Sender))
                .ReverseMap();
            CreateMap<SyncRequest, SyncRequestCreateUpdateModel>()
                .ForMember(x => x.ReceiverUser, y => y.MapFrom(z => z.Receiver))
                .ForMember(x => x.SenderUserId, y => y.MapFrom(z => z.SenderId))
                .ReverseMap();

            CreateMap<User, UserSettingsModel>()
                .ReverseMap();
            CreateMap<User, UserDetailsModel>()
               .ForMember(x => x.FirstName, y => y.MapFrom(z => z.Person.FirstName))
               .ForMember(x => x.LastName, y => y.MapFrom(z => z.Person.LastName))
               .ForMember(x => x.BirthDate, y => y.MapFrom(z => z.Person.BirthDate))
               .ForMember(x => x.Gender, y => y.MapFrom(z => z.Person.Gender))
               .ForMember(x => x.Nationality, y => y.MapFrom(z => z.Person.Nationality))
               .ForMember(x => x.Religion, y => y.MapFrom(z => z.Person.Religion))
               .ForMember(x => x.BirthPlace, y => y.MapFrom(z => z.Person.BirthPlace))
               .ForMember(x => x.LivingPlace, y => y.MapFrom(z => z.Person.LivingPlace))
               .ForMember(x => x.Parents, y => y.MapFrom(z => z.Person.Parents))
               .ForMember(x => x.Children, y => y.MapFrom(z => z.Person.Children))
               .ForMember(x => x.UserId, y => y.MapFrom(z => z.Id))
               .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id))
               .ReverseMap();
            CreateMap<User, UserUpdateModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id))
                .ReverseMap();
            CreateMap<Person, UserUpdateModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ReverseMap();

            CreateMap<User, RegisterModel>()
               .ReverseMap();
            CreateMap<Person, RegisterModel>()
                .ReverseMap();

            CreateMap<User, LoginResponseModel>()
               .ForMember(x => x.TreeId, y => y.MapFrom(z => z.Person.TreeId))
               .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id));
        }
    }
}
