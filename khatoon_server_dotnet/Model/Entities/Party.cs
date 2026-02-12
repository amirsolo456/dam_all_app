using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("parties")]
public class Party :IHasId
{
    [Key]
    public int Id { get; set; }  

    [Required]
    public string Type { get; set; } = "customer";

    [Required]
    public string Name { get; set; } = string.Empty;

    public string? Phone { get; set; }

    public int Version { get; set; } = 0;

    public bool IsDeleted { get; set; } = false;

    public string? Address { get; set; }

    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    // Navigation
    public ICollection<Invoice>? Invoices { get; set; }
    public ICollection<Payment>? PaymentsFrom { get; set; }
    public ICollection<Payment>? PaymentsTo { get; set; }
    public ICollection<InvoiceLine>? InvoiceLines { get; set; }
    public ICollection<Health>? HealthRecords { get; set; }
    public ICollection<Warranty>? Warranties { get; set; }
}