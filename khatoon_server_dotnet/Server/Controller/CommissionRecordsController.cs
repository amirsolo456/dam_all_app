using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE commission_records (
        id INT IDENTITY(1,1) PRIMARY KEY,
        employee_id INT NOT NULL FOREIGN KEY REFERENCES employees(id),
        invoice_id INT NOT NULL FOREIGN KEY REFERENCES invoices(id),
        calculated_amount DECIMAL(18,2) NOT NULL,
        paid_amount DECIMAL(18,2) DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE(),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class CommissionRecordsController : BaseApiController<CommissionRecord, CommissionRecordDto, CreateCommissionRecordDto, UpdateCommissionRecordDto>
    {
        private readonly ICommissionRecordService _commissionRecordService;

        public CommissionRecordsController(ICommissionRecordService commissionRecordService) : base(commissionRecordService)
        {
            _commissionRecordService = commissionRecordService;
        }
    }
}
