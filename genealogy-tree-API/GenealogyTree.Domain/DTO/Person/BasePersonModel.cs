using System;

namespace GenealogyTree.Domain.DTO.Person
{
    public class BasePersonModel : GenericPersonModel
    {
        public Guid? UserId { get; set; }
    }
}
