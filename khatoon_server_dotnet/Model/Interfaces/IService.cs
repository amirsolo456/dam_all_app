using khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface IService<TResponseDto, TCreateDto, TUpdateDto>
    where TResponseDto : IHasId
    {
        Task<IEnumerable<TResponseDto>> GetAllAsync(CancellationToken ct = default);
        Task<TResponseDto?> GetByIdAsync(int id, CancellationToken ct = default);
        Task<TResponseDto> CreateAsync(TCreateDto dto, CancellationToken ct = default);
        Task<TResponseDto?> UpdateAsync(int id, TUpdateDto dto, CancellationToken ct = default);
        Task<bool> DeleteAsync(int id, CancellationToken ct = default);
    }
}
