using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Mapping.Base;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("employees")]
public class Employee : IHasId
{
    [Key]
    public int Id { get; set; }  

    [Required]
    public string Name { get; set; } = string.Empty;

    public string? Role { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal? SalaryAmount { get; set; }

    public bool IsCommissioned { get; set; } = false;

    [Column(TypeName = "decimal(5,2)")] // درصد
    public decimal? CommissionPercent { get; set; }

    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;

    // Navigation
    public ICollection<Invoice>? SoldInvoices { get; set; }
    public ICollection<InvoiceLine>? SoldInvoiceLines { get; set; }
    public ICollection<SalaryPayment>? SalaryPayments { get; set; }
    public ICollection<CommissionRecord>? CommissionRecords { get; set; }
}