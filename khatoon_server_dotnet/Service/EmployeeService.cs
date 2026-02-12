using AutoMapper;
using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Services.Implementations;
using Microsoft.EntityFrameworkCore;
using System;

namespace khatoon_server_dotnet.Service
{
    public class EmployeeService : Service<Employee, EmployeeDto, CreateEmployeeDto, UpdateEmployeeDto>, IEmployeeService
    {

        
        public EmployeeService(KhatoonServerDbContext context, IMapper mapper) : base(context, mapper)
        {

        }


    }
}
