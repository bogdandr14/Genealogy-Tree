using GenealogyTree.Domain.DTO.Email;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEmailService
    {

        /// <summary>
        /// Sends a support email to the support team, making sure that the user is also 
        /// mentioned in the email.
        /// </summary>
        /// <param name="supportTicket"> Contains the information about the subject, title,
        /// description and user that wants to send the email.</param>
        /// <returns>
        Task SendSupportTicket(SupportTicket supportTicket);

    }
}
