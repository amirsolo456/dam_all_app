using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("health")]
public class Health
{
    [Key]
    public int Id { get; set; }

    public int? PartyId { get; set; }
    public Party? Party { get; set; }

    public string? Notes { get; set; }

    public string? Meta { get; set; } // JSONB

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}