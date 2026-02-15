using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE account_settings (
        id INT IDENTITY(1,1) PRIMARY KEY,
        tblKey NVARCHAR(MAX) NOT NULL,
        value NVARCHAR(MAX),
        updated_at DATETIME2 DEFAULT GETDATE(),
        created_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class AccountSettingsController : BaseApiController<AccountSetting, AccountSettingDto, CreateAccountSettingDto, UpdateAccountSettingDto>
    {
        private readonly IAccountSettingService _accountSettingService;

        public AccountSettingsController(IAccountSettingService accountSettingService) : base(accountSettingService)
        {
            _accountSettingService = accountSettingService;
        }
    }
}
