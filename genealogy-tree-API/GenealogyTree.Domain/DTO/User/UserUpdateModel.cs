using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserUpdateModel : UserRegisterModel
    {
        public string About { get; set; }
        public bool SharePersonalInfo { get; set; }
    }
}
