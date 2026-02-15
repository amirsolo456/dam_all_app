using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE warranty (
        id INT IDENTITY(1,1) PRIMARY KEY,
        product_id INT FOREIGN KEY REFERENCES products(id),
        party_id INT FOREIGN KEY REFERENCES parties(id),
        start_at DATETIME2,
        end_at DATETIME2,
        terms NVARCHAR(MAX),
        meta NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class WarrantiesController : BaseApiController<Warranty, WarrantyDto, CreateWarrantyDto, UpdateWarrantyDto>
    {
        private readonly IWarrantyService _warrantyService;

        public WarrantiesController(IWarrantyService warrantyService) : base(warrantyService)
        {
            _warrantyService = warrantyService;
        }
    }
}
