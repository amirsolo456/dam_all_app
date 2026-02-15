using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("tombstones")]
public class Tombstone : IHasId
{
    [Key]
    public int Id { get; set; }

    [Required]
    public string EntityType { get; set; } = string.Empty;

    [Required]
    public int EntityId { get; set; }

    public DateTime DeletedAt { get; set; } = DateTime.UtcNow;
}