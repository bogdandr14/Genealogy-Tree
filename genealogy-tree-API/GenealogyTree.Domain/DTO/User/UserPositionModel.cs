﻿using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserPositionModel : PositionModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime UpdatedOn { get; set; }

#nullable enable
        public ImageFile? ImageFile { get; set; }
    }
}
