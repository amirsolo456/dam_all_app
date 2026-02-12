namespace khatoon_server_dotnet.Model.Mapping.Base
{
    public abstract class BaseEntityMapper
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
    }





}
