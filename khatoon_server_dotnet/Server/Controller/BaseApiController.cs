// File: Controllers/BaseApiController.cs
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace khatoon_server_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public abstract class BaseApiController<TEntity, TResponseDto, TCreateDto, TUpdateDto> : ControllerBase   where TResponseDto : IHasId
    {
        protected readonly IService<TResponseDto, TCreateDto, TUpdateDto> _service;

        protected BaseApiController(IService<TResponseDto, TCreateDto, TUpdateDto> service)
        {
            _service = service;
        }

        [HttpGet]
        public virtual async Task<ActionResult<IEnumerable<TResponseDto>>> GetAll()
        {
            var items = await _service.GetAllAsync();
            return Ok(items);
        }

        [HttpGet("{id:int}")]
        public virtual async Task<ActionResult<TResponseDto>> GetById(int id)
        {
            var item = await _service.GetByIdAsync(id);
            return item is not null ? Ok(item) : NotFound();
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public virtual async Task<ActionResult<TResponseDto>> Create(TCreateDto dto)
        {
            var item = await _service.CreateAsync(dto);
            return CreatedAtAction(nameof(GetById), new { id = item.Id }, item);
        }



        [HttpPut("{id}")]
        public virtual async Task<ActionResult<TResponseDto>> Update(int id, TUpdateDto dto)
        {
            var item = await _service.UpdateAsync(id, dto);
            if (item == null) return NotFound();
            return Ok(item);
        }

        [HttpDelete("{id}")]
        public virtual async Task<ActionResult> Delete(int id)
        {
            var result = await _service.DeleteAsync(id);
            if (!result) return NotFound();
            return NoContent();
        }
    }
}
