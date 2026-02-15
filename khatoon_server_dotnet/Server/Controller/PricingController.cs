using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE pricing (
        id INT IDENTITY(1,1) PRIMARY KEY,
        product_id INT FOREIGN KEY REFERENCES products(id),
        price DECIMAL(18,2) NOT NULL,
        currency NVARCHAR(MAX),
        valid_from DATETIME2,
        valid_to DATETIME2,
        meta NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class PricingController : BaseApiController<Pricing, PricingDto, CreatePricingDto, UpdatePricingDto>
    {
        private readonly IPricingService _pricingService;

        public PricingController(IPricingService pricingService) : base(pricingService)
        {
            _pricingService = pricingService;
        }
    }
}
