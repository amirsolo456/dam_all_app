using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;

namespace khatoon_server_dotnet.Model.Entities;

[Table("account_settings")]
public class AccountSetting : IHasId
{
    [Key]
    public int Id { get; set; }

    public string? AccountId { get; set; }

    public string? Settings { get; set; } // JSONB

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}