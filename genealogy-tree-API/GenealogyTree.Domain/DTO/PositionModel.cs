﻿using System;

namespace GenealogyTree.Domain.DTO
{
    public class PositionModel
    {
        public int PersonId { get; set; }
        public float Latitude { get; set; }
        public float Longitude { get; set; }
    }
}
