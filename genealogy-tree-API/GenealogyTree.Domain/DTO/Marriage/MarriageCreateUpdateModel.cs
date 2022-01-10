using System;

namespace GenealogyTree.Domain.DTO.Marriage
{
    public class MarriageCreateUpdateModel
    {
        public int Id { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int FirstPersonId { get; set; }
        public int SecondPersonId { get; set; }

    }
}
