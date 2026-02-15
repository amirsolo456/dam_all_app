using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE app_settings (
        id INT IDENTITY(1,1) PRIMARY KEY,
        tblKey NVARCHAR(MAX) NOT NULL,
        value NVARCHAR(MAX),
        updated_at DATETIME2 DEFAULT GETDATE(),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class AppSettingsController : BaseApiController<AppSetting, AppSettingDto, CreateAppSettingDto, UpdateAppSettingDto>
    {
        private readonly IAppSettingService _appSettingService;

        public AppSettingsController(IAppSettingService appSettingService) : base(appSettingService)
        {
            _appSettingService = appSettingService;
        }
    }
}
