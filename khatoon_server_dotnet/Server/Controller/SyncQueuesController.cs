using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE sync_queue (
        id INT IDENTITY(1,1) PRIMARY KEY,
        seq INT,
        entity_type NVARCHAR(100) NOT NULL,
        entity_id INT NOT NULL,
        operation NVARCHAR(50) NOT NULL,
        payload NVARCHAR(MAX) NOT NULL, -- JSON
        status NVARCHAR(50) DEFAULT 'pending',
        retry_count INT DEFAULT 0,
        error_message NVARCHAR(500),
        is_deleted BIT DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class SyncQueuesController : BaseApiController<SyncQueue, SyncQueueDto, CreateSyncQueueDto, UpdateSyncQueueDto>
    {
        private readonly ISyncQueueService _syncQueueService;

        public SyncQueuesController(ISyncQueueService syncQueueService) : base(syncQueueService)
        {
            _syncQueueService = syncQueueService;
        }
    }
}
