using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    /*
    CREATE TABLE users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username NVARCHAR(100) NOT NULL,
        password_hash NVARCHAR(256) NOT NULL,
        full_name NVARCHAR(100),
        mobile NVARCHAR(20),
        email NVARCHAR(100),
        is_active BIT DEFAULT 1,
        last_login_at DATETIME2,
        role NVARCHAR(50) DEFAULT 'User',
        permissions NVARCHAR(MAX),
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    */
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : BaseApiController<User, UserDto, CreateUserDto, UpdateUserDto>
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService) : base(userService)
        {
            _userService = userService;
        }
    }
}
