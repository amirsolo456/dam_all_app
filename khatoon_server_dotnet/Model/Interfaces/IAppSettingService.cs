using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface IAppSettingService : IService<AppSettingDto, CreateAppSettingDto, UpdateAppSettingDto>
    {
        Task<AppSettingDto?> GetByKeyAsync(string key);
 
    }
}
