namespace khatoon_server_dotnet.Model.Interfaces
{


    namespace khatoon_server_dotnet.Model.Interfaces
    {
        public interface IHasId
        {
            public int Id { get;   }
        }
    }
    public interface IHasTimestamps
    {
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
    public interface ISoftDelete
    {
        public bool IsDeleted { get; set; }
    }
    public interface IHasVersion
    {
        public int Version { get; set; }
    }
}
