using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
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
