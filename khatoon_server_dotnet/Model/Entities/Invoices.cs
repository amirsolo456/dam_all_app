using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("invoices",Schema = "dbo")]
public class Invoice : IHasId, IHasTimestamps , IHasVersion , ISoftDelete
{
    [Key]
    public int Id { get; set; }

    [Required]
    public string InvoiceNo { get; set; } = string.Empty;

    [Required]
    public string Type { get; set; } = string.Empty;

    public int? PartyId { get; set; }
    public Party? Party { get; set; }

    public int? SellerEmployeeId { get; set; }
    public Employee? SellerEmployee { get; set; }

    public DateTime Date { get; set; } = DateTime.UtcNow;

    [Column(TypeName = "decimal(18,2)")]
    public decimal TotalAmount { get; set; } = 0;

    public string Status { get; set; } = "open";

    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;

    // Navigation
    public ICollection<InvoiceLine>? InvoiceLines { get; set; }
    public ICollection<PaymentAllocation>? PaymentAllocations { get; set; }
    public ICollection<Expense>? Expenses { get; set; }
    public ICollection<CommissionRecord>? CommissionRecords { get; set; }
    public ICollection<Shipping>? Shippings { get; set; }
}