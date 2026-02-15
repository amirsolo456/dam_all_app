using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("warranty")]
public class Warranty : IHasId
{
    [Key]
    public int Id { get; set; }

    public int? ProductId { get; set; }
    public Product? Product { get; set; }

    public int? PartyId { get; set; }
    public Party? Party { get; set; }

    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }

    public string? Terms { get; set; }

    public string? Meta { get; set; } // JSONB

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}