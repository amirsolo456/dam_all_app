using khatoon_server_dotnet.Data;
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Mapping;
using khatoon_server_dotnet.Server.Controller;
using khatoon_server_dotnet.Service;
using Microsoft.EntityFrameworkCore;

namespace khatoon_server_dotnet
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateSlimBuilder(args);

            builder.Services.AddControllers();
            builder.Services.AddOpenApiDocument();
            builder.Services.AddEndpointsApiExplorer();

            builder.Services.AddDbContext<KhatoonServerDbContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DatabaseConnection")));

            builder.Services.AddControllers()
    .AddApplicationPart(typeof(AppSettingsController).Assembly);

 

            builder.Services.AddAutoMapper(typeof(MappingProfiles));
            builder.Services.AddAutoMapper(typeof(Program));
            // Register services
            builder.Services.AddScoped<IPartyService, PartyService>();
            builder.Services.AddScoped<IEmployeeService, EmployeeService>();
            builder.Services.AddScoped<IProductService, ProductService>();
            builder.Services.AddScoped<IAppSettingService, AppSettingService>();

            var app = builder.Build();

            if (app.Environment.IsDevelopment())
            {
                app.UseOpenApi();
                //app.UseOpenApi(); // میدلور Swagger
                app.UseSwaggerUi();
                app.UseReDoc(options =>
                {
                    options.Path = "/redoc";
                });
            }
            app.MapGet("/check-globalization", () =>
    System.Globalization.CultureInfo.CurrentCulture.Name);
            app.MapControllers();
            app.Run();

        }
    }

}
