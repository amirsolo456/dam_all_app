using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE bank (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(MAX) NOT NULL,
        bic NVARCHAR(MAX),
        account_number NVARCHAR(MAX),
        meta NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class BanksController : BaseApiController<Bank, BankDto, CreateBankDto, UpdateBankDto>
    {
        private readonly IBankService _bankService;

        public BanksController(IBankService bankService) : base(bankService)
        {
            _bankService = bankService;
        }
    }
}
