using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE employees (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(MAX) NOT NULL,
        role NVARCHAR(MAX),
        salary_amount DECIMAL(18,2),
        is_commissioned BIT DEFAULT 0,
        commission_percent DECIMAL(5,2),
        notes NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE(),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0
    );
    */
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
