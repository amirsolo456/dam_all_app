using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE invoices (
        id INT IDENTITY(1,1) PRIMARY KEY,
        invoice_no NVARCHAR(MAX) NOT NULL,
        type NVARCHAR(MAX) NOT NULL,
        party_id INT FOREIGN KEY REFERENCES parties(id),
        seller_employee_id INT FOREIGN KEY REFERENCES employees(id),
        date DATETIME2 DEFAULT GETDATE(),
        total_amount DECIMAL(18,2) NOT NULL DEFAULT 0,
        status NVARCHAR(MAX) DEFAULT 'open',
        notes NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE(),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class InvoicesController : BaseApiController<Invoice, InvoiceDto, CreateInvoiceDto, UpdateInvoiceDto>
    {
        private readonly IInvoiceService _invoiceService;

        public InvoicesController(IInvoiceService invoiceService) : base(invoiceService)
        {
            _invoiceService = invoiceService;
        }
    }
}
