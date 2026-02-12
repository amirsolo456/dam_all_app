using khatoon_server_dotnet.Model.DTOs;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface ITombstoneService : IService<TombstoneDto, CreateTombstoneDto, object> // بدون Update
    {
        // متد Update پشتیبانی نمی‌شود
    }
}
