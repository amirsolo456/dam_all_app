    using AutoMapper;
    using khatoon_server_dotnet.Data;
    using khatoon_server_dotnet.Model.DTOs;
    using khatoon_server_dotnet.Model.Entities;
    using khatoon_server_dotnet.Model.Interfaces;
    using khatoon_server_dotnet.Services.Implementations;
    using System;

    namespace khatoon_server_dotnet.Service
    {
        public class PartyService : Service<Party, PartyDto, CreatePartyDto, UpdatePartyDto>, IPartyService
        {
            public PartyService(KhatoonServerDbContext context, IMapper mapper) : base(context, mapper)
            {

            }

 
        }
    }
