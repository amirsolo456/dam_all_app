using AutoMapper;
using khatoon_server_dotnet.Model.DTOs;
using khatoon_server_dotnet.Model.Entities;
using Microsoft.Build.Framework;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace khatoon_server_dotnet.Model.Mapping;


using AutoMapper;



public class MappingProfiles : Profile
{
    public MappingProfiles()
    {
        // حالا فقط entity ها رو صدا می‌زنیم
        CreateCrudMap<Party, PartyDto, CreatePartyDto, UpdatePartyDto>();
        CreateCrudMap<Employee, EmployeeDto, CreateEmployeeDto, UpdateEmployeeDto>();
        CreateCrudMap<Product, ProductDto, CreateProductDto, UpdateProductDto>();
        CreateCrudMap<Invoice, InvoiceDto, CreateInvoiceDto, UpdateInvoiceDto>();
        CreateCrudMap<InvoiceLine, InvoiceLineDto, CreateInvoiceLineDto, UpdateInvoiceLineDto>();
        CreateCrudMap<Animal, AnimalDto, CreateAnimalDto, UpdateAnimalDto>();
        CreateCrudMap<Payment, PaymentDto, CreatePaymentDto, UpdatePaymentDto>();
        CreateCrudMap<PaymentAllocation, PaymentAllocationDto, CreatePaymentAllocationDto, UpdatePaymentAllocationDto>();
        CreateCrudMap<Expense, ExpenseDto, CreateExpenseDto, UpdateExpenseDto>();
        CreateCrudMap<AppSetting, AppSettingDto, CreateAppSettingDto, UpdateAppSettingDto>();
        CreateCrudMap<SalaryPayment, SalaryPaymentDto, CreateSalaryPaymentDto, UpdateSalaryPaymentDto>();
        CreateCrudMap<CommissionRecord, CommissionRecordDto, CreateCommissionRecordDto, UpdateCommissionRecordDto>();
        CreateCrudMap<Item, ItemDto, CreateItemDto, UpdateItemDto>();
        CreateCrudMap<SyncQueue, SyncQueueDto, CreateSyncQueueDto, UpdateSyncQueueDto>();
        CreateCrudMap<Tombstone, TombstoneDto, CreateTombstoneDto, CreateTombstoneDto>(); // Tombstone usually doesn't have update
        CreateCrudMap<Health, HealthDto, CreateHealthDto, UpdateHealthDto>();
        CreateCrudMap<Shipping, ShippingDto, CreateShippingDto, UpdateShippingDto>();
        CreateCrudMap<Warranty, WarrantyDto, CreateWarrantyDto, UpdateWarrantyDto>();
        CreateCrudMap<Pricing, PricingDto, CreatePricingDto, UpdatePricingDto>();
        CreateCrudMap<AppEnum, AppEnumDto, CreateAppEnumDto, UpdateAppEnumDto>();
        CreateCrudMap<Bank, BankDto, CreateBankDto, UpdateBankDto>();
        CreateCrudMap<AccountSetting, AccountSettingDto, CreateAccountSettingDto, UpdateAccountSettingDto>();
    }

    /// <summary>
    /// Generic CRUD mapper
    /// </summary>
    private void CreateCrudMap<TEntity, TDto, TCreateDto, TUpdateDto>() where TEntity : class
    {
        CreateMap<TEntity, TDto>();

        CreateMap<TCreateDto, TEntity>();

        CreateMap<TUpdateDto, TEntity>()
            .ForAllMembers(opts =>
                opts.Condition((src, dest, srcMember) => srcMember != null));
    }
}


/*    public MappingProfile()
    {
        // Party
        CreateMap<Party, PartyDto>().ReverseMap();
        CreateMap<CreatePartyDto, Party>();
        CreateMap<UpdatePartyDto, Party>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // Employee
        CreateMap<Employee, EmployeeDto>().ReverseMap();
        CreateMap<CreateEmployeeDto, Employee>();
        CreateMap<UpdateEmployeeDto, Employee>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // Product
        CreateMap<Product, ProductDto>().ReverseMap();
        CreateMap<CreateProductDto, Product>();
        CreateMap<UpdateProductDto, Product>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // Invoice
        CreateMap<Invoice, InvoiceDto>().ReverseMap();
        CreateMap<CreateInvoiceDto, Invoice>();
        CreateMap<UpdateInvoiceDto, Invoice>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // InvoiceLine
        CreateMap<InvoiceLine, InvoiceLineDto>().ReverseMap();
        CreateMap<CreateInvoiceLineDto, InvoiceLine>();
        CreateMap<UpdateInvoiceLineDto, InvoiceLine>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // Payment
        CreateMap<Payment, PaymentDto>().ReverseMap();
        CreateMap<CreatePaymentDto, Payment>();
        CreateMap<UpdatePaymentDto, Payment>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // PaymentAllocation
        CreateMap<PaymentAllocation, PaymentAllocationDto>().ReverseMap();
        CreateMap<CreatePaymentAllocationDto, PaymentAllocation>();
        CreateMap<UpdatePaymentAllocationDto, PaymentAllocation>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // Expense
        CreateMap<Expense, ExpenseDto>().ReverseMap();
        CreateMap<CreateExpenseDto, Expense>();
        CreateMap<UpdateExpenseDto, Expense>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // SalaryPayment
        CreateMap<SalaryPayment, SalaryPaymentDto>().ReverseMap();
        CreateMap<CreateSalaryPaymentDto, SalaryPayment>();
        CreateMap<UpdateSalaryPaymentDto, SalaryPayment>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // CommissionRecord
        CreateMap<CommissionRecord, CommissionRecordDto>().ReverseMap();
        CreateMap<CreateCommissionRecordDto, CommissionRecord>();
        CreateMap<UpdateCommissionRecordDto, CommissionRecord>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // Item
        CreateMap<Item, ItemDto>().ReverseMap();
        CreateMap<CreateItemDto, Item>();
        CreateMap<UpdateItemDto, Item>()
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        // SyncQueue
        CreateMap<SyncQueue, SyncQueueDto>().ReverseMap();
        CreateMap<CreateSyncQueueDto, SyncQueue>();
        // معمولاً آپدیت مستقیم برای SyncQueue نداریم

        // Tombstone
        CreateMap<Tombstone, TombstoneDto>().ReverseMap();
        CreateMap<CreateTombstoneDto, Tombstone>();

        // Health
        CreateMap<Health, HealthDto>().ReverseMap();
        CreateMap<CreateHealthDto, Health>();

        // Shipping
        CreateMap<Shipping, ShippingDto>().ReverseMap();
        CreateMap<CreateShippingDto, Shipping>();

        // Warranty
        CreateMap<Warranty, WarrantyDto>().ReverseMap();
        CreateMap<CreateWarrantyDto, Warranty>();

        // Pricing
        CreateMap<Pricing, PricingDto>().ReverseMap();
        CreateMap<CreatePricingDto, Pricing>();

        // AppEnum
        CreateMap<AppEnum, AppEnumDto>().ReverseMap();
        CreateMap<CreateAppEnumDto, AppEnum>();

        // Bank
        CreateMap<Bank, BankDto>().ReverseMap();
        CreateMap<CreateBankDto, Bank>();

        // AccountSetting
        CreateMap<AccountSetting, AccountSettingDto>().ReverseMap();
        CreateMap<CreateAccountSettingDto, AccountSetting>();

        // AppSetting
        CreateMap<AppSetting, AppSettingDto>().ReverseMap();
        CreateMap<CreateAppSettingDto, AppSetting>();
    }*/
