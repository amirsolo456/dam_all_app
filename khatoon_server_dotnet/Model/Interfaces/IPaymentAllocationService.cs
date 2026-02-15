using khatoon_server_dotnet.Model.DTOs;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface IPaymentAllocationService : IService<PaymentAllocationDto, CreatePaymentAllocationDto, UpdatePaymentAllocationDto> { }
}
