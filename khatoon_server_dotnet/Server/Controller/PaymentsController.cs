using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE payments (
        id INT IDENTITY(1,1) PRIMARY KEY,
        date DATETIME2 DEFAULT GETDATE(),
        amount DECIMAL(18,2) NOT NULL,
        direction NVARCHAR(MAX) NOT NULL,
        payment_method NVARCHAR(MAX),
        from_party_id INT FOREIGN KEY REFERENCES parties(id),
        to_party_id INT FOREIGN KEY REFERENCES parties(id),
        reference NVARCHAR(MAX),
        notes NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE(),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentsController : BaseApiController<Payment, PaymentDto, CreatePaymentDto, UpdatePaymentDto>
    {
        private readonly IPaymentService _paymentService;

        public PaymentsController(IPaymentService paymentService) : base(paymentService)
        {
            _paymentService = paymentService;
        }
    }
}
