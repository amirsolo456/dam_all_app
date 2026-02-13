using AutoMapper;
using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Services.Implementations;

namespace khatoon_server_dotnet.Service
{
    public class AccountSettingService : Service<AccountSetting, AccountSettingDto, CreateAccountSettingDto, UpdateAccountSettingDto>, IAccountSettingService
    {
        public AccountSettingService(KhatoonServerDbContext context, IMapper mapper) : base(context, mapper) { }
    }
}
