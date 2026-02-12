using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("sync_queue")]
public class SyncQueue : IHasId, IHasTimestamps
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; init; }

    // شمارنده ترتیبی - در صورت نیاز با Fluent API مقداردهی شود
    public int Seq { get; set; }

    [Required]
    [MaxLength(100)]
    public string EntityType { get; set; } = string.Empty;

    [Required]
    public int EntityId { get; set; }

    [Required]
    [MaxLength(50)]
    public string Operation { get; set; } = string.Empty; // INSERT, UPDATE, DELETE

    [Required]
    [Column(TypeName = "jsonb")]
    public string Payload { get; set; } = string.Empty; // دیتای کامل موجودیت به صورت JSON

    [Required]
    [MaxLength(50)]
    public string Status { get; set; } = "pending"; // pending, processing, done, failed

    public int RetryCount { get; set; } = 0;

    [MaxLength(500)]
    public string? ErrorMessage { get; set; }

    public bool IsDeleted { get; set; } = false;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}