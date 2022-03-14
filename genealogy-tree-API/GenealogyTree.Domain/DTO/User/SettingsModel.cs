namespace GenealogyTree.Domain.DTO.User
{
    public class SettingsModel
    {
        public int UserId { get; set; }
        public bool NotifyBirthdays { get; set; }
        public bool NotifyUpdates { get; set; }
        public bool SharePersonalInfo { get; set; }

    }
}
