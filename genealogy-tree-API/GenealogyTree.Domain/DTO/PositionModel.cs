using System;

namespace GenealogyTree.Domain.DTO
{
    public class PositionModel
    {
        public Guid UserId { get; set; }
        public float Latitude { get; set; }
        public float Longitude { get; set; }
    }
}
