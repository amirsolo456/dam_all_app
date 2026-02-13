using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
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
