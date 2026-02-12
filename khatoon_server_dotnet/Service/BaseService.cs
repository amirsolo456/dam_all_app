using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using khatoon_server_dotnet.Data;

namespace khatoon_server_dotnet.Service;


public abstract class BaseService
{
    protected readonly KhatoonServerDbContext Context;

    protected BaseService(KhatoonServerDbContext context)
        => this.Context = context;

    public static bool IsEntityStateValid(object model)
    {
        var validationContext = new ValidationContext(model);
        var validationResults = new List<ValidationResult>();

        return Validator.TryValidateObject(model, validationContext, validationResults,
            true);
    }
}
