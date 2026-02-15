using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE health (
        id INT IDENTITY(1,1) PRIMARY KEY,
        party_id INT FOREIGN KEY REFERENCES parties(id),
        notes NVARCHAR(MAX),
        meta NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class HealthController : BaseApiController<Health, HealthDto, CreateHealthDto, UpdateHealthDto>
    {
        private readonly IHealthService _healthService;

        public HealthController(IHealthService healthService) : base(healthService)
        {
            _healthService = healthService;
        }
    }
}
