using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("salary_payments")]
public class SalaryPayment : IHasId
{
    [Key]
    public int Id { get; set; }

    [Required]
    public int EmployeeId { get; set; }
    public Employee? Employee { get; set; }

    public DateTime PeriodStart { get; set; }
    public DateTime PeriodEnd { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal AmountPaid { get; set; }

    public DateTime DatePaid { get; set; } = DateTime.UtcNow;

    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;
}