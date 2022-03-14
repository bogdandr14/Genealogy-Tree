using GenealogyTree.Business.Services;
using GenealogyTree.Domain.DTO.Email;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Email
{
    public class EmailService : BaseService, IEmailService
    {
        private readonly SMTPModel _smtp;
        public IConfiguration _configuration { get; }

        public EmailService(IUnitOfWork unitOfWork, IOptions<SMTPModel> smtp, IConfiguration configuration): base(unitOfWork)
        {
            _smtp = smtp.Value;
            _configuration = configuration;
        }

        public async Task SendSupportTicket(SupportTicket supportTicket)
        {
            MailMessage mailMessage = GetDefaultMailMessage();
            mailMessage.Subject = "[" + supportTicket.Type + "][" + supportTicket.Language.ToUpper() + "] " + supportTicket.Subject;
            string path = Directory.GetCurrentDirectory() + _configuration["SupportMailPath"];
            mailMessage.Body = GetSupportTicketEmailBody(supportTicket, path);
            mailMessage.To.Add(_smtp.From);
            if (IsValidEmail(supportTicket.EmailContact))
            {
                mailMessage.CC.Add(supportTicket.EmailContact);
            }
            SendEmail(mailMessage);
        }

        private SmtpClient GetSMTPClient()
        {
            NetworkCredential networkCredential = new NetworkCredential(_smtp.From, _smtp.Password);
            SmtpClient client = new SmtpClient
            {
                Host = _smtp.Host,
                Port = _smtp.Port,
                EnableSsl = _smtp.EnableSsl,
                UseDefaultCredentials = _smtp.UseDefaultCredentials,
                Credentials = networkCredential
            };
            return client;
        }

        private void SendEmail(MailMessage mailMessage)
        {
            try
            {
                GetSMTPClient().Send(mailMessage);
            }
            catch
            {
                Console.WriteLine("eMail notification could not be sent");
            }
        }

        private MailMessage GetDefaultMailMessage()
        {
            MailMessage message = new MailMessage
            {
                From = new MailAddress(_smtp.From),
                IsBodyHtml = _smtp.IsBodyHtml,
            };
            return message;
        }

        private bool IsValidEmail(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        private string GetSupportTicketEmailBody(SupportTicket supportTicket, string path)
        {
            StreamReader reader = File.OpenText(path);
            string body = reader.ReadToEnd();
            PropertyInfo[] st = supportTicket.GetType().GetProperties();
            foreach (PropertyInfo f in st)
            {
                body = body.Replace("{" + f.Name + "}", f.GetValue(supportTicket).ToString());
            }

            EmailDescription emailDescription = EmailLanguageHelper.GetEmailDescription(supportTicket.Language);
            PropertyInfo[] ed = emailDescription.GetType().GetProperties();
            foreach (PropertyInfo f in ed)
            {
                body = body.Replace("{" + f.Name + "}", f.GetValue(emailDescription).ToString());
            }
            return body;
        }
    }
}
