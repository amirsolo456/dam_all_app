using AutoMapper;
using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Services.Implementations;
using Microsoft.EntityFrameworkCore;
using System;

namespace khatoon_server_dotnet.Service
{
    public class AppSettingService : Service<AppSetting, AppSettingDto, CreateAppSettingDto, UpdateAppSettingDto>, IAppSettingService
    {
        public AppSettingService(KhatoonServerDbContext context, IMapper mapper) : base(context, mapper) { }

        public async Task<AppSettingDto?> GetByKeyAsync(string key)
        {
            var entity = await _dbSet.FirstOrDefaultAsync(x =>
                EF.Property<string>(x, "Key") == key);
            return entity == null ? null : _mapper.Map<AppSettingDto>(entity);
        }
    }
}
