using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace khatoon_server_dotnet.Model.Entities;

[Table("account_settings")]
public class AccountSetting  
{
    [Key]
    public int Id { get; set; }

    public string? AccountId { get; set; }

    public string? Settings { get; set; } // JSONB

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}