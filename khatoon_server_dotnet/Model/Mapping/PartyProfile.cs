/*using AutoMapper;
using Humanizer;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using Microsoft.EntityFrameworkCore;

namespace khatoon_server_dotnet.Model.MappingProfiles;


public class PartyProfile : Profile
{
    public PartyProfile()
    {
        var party = _dbContext.Parties.Find(id);
        return _mapper.PartyToPartyDto(party);   // ← مثل AutoMapper

        CreateMap<Party, PartyDto>().ReverseMap();
        CreateMap<CreatePartyDto, Party>();
        CreateMap<UpdatePartyDto, Party>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        var party = _dbContext.Parties.Find(id);
        _mapper.UpdatePartyDtoToExistingParty(dto, party); // ← به‌روزرسانی مستقیم
        _dbContext.SaveChanges();
    }
}
*/