using System;
using System.ComponentModel.DataAnnotations;

namespace GenealogyTree.Domain.Entities
{
    public class Position
    {
        [Key]
        public int Id { get; set; }
        public float Latitude { get; set; }
        public float Longitude { get; set; }
        public DateTime LastVerified { get; set; }
    }
}
