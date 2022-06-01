using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Request;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO
{
    public class NotificationsBundle
    {
        public List<RequestDetailsModel> RequestsReceived { get; set; }
        public List<RequestResponseModel> RequestsResponded { get; set; }
        public List<GenericPersonModel> UserUpdates { get; set; }
        public List<EventInTreeModel> EventsToday { get; set; }
    }
}
