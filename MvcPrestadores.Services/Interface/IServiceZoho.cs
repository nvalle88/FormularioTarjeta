using Card.Entity.DTO;
using System.Threading.Tasks;

namespace Card.Services.Interface
{
    public interface IServiceZoho
    {
        Task<ReturnCardInfo> SendCardInfo(SendCardInfo sendCardInfo , int tryCallService);
    }
}
