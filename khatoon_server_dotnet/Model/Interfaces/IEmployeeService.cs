using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;

namespace khatoon_server_dotnet.Model.Interfaces
{
    public interface IEmployeeService : IService<EmployeeDto, CreateEmployeeDto, UpdateEmployeeDto> { }

}
