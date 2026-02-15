using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE payment_allocations (
        id INT IDENTITY(1,1) PRIMARY KEY,
        payment_id INT NOT NULL FOREIGN KEY REFERENCES payments(id),
        invoice_id INT NOT NULL FOREIGN KEY REFERENCES invoices(id),
        amount_allocated DECIMAL(18,2) NOT NULL,
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentAllocationsController : BaseApiController<PaymentAllocation, PaymentAllocationDto, CreatePaymentAllocationDto, UpdatePaymentAllocationDto>
    {
        private readonly IPaymentAllocationService _paymentAllocationService;

        public PaymentAllocationsController(IPaymentAllocationService paymentAllocationService) : base(paymentAllocationService)
        {
            _paymentAllocationService = paymentAllocationService;
        }
    }
}
