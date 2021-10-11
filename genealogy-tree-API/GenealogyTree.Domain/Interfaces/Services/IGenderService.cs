using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface IGenderService
    {
        Task AddGender();
        Task<List<Gender>> GetGenders();
    }
}
