namespace GenealogyTree.Domain.DTO.Email
{
    public class SmtpModel
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public string From { get; set; }
        public bool EnableSsl { get; set; }
        public string Password { get; set; }
        public bool IsBodyHtml { get; set; }
        public bool UseDefaultCredentials { get; set; }

    }
}
