using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE tombstones (
        id INT IDENTITY(1,1) PRIMARY KEY,
        entity_type NVARCHAR(MAX) NOT NULL,
        entity_id INT NOT NULL,
        deleted_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class TombstonesController : BaseApiController<Tombstone, TombstoneDto, CreateTombstoneDto, object>
    {
        private readonly ITombstoneService _tombstoneService;

        public TombstonesController(ITombstoneService tombstoneService) : base(tombstoneService)
        {
            _tombstoneService = tombstoneService;
        }
    }
}
