namespace GenealogyTree.Domain.DTO.User
{
    public class UserSettingsModel
    {
        public int Id { get; set; }
        public bool NotifyUpdates { get; set; }
        public bool NotifyBirthdays { get; set; }
        public bool SharePersonalInfo { get; set; }
        public bool ThemePreference { get; set; }
        public string LanguagePreference { get; set; }
    }
}
