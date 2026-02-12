using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("app_settings",Schema = "dbo")]
public class AppSetting : IHasId, IHasTimestamps
{
    [Key]
    public int Id { get; init; }

    [Required]
    public string tblKey { get; set; } = string.Empty;

    public string? Value { get; set; } // JSONB

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}