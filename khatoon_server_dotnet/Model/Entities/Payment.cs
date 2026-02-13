using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("payments")]
public class Payment : IHasId
{
    [Key]
    public int Id { get; set; }

    public DateTime Date { get; set; } = DateTime.UtcNow;

    [Column(TypeName = "decimal(18,2)")]
    public decimal Amount { get; set; }

    [Required]
    public string Direction { get; set; } = string.Empty; // 'in' | 'out'

    public string? PaymentMethod { get; set; }

    public int? FromPartyId { get; set; }
    public Party? FromParty { get; set; }

    public int? ToPartyId { get; set; }
    public Party? ToParty { get; set; }

    public string? Reference { get; set; }
    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;

    // Navigation
    public ICollection<PaymentAllocation>? Allocations { get; set; }
}