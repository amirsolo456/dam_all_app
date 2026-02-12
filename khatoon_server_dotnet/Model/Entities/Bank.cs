using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("bank")]
public class Bank
{
    [Key]
    public int Id { get; set; }

    [Required]
    public string Name { get; set; } = string.Empty;

    public string? Bic { get; set; }
    public string? AccountNumber { get; set; }

    public string? Meta { get; set; } // JSONB

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
}