using AutoMapper;
using Azure;
using Microsoft.AspNetCore.Http.HttpResults;

namespace khatoon_server_dotnet.Model.Mapping.Base
{

    public abstract class BaseProfileMapper<TEntity, TResponseDto, TCreateDto, TUpdateDto> : Profile
    where TEntity : BaseEntityMapper
    {
        public abstract TResponseDto EntityToResponse(TEntity entity);
        public abstract TEntity CreateDtoToEntity(TCreateDto dto);
        public abstract void UpdateDtoToEntity(TUpdateDto dto, TEntity entity);


        public TEntity CreateEntity(TCreateDto dto)
        {
            var entity = CreateDtoToEntity(dto);

            // مقداردهی دستی فیلدهای پایه (معادل Ignore در AutoMapper)
            entity.Id = 0;
            entity.CreatedAt = DateTime.UtcNow;
            entity.UpdatedAt = DateTime.UtcNow;
            entity.Version = 0;
            entity.IsDeleted = false;

            return entity;
        }

        public void UpdateEntity(TUpdateDto dto, TEntity entity)
        {
            UpdateDtoToEntity(dto, entity);

            // فقط UpdatedAt را روزآمد کن
            entity.UpdatedAt = DateTime.UtcNow;
        }

        protected BaseProfileMapper()
        {
            // Entity → Response
            CreateMap<TEntity, TResponseDto>();

            // Create → Entity
            CreateMap<TCreateDto, TEntity>()
                .ForMember(x => x.Id, opt => opt.Ignore())
                .ForMember(x => x.CreatedAt, opt => opt.Ignore())
                .ForMember(x => x.UpdatedAt, opt => opt.Ignore())
                .ForMember(x => x.Version, opt => opt.Ignore())
                .ForMember(x => x.IsDeleted, opt => opt.Ignore());

            // Update → Entity
            CreateMap<TUpdateDto, TEntity>()
                .ForMember(x => x.Id, opt => opt.Ignore())
                .ForMember(x => x.CreatedAt, opt => opt.Ignore())
                .ForMember(x => x.Version, opt => opt.Ignore());
        }
    }

}
public static class MappingExtensions
{
    public static void CreateCrudMap<TEntity, TDto, TCreateDto, TUpdateDto>(this Profile profile)
        where TEntity : class
        where TDto : class
        where TCreateDto : class
        where TUpdateDto : class
    {
        // Entity <-> Dto
        profile.CreateMap<TEntity, TDto>().ReverseMap();

        // CreateDto -> Entity
        profile.CreateMap<TCreateDto, TEntity>();

        // UpdateDto -> Entity (ignore null values)
        profile.CreateMap<TUpdateDto, TEntity>()
            .ForAllMembers(opts =>
                opts.Condition((src, dest, srcMember) => srcMember != null));
    }
}