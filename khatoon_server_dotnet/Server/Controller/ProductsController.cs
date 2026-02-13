using khatoon_server_dotnet.Controllers;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace khatoon_server_dotnet.Server.Controller
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : BaseApiController<Product, ProductDto, CreateProductDto, UpdateProductDto>
    {
        private readonly IProductService _productService;

        public ProductsController(IProductService productService) : base(productService)
        {
            _productService = productService;
        }
    }
}
