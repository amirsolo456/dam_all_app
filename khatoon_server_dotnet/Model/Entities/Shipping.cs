using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("shipping")]
public class Shipping
{
    [Key]
    public int Id { get; set; }

    public int? InvoiceId { get; set; }
    public Invoice? Invoice { get; set; }

    public string? Carrier { get; set; }
    public string? TrackingNumber { get; set; }
    public string? Status { get; set; }

    public string? Meta { get; set; } // JSONB

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}