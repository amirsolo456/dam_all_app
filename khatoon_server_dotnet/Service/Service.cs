using AutoMapper;
using AutoMapper.QueryableExtensions;
using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Security.Principal;
namespace khatoon_server_dotnet.Services.Implementations;

public class Service<TEntity, TResponseDto, TCreateDto, TUpdateDto>
    : IService<TResponseDto, TCreateDto, TUpdateDto>
    where TEntity : class, IHasId, new()
    where TResponseDto : IHasId
{
    protected readonly KhatoonServerDbContext _context;
    protected readonly IMapper _mapper;
    protected readonly DbSet<TEntity> _dbSet;

    public Service(KhatoonServerDbContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
        _dbSet = _context.Set<TEntity>();
    }

    public virtual async Task<IEnumerable<TResponseDto>> GetAllAsync(CancellationToken ct = default)
    {
        return await _dbSet
            .AsNoTracking()
            .ProjectTo<TResponseDto>(_mapper.ConfigurationProvider)
            .ToListAsync(ct);
    }

    public virtual async Task<TResponseDto?> GetByIdAsync(int id, CancellationToken ct = default)
    {
        var entity = await _dbSet.FindAsync(id);
        return entity == null ? default : _mapper.Map<TResponseDto>(entity);
    }


    public virtual async Task<TResponseDto> CreateAsync(TCreateDto dto, CancellationToken ct = default)
    {
        if (dto == null) throw new ArgumentNullException(nameof(dto));

        var entity = _mapper.Map<TEntity>(dto);

        // set defaults using interfaces (no reflection)
        if (entity is IHasTimestamps ts)
        {
            ts.CreatedAt = DateTime.UtcNow;
            ts.UpdatedAt = DateTime.UtcNow;
        }

        if (entity is IHasVersion v)
        {
            v.Version = 0;
        }

        //if (entity.Id == 0)
        //    entity.Id = Convert.ToInt32(Guid.NewGuid().ToString());

        await _dbSet.AddAsync(entity, ct);
        await _context.SaveChangesAsync(ct);

        return _mapper.Map<TResponseDto>(entity);
    }

    public virtual async Task<TResponseDto?> UpdateAsync(int id, TUpdateDto dto, CancellationToken ct = default)
    {
        if (dto == null) throw new ArgumentNullException(nameof(dto));

        var entity = await _dbSet.FindAsync(new object[] { id }, ct);
        if (entity == null) return default;

        _mapper.Map(dto, entity);

        if (entity is IHasTimestamps ts)
        {
            ts.UpdatedAt = DateTime.UtcNow;
        }

        if (entity is IHasVersion ver)
        {
            ver.Version = ver.Version + 1;
        }

        await _context.SaveChangesAsync(ct);
        return _mapper.Map<TResponseDto>(entity);
    }

    public virtual async Task<bool> DeleteAsync(int id, CancellationToken ct = default)
    {
        var entity = await _dbSet.FindAsync(new object[] { id }, ct);
        if (entity == null) return false;

        if (entity is ISoftDelete soft)
        {
            soft.IsDeleted = true;
            if (entity is IHasTimestamps ts)
                ts.UpdatedAt = DateTime.UtcNow;
        }
        else
        {
            _dbSet.Remove(entity);
        }

        await _context.SaveChangesAsync(ct);
        return true;
    }

    protected virtual void SetCreateProperties(object entity)
    {
        var createdAtProp = entity.GetType().GetProperty("CreatedAt");
        if (createdAtProp != null && createdAtProp.PropertyType == typeof(DateTime))
            createdAtProp.SetValue(entity, DateTime.UtcNow);

        var updatedAtProp = entity.GetType().GetProperty("UpdatedAt");
        if (updatedAtProp != null && updatedAtProp.PropertyType == typeof(DateTime))
            updatedAtProp.SetValue(entity, DateTime.UtcNow);

        //var idProp = entity.GetType().GetProperty("Id");
        //if (idProp != null && idProp.PropertyType == typeof(Guid))
        //{
        //    var currentId = (Guid?)idProp.GetValue(entity);
        //    if (currentId == Guid.Empty)
        //        idProp.SetValue(entity, Guid.NewGuid());
        //}

        var versionProp = entity.GetType().GetProperty("Version");
        if (versionProp != null && versionProp.PropertyType == typeof(int))
            versionProp.SetValue(entity, 0);
    }

    protected virtual void SetUpdateProperties(object entity)
    {
        var updatedAtProp = entity.GetType().GetProperty("UpdatedAt");
        if (updatedAtProp != null && updatedAtProp.PropertyType == typeof(DateTime))
            updatedAtProp.SetValue(entity, DateTime.UtcNow);

        var versionProp = entity.GetType().GetProperty("Version");
        if (versionProp != null && versionProp.PropertyType == typeof(int))
        {
            var currentVersion = (int)(versionProp.GetValue(entity) ?? 0);
            versionProp.SetValue(entity, currentVersion + 1);
        }
    }
}