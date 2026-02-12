using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("payment_allocations")]
public class PaymentAllocation
{
    [Key]
    public int Id { get; set; }

    [Required]
    public int PaymentId { get; set; }
    public Payment? Payment { get; set; }

    [Required]
    public int InvoiceId { get; set; }
    public Invoice? Invoice { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal AmountAllocated { get; set; }

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}