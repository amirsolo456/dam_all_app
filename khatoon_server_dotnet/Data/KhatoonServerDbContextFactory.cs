using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace khatoon_server_dotnet.Data
{
    public class KhatoonServerDbContextFactory : IDesignTimeDbContextFactory<KhatoonServerDbContext>
    {
        public KhatoonServerDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<KhatoonServerDbContext>();
            optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=khatoon_db;Persist Security Info=True;User ID=sa;Password=456456;Trust Server Certificate=True");
            //optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=ResumeDb;Integrated Security=True;Trust Server Certificate=True");

            return new KhatoonServerDbContext(optionsBuilder.Options);
        }
    }
}
