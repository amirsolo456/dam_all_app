using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    [ApiController]
    [Route("api/[controller]")]
    public class AnimalsController : BaseApiController<Animal, AnimalDto, CreateAnimalDto, UpdateAnimalDto>
    {
        private readonly IAnimalService _animalService;

        public AnimalsController(IAnimalService animalService) : base(animalService)
        {
            _animalService = animalService;
        }
    }
}
