using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("users")]
public class User : IHasId, IHasTimestamps
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; init; }

    [Required]
    [MaxLength(100)]
    public string Username { get; set; } = string.Empty;

    [Required]
    [MaxLength(256)]
    public string PasswordHash { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? FullName { get; set; }

    [MaxLength(20)]
    public string? Mobile { get; set; }

    [MaxLength(100)]
    public string? Email { get; set; }

    public bool IsActive { get; set; } = true;

    public DateTime? LastLoginAt { get; set; }

    [MaxLength(50)]
    public string? Role { get; set; } = "User";

    [Column(TypeName = "jsonb")]
    public string? Permissions { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}