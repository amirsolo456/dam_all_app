using AutoMapper;
using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Services.Implementations;

namespace khatoon_server_dotnet.Service
{
    public class TombstoneService : Service<Tombstone, TombstoneDto, CreateTombstoneDto, object>, ITombstoneService
    {
        public TombstoneService(KhatoonServerDbContext context, IMapper mapper) : base(context, mapper) { }

        public override Task<TombstoneDto?> UpdateAsync(int id, object dto, CancellationToken ct = default)
        {
            throw new NotSupportedException("Tombstones cannot be updated.");
        }
    }
}
