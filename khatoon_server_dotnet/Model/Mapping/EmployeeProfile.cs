/*using AutoMapper;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;

namespace khatoon_server_dotnet.Model.MappingProfiles
{
    public class EmployeeProfile : Profile
    {
        public EmployeeProfile()
        {
            // Entity -> Response
            CreateMap<Employee, EmployeeDto>();

            // CreateDto -> Entity (ignore Id, Version, timestamps)
            CreateMap<CreateEmployeeDto, Employee>()
                .ForMember(d => d.Id, opt => opt.Ignore())
                .ForMember(d => d.Version, opt => opt.Ignore())
                .ForMember(d => d.CreatedAt, opt => opt.Ignore())
                .ForMember(d => d.UpdatedAt, opt => opt.Ignore());

            // UpdateDto -> Entity (ignore immutable fields)
            CreateMap<UpdateEmployeeDto, Employee>()
                .ForMember(d => d.Id, opt => opt.Ignore())
                .ForMember(d => d.CreatedAt, opt => opt.Ignore());
        }
    }
}
*/