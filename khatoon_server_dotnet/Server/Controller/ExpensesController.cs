using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE expenses (
        id INT IDENTITY(1,1) PRIMARY KEY,
        date DATETIME2 DEFAULT GETDATE(),
        category NVARCHAR(MAX) NOT NULL,
        amount DECIMAL(18,2) NOT NULL,
        notes NVARCHAR(MAX),
        related_invoice_id INT FOREIGN KEY REFERENCES invoices(id),
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE(),
        version INT DEFAULT 0,
        is_deleted BIT DEFAULT 0
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class ExpensesController : BaseApiController<Expense, ExpenseDto, CreateExpenseDto, UpdateExpenseDto>
    {
        private readonly IExpenseService _expenseService;

        public ExpensesController(IExpenseService expenseService) : base(expenseService)
        {
            _expenseService = expenseService;
        }
    }
}
