using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("animals")]
public class Animal : IHasId
{
    [Key]
    public int Id { get; set; }

    [Required]
    public string TagNumber { get; set; } = string.Empty;

    public string? Name { get; set; }

    [Required]
    public string Type { get; set; } = string.Empty; // Cow, Sheep, etc.

    public string? Breed { get; set; }

    [Required]
    public string Gender { get; set; } = string.Empty;

    public DateTime? BirthDate { get; set; }

    public DateTime? PurchaseDate { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal? PurchasePrice { get; set; }

    public string? PurchaseSource { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal? CurrentWeight { get; set; }

    public string? Color { get; set; }

    public string? HealthStatus { get; set; }

    public string? ReproductionStatus { get; set; }

    public string? Notes { get; set; }

    public int Version { get; set; } = 0;

    public bool IsDeleted { get; set; } = false;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}
