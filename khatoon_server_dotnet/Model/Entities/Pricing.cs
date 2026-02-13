using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("pricing")]
public class Pricing : IHasId
{
    [Key]
    public int Id { get; set; }

    public int? ProductId { get; set; }
    public Product? Product { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal Price { get; set; }

    public string Currency { get; set; } = "USD";

    public DateTime? ValidFrom { get; set; }
    public DateTime? ValidTo { get; set; }

    public string? Meta { get; set; } // JSONB

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}