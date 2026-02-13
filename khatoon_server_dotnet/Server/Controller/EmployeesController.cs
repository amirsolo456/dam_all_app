using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    [ApiController]
    [Route("api/[controller]")]
    public class EmployeesController : BaseApiController<Employee, EmployeeDto, CreateEmployeeDto, UpdateEmployeeDto>
    {
        private readonly IEmployeeService _employeeService;

        public EmployeesController(IEmployeeService employeeService) : base(employeeService)
        {
            _employeeService = employeeService;
        }
    }
}
