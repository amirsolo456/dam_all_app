using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("products")]
public class Product : IHasId
{
    [Key]
    public int Id { get; set; }   

    [Required]
    public string Name { get; set; } = string.Empty;

    public string? Unit { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal? DefaultPrice { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;

    // Navigation
    public ICollection<InvoiceLine>? InvoiceLines { get; set; }
    public ICollection<Warranty>? Warranties { get; set; }
    public ICollection<Pricing>? Pricings { get; set; }
}