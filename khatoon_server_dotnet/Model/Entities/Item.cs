using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("items")]
public class Item
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(512)]
    public string Title { get; set; } = string.Empty;

    public string? Body { get; set; }

    public int Version { get; set; } = 0;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    public bool IsDeleted { get; set; } = false;
}