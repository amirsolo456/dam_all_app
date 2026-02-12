using khatoon_server_dotnet.Model.DTOs;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface ISyncQueueService : IService<SyncQueueDto, CreateSyncQueueDto, UpdateSyncQueueDto>
    {
        // متدهای اضافه در صورت نیاز
    }
}
