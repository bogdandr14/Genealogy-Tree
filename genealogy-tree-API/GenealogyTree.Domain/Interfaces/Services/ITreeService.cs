using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface ITreeService
    {
        Task GetTreeForUser(int userId, int? rootPersonId);
    }
}
