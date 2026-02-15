using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE items (
        id INT IDENTITY(1,1) PRIMARY KEY,
        title NVARCHAR(512) NOT NULL,
        body NVARCHAR(MAX),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class ItemsController : BaseApiController<Item, ItemDto, CreateItemDto, UpdateItemDto>
    {
        private readonly IItemService _itemService;

        public ItemsController(IItemService itemService) : base(itemService)
        {
            _itemService = itemService;
        }
    }
}
