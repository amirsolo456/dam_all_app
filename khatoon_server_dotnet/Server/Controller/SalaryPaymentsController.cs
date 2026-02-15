using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE salary_payments (
        id INT IDENTITY(1,1) PRIMARY KEY,
        employee_id INT NOT NULL FOREIGN KEY REFERENCES employees(id),
        period_start DATETIME2 NOT NULL,
        period_end DATETIME2 NOT NULL,
        amount_paid DECIMAL(18,2) NOT NULL,
        date_paid DATETIME2 DEFAULT GETDATE(),
        notes NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE(),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class SalaryPaymentsController : BaseApiController<SalaryPayment, SalaryPaymentDto, CreateSalaryPaymentDto, UpdateSalaryPaymentDto>
    {
        private readonly ISalaryPaymentService _salaryPaymentService;

        public SalaryPaymentsController(ISalaryPaymentService salaryPaymentService) : base(salaryPaymentService)
        {
            _salaryPaymentService = salaryPaymentService;
        }
    }
}
