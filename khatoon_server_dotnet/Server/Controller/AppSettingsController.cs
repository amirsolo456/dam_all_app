using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    [ApiController]
    [Route("api/[controller]")]
    public class AppSettingsController : BaseApiController<AppSetting,AppSettingDto, CreateAppSettingDto, UpdateAppSettingDto>
    {
        private readonly IAppSettingService _appSettingService;
        public AppSettingsController(IAppSettingService service) : base(service)
        {
            _appSettingService = service;
        }

        [HttpGet("key/{key}")]
        public async Task<ActionResult<AppSettingDto>> GetByKey(string key)
        {
            var setting = await _appSettingService.GetByKeyAsync(key);
            if (setting == null) return NotFound();
            return Ok(setting);
        }
    }
}
