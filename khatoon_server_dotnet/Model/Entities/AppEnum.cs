using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("app_enum")]
public class AppEnum : IHasId
{
    [Key]
    public int Id { get; set; }

    [Required]
    public string Namespace { get; set; } = string.Empty;

    [Required]
    public string Key { get; set; } = string.Empty;

    public string? Value { get; set; }

    public string? Meta { get; set; } // JSONB

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}