using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface IReligionService
    {
        Task AddReligion();
        Task<List<Religion>> GetReligions();
        Task<List<Religion>> FindReligion(string religionName);
    }
}
