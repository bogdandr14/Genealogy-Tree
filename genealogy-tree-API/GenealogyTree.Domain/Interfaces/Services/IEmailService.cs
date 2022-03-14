using GenealogyTree.Domain.DTO.Email;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEmailService
    {
        Task SendSupportTicket(SupportTicket supportTicket);

    }
}
