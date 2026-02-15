using AutoMapper;
using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Services.Implementations;

namespace khatoon_server_dotnet.Service
{
    public class RoleService : Service<Role, RoleDto, CreateRoleDto, UpdateRoleDto>, IRoleService
    {
        public RoleService(KhatoonServerDbContext context, IMapper mapper) : base(context, mapper) { }
    }
}
