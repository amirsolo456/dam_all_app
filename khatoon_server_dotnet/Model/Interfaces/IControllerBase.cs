using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface IControllerBase<TResponseDto, TCreateDto, TUpdateDto>
    {
        Task<ActionResult<IEnumerable<TResponseDto>>> GetAll();
        Task<ActionResult<TResponseDto>> GetById(int id);
        Task<ActionResult<TResponseDto>> Create(TCreateDto dto);
        Task<ActionResult<TResponseDto>> Update(int id, TUpdateDto dto);
        Task<ActionResult> Delete(int id);
    }
}
