using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE app_enum (
        id INT IDENTITY(1,1) PRIMARY KEY,
        namespace NVARCHAR(MAX) NOT NULL,
        key NVARCHAR(MAX) NOT NULL,
        value NVARCHAR(MAX),
        meta NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class AppEnumsController : BaseApiController<AppEnum, AppEnumDto, CreateAppEnumDto, UpdateAppEnumDto>
    {
        private readonly IAppEnumService _appEnumService;

        public AppEnumsController(IAppEnumService appEnumService) : base(appEnumService)
        {
            _appEnumService = appEnumService;
        }
    }
}
