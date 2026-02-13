using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("commission_records")]
public class CommissionRecord : IHasId
{
    [Key]
    public int Id { get; set; }

    [Required]
    public int EmployeeId { get; set; }
    public Employee? Employee { get; set; }

    [Required]
    public int InvoiceId { get; set; }
    public Invoice? Invoice { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal CalculatedAmount { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal PaidAmount { get; set; } = 0;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;
}