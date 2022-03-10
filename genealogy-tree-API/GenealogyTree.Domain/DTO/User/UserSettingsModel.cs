using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserSettingsModel
    {
        public bool NotifyUpdates { get; set; }
        public bool NotifyBirthdays { get; set; }
        public bool SharePersonalInfo { get; set; }
    }
}
