using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE animals (
        id INT IDENTITY(1,1) PRIMARY KEY,
        tag_number NVARCHAR(MAX) NOT NULL,
        name NVARCHAR(MAX),
        type NVARCHAR(MAX) NOT NULL,
        breed NVARCHAR(MAX),
        gender NVARCHAR(MAX) NOT NULL,
        birth_date DATETIME2,
        purchase_date DATETIME2,
        purchase_price DECIMAL(18,2),
        purchase_source NVARCHAR(MAX),
        current_weight DECIMAL(18,2),
        color NVARCHAR(MAX),
        health_status NVARCHAR(MAX),
        reproduction_status NVARCHAR(MAX),
        notes NVARCHAR(MAX),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    */
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
