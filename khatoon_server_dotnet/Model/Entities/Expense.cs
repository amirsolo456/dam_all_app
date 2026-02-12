using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("expenses")]
public class Expense
{
    [Key]
    public int Id { get; set; }

    public DateTime Date { get; set; } = DateTime.UtcNow;

    [Required]
    public string Category { get; set; } = string.Empty;

    [Column(TypeName = "decimal(18,2)")]
    public decimal Amount { get; set; }

    public string? Notes { get; set; }

    public int? RelatedInvoiceId { get; set; }
    public Invoice? RelatedInvoice { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;
}