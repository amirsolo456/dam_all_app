using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE invoice_lines (
        id INT IDENTITY(1,1) PRIMARY KEY,
        invoice_id INT NOT NULL FOREIGN KEY REFERENCES invoices(id),
        product_id INT FOREIGN KEY REFERENCES products(id),
        description NVARCHAR(MAX),
        quantity DECIMAL(18,2) NOT NULL,
        unit_price DECIMAL(18,2) NOT NULL,
        line_total AS (quantity * unit_price) PERSISTED,
        party_id INT FOREIGN KEY REFERENCES parties(id),
        seller_employee_id INT FOREIGN KEY REFERENCES employees(id),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class InvoiceLinesController : BaseApiController<InvoiceLine, InvoiceLineDto, CreateInvoiceLineDto, UpdateInvoiceLineDto>
    {
        private readonly IInvoiceLineService _invoiceLineService;

        public InvoiceLinesController(IInvoiceLineService invoiceLineService) : base(invoiceLineService)
        {
            _invoiceLineService = invoiceLineService;
        }
    }
}
