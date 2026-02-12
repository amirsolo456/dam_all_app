using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("invoice_lines")]
public class InvoiceLine
{
    [Key]
    public int Id { get; set; }

    [Required]
    public int InvoiceId { get; set; }
    public Invoice? Invoice { get; set; }

    public int? ProductId { get; set; }
    public Product? Product { get; set; }

    public int? PartyId { get; set; } // مستقیم به طرف
    public Party? Party { get; set; }

    public int? SellerEmployeeId { get; set; }
    public Employee? SellerEmployee { get; set; }

    public string? Description { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal Quantity { get; set; } = 1.0m;

    [Column(TypeName = "decimal(18,2)")]
    public decimal UnitPrice { get; set; } = 0.0m;

    [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
    public decimal LineTotal { get; private set; }

    public int Version { get; set; } = 0;
    public bool IsDeleted { get; set; } = false;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}