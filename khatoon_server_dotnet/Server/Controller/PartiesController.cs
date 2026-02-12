using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
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
