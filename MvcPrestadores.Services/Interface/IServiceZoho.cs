using Card.Entity.DTO;
using System.Threading.Tasks;

namespace Card.Services.Interface
{
    public interface IServiceZoho
    {
        Task<ResponseCard> SendCardInfo(SendCardInfo sendCardInfo , int tryCallService);
    }
}
