using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE shipping (
        id INT IDENTITY(1,1) PRIMARY KEY,
        invoice_id INT FOREIGN KEY REFERENCES invoices(id),
        carrier NVARCHAR(MAX),
        tracking_number NVARCHAR(MAX),
        status NVARCHAR(MAX),
        meta NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class ShippingsController : BaseApiController<Shipping, ShippingDto, CreateShippingDto, UpdateShippingDto>
    {
        private readonly IShippingService _shippingService;

        public ShippingsController(IShippingService shippingService) : base(shippingService)
        {
            _shippingService = shippingService;
        }
    }
}
