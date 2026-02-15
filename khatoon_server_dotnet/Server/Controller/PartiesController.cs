using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE parties (
        id INT IDENTITY(1,1) PRIMARY KEY,
        type NVARCHAR(MAX) NOT NULL DEFAULT 'customer',
        name NVARCHAR(MAX) NOT NULL,
        phone NVARCHAR(MAX),
        address NVARCHAR(MAX),
        notes NVARCHAR(MAX),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class PartiesController : BaseApiController<Party, PartyDto, CreatePartyDto, UpdatePartyDto>
    {
        private readonly IPartyService _partyService;

        public PartiesController(IPartyService partyService) : base(partyService)
        {
            _partyService = partyService;
        }

    }
}
