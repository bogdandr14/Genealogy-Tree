using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.ParentChild;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using System;
using System.IO;
using System.Linq;

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

            //education mapping
            CreateMap<Education, EducationModel>()
                .ReverseMap();

            CreateMap<EducationLevel, GenericNameModel>()
                .ReverseMap();

            //image mapping
            CreateMap<Image, ImageFile>()
                .ForMember(x => x.Name, y => y.MapFrom(z => Guid.Parse(Path.GetFileNameWithoutExtension(z.FileName))));

            CreateMap<ImageFile, Image>();

            //location mapping
            CreateMap<Location, LocationModel>()
                .ReverseMap();

            //marriage mapping
            CreateMap<Marriage, MarriedPersonModel>()
                .ForMember(x => x.MarriageStarted, y => y.MapFrom(z => z.StartDate))
                .ForMember(x => x.MarriageEnded, y => y.MapFrom(z => z.EndDate))
                .ForMember(x => x.PersonMarriedTo, y => y.MapFrom(z => DefineMapping(z.FirstPerson, z.SecondPerson)));

            CreateMap<Marriage, MarriageDetailsModel>()
                .ForMember(x => x.MarriageStarted, y => y.MapFrom(z => z.StartDate))
                .ForMember(x => x.MarriageEnded, y => y.MapFrom(z => z.EndDate))
                .ForMember(x => x.PersonMarriedTo, y => y.MapFrom(z => z.SecondPerson))
                .ReverseMap();

            CreateMap<Marriage, MarriageCreateUpdateModel>()
                .ReverseMap();

            //nationality mapping
            CreateMap<Nationality, GenericNameModel>()
                .ReverseMap();

            //occupation mapping
            CreateMap<Occupation, OccupationModel>()
                .ReverseMap();

            //parent mapping
            CreateMap<ParentChild, ParentModel>()
                .ForMember(x => x.ParentChildId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.TreeId, y => y.MapFrom(z => z.Parent.TreeId))
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Parent.Id))
                .ForMember(x => x.FirstName, y => y.MapFrom(z => z.Parent.FirstName))
                .ForMember(x => x.LastName, y => y.MapFrom(z => z.Parent.LastName))
                .ForMember(x => x.Gender, y => y.MapFrom(z => z.Parent.Gender.ToString()))
                .ForMember(x => x.ImageId, y => y.MapFrom(z => z.Parent.ImageId))
                .ForMember(x => x.BirthDate, y => y.MapFrom(z => z.Parent.BirthDate))
                .ForMember(x => x.DeathDate, y => y.MapFrom(z => z.Parent.DeathDate))
                .ReverseMap();

            CreateMap<ParentModel, ParentChildModel>()
                .ReverseMap();

            //child mapping
            CreateMap<ParentChild, ChildModel>()
                .ForMember(x => x.ParentChildId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.TreeId, y => y.MapFrom(z => z.Child.TreeId))
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Child.Id))
                .ForMember(x => x.FirstName, y => y.MapFrom(z => z.Child.FirstName))
                .ForMember(x => x.LastName, y => y.MapFrom(z => z.Child.LastName))
                .ForMember(x => x.Gender, y => y.MapFrom(z => z.Child.Gender.ToString()))
                .ForMember(x => x.ImageId, y => y.MapFrom(z => z.Child.ImageId))
                .ForMember(x => x.BirthDate, y => y.MapFrom(z => z.Child.BirthDate))
                .ForMember(x => x.DeathDate, y => y.MapFrom(z => z.Child.DeathDate))
                .ReverseMap();

            CreateMap<ChildModel, ParentChildModel>()
                .ReverseMap();

            //parent child details mapping
            CreateMap<ParentChild, ParentChildDetailsModel>()
                .ForMember(x => x.RelativeId, y => y.MapFrom(z => z.Id))
                .ReverseMap();

            CreateMap<ParentChild, ParentChildCreateUpdateModel>()
                .ForMember(x => x.RelativeId, y => y.MapFrom(z => z.Id))
                .ReverseMap();

            //person mapping
            CreateMap<Person, GenericPersonModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.UserId, y =>
                {
                    y.PreCondition(src => (src.RelativeForPerson != null));
                    y.MapFrom(z => z.RelativeForPerson.RelativeUserId);
                })
                .ReverseMap();

            CreateMap<Person, PersonTreeInfoModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.UserId, y =>
                {
                    y.PreCondition(src => (src.RelativeForPerson != null));
                    y.MapFrom(z => z.RelativeForPerson.RelativeUserId);
                })
                .ReverseMap();

            CreateMap<Person, PersonDetailsModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.Gender, y => y.MapFrom(z => z.Gender == 'm' ? "m" : "f"))
                .ForMember(x => x.UserId, y =>
                {
                    y.PreCondition(src => (src.RelativeForPerson != null));
                    y.MapFrom(z => z.RelativeForPerson.RelativeUserId);
                });

            CreateMap<Person, PersonCreateUpdateModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.UserId, y =>
                {
                    y.PreCondition(src => (src.RelativeForPerson != null));
                    y.MapFrom(z => z.RelativeForPerson.RelativeUserId);
                }).ReverseMap();

            //religion mapping
            CreateMap<Religion, GenericNameModel>()
                .ReverseMap();

            //relative mapping
            CreateMap<Relative, RelativeModel>()
                .ForMember(x => x.RelativePersonInTreeId, y => y.MapFrom(z => z.RelativePersonInPrimaryTreeId))
                .ReverseMap();

            CreateMap<Relative, UsersToLinkModel>()
                .ReverseMap();

            //request mapping
            CreateMap<Request, RequestDetailsModel>()
                .ForMember(x => x.ReceiverUser, y => y.MapFrom(z => z.Receiver))
                .ForMember(x => x.SenderUser, y => y.MapFrom(z => z.Sender))
                .ReverseMap();

            CreateMap<Request, RequestCreateUpdateModel>()
                .ForMember(x => x.ReceiverUser, y => y.MapFrom(z => z.Receiver))
                .ForMember(x => x.SenderUserId, y => y.MapFrom(z => z.SenderId));

            CreateMap<RequestCreateUpdateModel, Request>()
                .ForMember(x => x.ReceiverId, y => y.MapFrom(z => z.ReceiverUser.UserId))
                .ForMember(x => x.SenderId, y => y.MapFrom(z => z.SenderUserId));

            CreateMap<Request, RequestResponseModel>()
                .ForMember(x => x.ReceiverUser, y => y.MapFrom(z => z.Receiver));

            //user mapping
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
                .ForMember(x => x.Parents, y => y.MapFrom(z => z.Person.Parents.ToList()))
                .ForMember(x => x.Children, y => y.MapFrom(z => z.Person.Children.ToList()))
                .ForMember(x => x.UserId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.TreeId, y => y.MapFrom(z => z.Person.TreeId))
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id))
                .ReverseMap();

            CreateMap<User, UserUpdateModel>()
               .ReverseMap();

            //user to person mapping
            CreateMap<User, GenericPersonModel>()
                .ForMember(x => x.UserId, y => y.MapFrom(z => z.Id))
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id))
                .ForMember(x => x.TreeId, y => y.MapFrom(z => z.Person.TreeId))
                .ForMember(x => x.FirstName, y => y.MapFrom(z => z.Person.FirstName))
                .ForMember(x => x.LastName, y => y.MapFrom(z => z.Person.LastName))
                .ForMember(x => x.BirthDate, y => y.MapFrom(z => z.Person.BirthDate))
                .ForMember(x => x.Gender, y => y.MapFrom(z => z.Person.Gender.ToString()))
                .ForMember(x => x.BirthDate, y => y.MapFrom(z => z.Person.BirthDate))
                .ForMember(x => x.ImageId, y => y.MapFrom(z => z.Person.ImageId))
                .ReverseMap();

            //position mapping
            CreateMap<User, UserPositionModel>()
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id))
                .ForMember(x => x.Type, y => y.MapFrom(z => "CURRENT"))
                .ForMember(x => x.FirstName, y => y.MapFrom(z => z.Person.FirstName))
                .ForMember(x => x.LastName, y => y.MapFrom(z => z.Person.LastName))
                .ForMember(x => x.Latitude, y => y.MapFrom(z => z.Position.Latitude))
                .ForMember(x => x.Longitude, y => y.MapFrom(z => z.Position.Longitude))
                .ForMember(x => x.UpdatedOn, y => y.MapFrom(z => z.Position.UpdatedOn));

            CreateMap<Position, PositionModel>();

            //registration mapping
            CreateMap<User, RegisterModel>()
                .ReverseMap();

            CreateMap<RegisterModel, Person>()
                .ForMember(x => x.Gender, y => y.MapFrom(z => z.Gender == "m" ? 'm' : 'f'));

            CreateMap<User, LoginResponseModel>()
                .ForMember(x => x.TreeId, y => y.MapFrom(z => z.Person.TreeId))
                .ForMember(x => x.PersonId, y => y.MapFrom(z => z.Person.Id));
        }

        private static T DefineMapping<T>(T first, T second)
        {
            if (first != null)
            {
                return first;
            }

            if (second != null)
            {
                return second;
            }

            return default(T);
        }
    }
}
