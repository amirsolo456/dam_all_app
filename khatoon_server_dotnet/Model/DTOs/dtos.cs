// File: Dtos/AllDtos.cs
using khatoon_server_dotnet.Model.Interfaces;
using khatoon_server_dotnet.Model.Interfaces.khatoon_server_dotnet.Model.Interfaces;
using System;
using System.Collections.Generic;

namespace khatoon_server_dotnet.Model.DTOs
{
    //public record EmployeeDto(int Id, string Name, string? Role, float? SalaryAmount, bool IsCommissioned, float? CommissionPercent, string? Notes, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record ProductDto(int Id, string Name, string? Unit, float? DefaultPrice, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record InvoiceLineDto(int Id, int InvoiceId, int? ProductId, string? Description, float Quantity, float UnitPrice, float LineTotal, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record InvoiceDto(int Id, string InvoiceNo, string Type, int? PartyId, int? SellerEmployeeId, DateTime Date, float TotalAmount, string? Status, string? Notes, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt, IEnumerable<InvoiceLineDto>? Lines) : IHasId;

    //public record PaymentDto(int Id, DateTime Date, float Amount, string Direction, string? PaymentMethod, int? FromPartyId, int? ToPartyId, string? Reference, string? Notes, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record PaymentAllocationDto(int Id, int PaymentId, int InvoiceId, float Amount, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record ExpenseDto(int Id, DateTime Date, string Category, float Amount, string? Notes, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record SalaryPaymentDto(int Id, int EmployeeId, float Amount, DateTime Date, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record CommissionRecordDto(int Id, int EmployeeId, int InvoiceId, float CommissionAmount, DateTime Date, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record ItemDto(int Id, string Name, string? Description, float? Price, string? Sku, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record SyncQueueDto(int Id, string QueueName, string Payload, bool Processed, DateTime CreatedAt, DateTime? ProcessedAt, int Version) : IHasId;

    //public record TombstoneDto(int Id, string EntityName, int EntityId, DateTime DeletedAt, string? Reason, int Version) : IHasId;

    //public record HealthDto(int Id, string Status, DateTime CheckedAt, string? Details) : IHasId;

    //public record ShippingDto(int Id, int? InvoiceId, string Carrier, string? TrackingNumber, DateTime? ShippedAt, string? Status, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record WarrantyDto(int Id, int? ProductId, DateTime StartAt, DateTime? EndAt, string? Terms, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record PricingDto(int Id, int? ProductId, decimal Price, string? Currency, DateTime EffectiveFrom, DateTime? EffectiveTo, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record AppEnumDto(int Id, string Key, string Value, string? Group, int SortOrder, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record BankDto(int Id, string Name, string? Code, string? Swift, string? Country, int Version, bool IsDeleted, DateTime CreatedAt, DateTime UpdatedAt) : IHasId;

    //public record AccountSettingDto(int Id, string Key, string Value, DateTime UpdatedAt) : IHasId;

    //public record AppSettingDto(int Id, string Key, string? Value, DateTime UpdatedAt) : IHasId;


    public class EmployeeDto : IHasId
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public float? SalaryAmount { get; set; }
        public bool IsCommissioned { get; set; }
        public float? CommissionPercent { get; set; }
        public string? Role { get; set; }
        public string? Notes { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class ProductDto : IHasId
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Unit { get; set; }
        public float? DefaultPrice { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class InvoiceLineDto : IHasId
    {
        public int Id { get; set; }
        public int InvoiceId { get; set; }
        public int? ProductId { get; set; }
        public string? Description { get; set; }
        public float Quantity { get; set; }
        public float UnitPrice { get; set; }
        public float LineTotal { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class InvoiceDto : IHasId
    {
        public int Id { get; set; }
        public string InvoiceNo { get; set; } = string.Empty;
        public string Type { get; set; } = string.Empty;
        public int? PartyId { get; set; }
        public int? SellerEmployeeId { get; set; }
        public DateTime Date { get; set; }
        public float TotalAmount { get; set; }
        public string? Status { get; set; }
        public string? Notes { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public IEnumerable<InvoiceLineDto>? Lines { get; set; }
    }

    public class PaymentDto : IHasId
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public float Amount { get; set; }
        public string Direction { get; set; } = string.Empty;
        public string? PaymentMethod { get; set; }
        public int? FromPartyId { get; set; }
        public int? ToPartyId { get; set; }
        public string? Reference { get; set; }
        public string? Notes { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class PaymentAllocationDto : IHasId
    {
        public int Id { get; set; }
        public int PaymentId { get; set; }
        public int InvoiceId { get; set; }
        public float Amount { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class ExpenseDto : IHasId
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public string Category { get; set; } = string.Empty;
        public float Amount { get; set; }
        public string? Notes { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class SalaryPaymentDto : IHasId
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public float Amount { get; set; }
        public DateTime Date { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class CommissionRecordDto : IHasId
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int InvoiceId { get; set; }
        public float CommissionAmount { get; set; }
        public DateTime Date { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class ItemDto : IHasId
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public float? Price { get; set; }
        public string? Sku { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class SyncQueueDto : IHasId
    {
        public int Id { get; set; }
        public string QueueName { get; set; } = string.Empty;
        public string Payload { get; set; } = string.Empty;
        public bool Processed { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? ProcessedAt { get; set; }
        public int Version { get; set; }
    }

    public class TombstoneDto : IHasId
    {
        public int Id { get; set; }
        public string EntityName { get; set; } = string.Empty;
        public int EntityId { get; set; }
        public DateTime DeletedAt { get; set; }
        public string? Reason { get; set; }
        public int Version { get; set; }
    }

    public class HealthDto : IHasId
    {
        public int Id { get; set; }
        public string Status { get; set; } = string.Empty;
        public DateTime CheckedAt { get; set; }
        public string? Details { get; set; }
    }

    public class ShippingDto : IHasId
    {
        public int Id { get; set; }
        public int? InvoiceId { get; set; }
        public string Carrier { get; set; } = string.Empty;
        public string? TrackingNumber { get; set; }
        public DateTime? ShippedAt { get; set; }
        public string? Status { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class WarrantyDto : IHasId
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public DateTime StartAt { get; set; }
        public DateTime? EndAt { get; set; }
        public string? Terms { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class PricingDto : IHasId
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public decimal Price { get; set; }
        public string? Currency { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class AppEnumDto : IHasId
    {
        public int Id { get; set; }
        public string Key { get; set; } = string.Empty;
        public string Value { get; set; } = string.Empty;
        public string? Group { get; set; }
        public int SortOrder { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class BankDto : IHasId
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Code { get; set; }
        public string? Swift { get; set; }
        public string? Country { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class AccountSettingDto : IHasId
    {
        public int Id { get; set; }
        public string Key { get; set; } = string.Empty;
        public string Value { get; set; } = string.Empty;
        public DateTime UpdatedAt { get; set; }
    }

    public class AppSettingDto : IHasId
    {
        public int Id { get; set; }
        public string Key { get; set; } = string.Empty;
        public string? Value { get; set; }
        public DateTime UpdatedAt { get; set; }
    }


    // ================ Party ================
    // ================ Animal ================
    public class AnimalDto : IHasId
    {
        public int Id { get; set; }
        public string TagNumber { get; set; } = string.Empty;
        public string? Name { get; set; }
        public string Type { get; set; } = string.Empty;
        public string? Breed { get; set; }
        public string Gender { get; set; } = string.Empty;
        public DateTime? BirthDate { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public decimal? PurchasePrice { get; set; }
        public string? PurchaseSource { get; set; }
        public decimal? CurrentWeight { get; set; }
        public string? Color { get; set; }
        public string? HealthStatus { get; set; }
        public string? ReproductionStatus { get; set; }
        public string? Notes { get; set; }
        public int Version { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class CreateAnimalDto
    {
        public string TagNumber { get; set; } = string.Empty;
        public string? Name { get; set; }
        public string Type { get; set; } = string.Empty;
        public string? Breed { get; set; }
        public string Gender { get; set; } = string.Empty;
        public DateTime? BirthDate { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public decimal? PurchasePrice { get; set; }
        public string? PurchaseSource { get; set; }
        public decimal? CurrentWeight { get; set; }
        public string? Color { get; set; }
        public string? HealthStatus { get; set; }
        public string? ReproductionStatus { get; set; }
        public string? Notes { get; set; }
    }

    public class UpdateAnimalDto
    {
        public string? TagNumber { get; set; }
        public string? Name { get; set; }
        public string? Type { get; set; }
        public string? Breed { get; set; }
        public string? Gender { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public decimal? PurchasePrice { get; set; }
        public string? PurchaseSource { get; set; }
        public decimal? CurrentWeight { get; set; }
        public string? Color { get; set; }
        public string? HealthStatus { get; set; }
        public string? ReproductionStatus { get; set; }
        public string? Notes { get; set; }
    }

    public class PartyDto : IHasId
    {
        public int Id { get; set; }
        public string Type { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Notes { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }

    public class CreatePartyDto
    {
        public string Type { get; set; } = "customer";
        public string Name { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Notes { get; set; }
    }

    public class UpdatePartyDto
    {
        public string? Type { get; set; }
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Notes { get; set; }
    }

    // ================ Employee ================
    public class CreateEmployeeDto
    {
        public string Name { get; set; } = string.Empty;
        public string? Role { get; set; }
        public decimal? SalaryAmount { get; set; }
        public bool IsCommissioned { get; set; } = false;
        public decimal? CommissionPercent { get; set; }
        public string? Notes { get; set; }
    }

    public class UpdateEmployeeDto
    {
        public string? Name { get; set; }
        public string? Role { get; set; }
        public decimal? SalaryAmount { get; set; }
        public bool? IsCommissioned { get; set; }
        public decimal? CommissionPercent { get; set; }
        public string? Notes { get; set; }
    }

    // ================ Product ================
    public class CreateProductDto
    {
        public string Name { get; set; } = string.Empty;
        public string? Unit { get; set; }
        public decimal? DefaultPrice { get; set; }
    }

    public class UpdateProductDto
    {
        public string? Name { get; set; }
        public string? Unit { get; set; }
        public decimal? DefaultPrice { get; set; }
    }

    // ================ Invoice ================
    public class CreateInvoiceDto
    {
        public string InvoiceNo { get; set; } = string.Empty;
        public string Type { get; set; } = string.Empty;
        public int? PartyId { get; set; }
        public int? SellerEmployeeId { get; set; }
        public DateTime? Date { get; set; }
        public decimal? TotalAmount { get; set; }
        public string? Status { get; set; }
        public string? Notes { get; set; }
        public IEnumerable<CreateInvoiceLineDto>? Lines { get; set; }
    }

    public class UpdateInvoiceDto
    {
        public string? InvoiceNo { get; set; }
        public string? Type { get; set; }
        public int? PartyId { get; set; }
        public int? SellerEmployeeId { get; set; }
        public DateTime? Date { get; set; }
        public decimal? TotalAmount { get; set; }
        public string? Status { get; set; }
        public string? Notes { get; set; }
        public IEnumerable<UpdateInvoiceLineDto>? Lines { get; set; }
    }

    // ================ InvoiceLine ================
    public class CreateInvoiceLineDto
    {
        public int InvoiceId { get; set; }
        public int? ProductId { get; set; }
        public string? Description { get; set; }
        public decimal Quantity { get; set; } = 1.0m;
        public decimal UnitPrice { get; set; } = 0.0m;
    }

    public class UpdateInvoiceLineDto
    {
        public int? InvoiceId { get; set; }
        public int? ProductId { get; set; }
        public string? Description { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? UnitPrice { get; set; }
    }

    // ================ Payment ================
    public class CreatePaymentDto
    {
        public DateTime? Date { get; set; }
        public decimal Amount { get; set; }
        public string Direction { get; set; } = string.Empty;
        public string? PaymentMethod { get; set; }
        public int? FromPartyId { get; set; }
        public int? ToPartyId { get; set; }
        public string? Reference { get; set; }
        public string? Notes { get; set; }
    }

    public class UpdatePaymentDto
    {
        public DateTime? Date { get; set; }
        public decimal? Amount { get; set; }
        public string? Direction { get; set; }
        public string? PaymentMethod { get; set; }
        public int? FromPartyId { get; set; }
        public int? ToPartyId { get; set; }
        public string? Reference { get; set; }
        public string? Notes { get; set; }
    }

    // ================ PaymentAllocation ================
    public class CreatePaymentAllocationDto
    {
        public int PaymentId { get; set; }
        public int InvoiceId { get; set; }
        public decimal AmountAllocated { get; set; }
    }

    public class UpdatePaymentAllocationDto
    {
        public int? PaymentId { get; set; }
        public int? InvoiceId { get; set; }
        public decimal? AmountAllocated { get; set; }
    }

    // ================ Expense ================
    public class CreateExpenseDto
    {
        public DateTime? Date { get; set; }
        public string Category { get; set; } = string.Empty;
        public decimal Amount { get; set; }
        public string? Notes { get; set; }
        public int? RelatedInvoiceId { get; set; }
    }

    public class UpdateExpenseDto
    {
        public DateTime? Date { get; set; }
        public string? Category { get; set; }
        public decimal? Amount { get; set; }
        public string? Notes { get; set; }
        public int? RelatedInvoiceId { get; set; }
    }

    // ================ SalaryPayment ================
    public class CreateSalaryPaymentDto
    {
        public int EmployeeId { get; set; }
        public DateTime PeriodStart { get; set; }
        public DateTime PeriodEnd { get; set; }
        public decimal AmountPaid { get; set; }
        public DateTime? DatePaid { get; set; }
        public string? Notes { get; set; }
    }

    public class UpdateSalaryPaymentDto
    {
        public int? Id { get; set; }
        public int? EmployeeId { get; set; }
        public DateTime? PeriodStart { get; set; }
        public DateTime? PeriodEnd { get; set; }
        public decimal? AmountPaid { get; set; }
        public DateTime? DatePaid { get; set; }
        public string? Notes { get; set; }
    }

    // ================ CommissionRecord ================
    public class CreateCommissionRecordDto
    {
        public int EmployeeId { get; set; }
        public int InvoiceId { get; set; }
        public decimal CalculatedAmount { get; set; }
        public decimal PaidAmount { get; set; } = 0.0m;
    }

    public class UpdateCommissionRecordDto
    {
        public int? EmployeeId { get; set; }
        public int? InvoiceId { get; set; }
        public decimal? CalculatedAmount { get; set; }
        public decimal? PaidAmount { get; set; }
    }

    // ================ Item ================
    public class CreateItemDto
    {
        public string Title { get; set; } = string.Empty;
        public string? Body { get; set; }
    }

    public class UpdateItemDto
    {
        public string? Title { get; set; }
        public string? Body { get; set; }
    }

    // ================ SyncQueue ================
    public class CreateSyncQueueDto
    {
        public string EntityType { get; set; } = string.Empty;
        public int EntityId { get; set; }
        public string Operation { get; set; } = string.Empty;
        public string Payload { get; set; } = string.Empty;
        public string? Status { get; set; }
    }

    public class UpdateSyncQueueDto
    {
        public string? EntityType { get; set; }
        public int? EntityId { get; set; }
        public string? Operation { get; set; }
        public string? Payload { get; set; }
        public string? Status { get; set; }
    }

    // ================ Tombstone ================
    public class CreateTombstoneDto
    {
        public string EntityType { get; set; } = string.Empty;
        public int EntityId { get; set; }
        public DateTime? DeletedAt { get; set; }
    }

    // ================ Health ================
    public class CreateHealthDto
    {
        public int? PartyId { get; set; }
        public string? Notes { get; set; }
        public string? Meta { get; set; }
    }

    public class UpdateHealthDto
    {
        public int? PartyId { get; set; }
        public string? Notes { get; set; }
        public string? Meta { get; set; }
    }

    // ================ Shipping ================
    public class CreateShippingDto
    {
        public int? InvoiceId { get; set; }
        public string? Carrier { get; set; }
        public string? TrackingNumber { get; set; }
        public string? Status { get; set; }
        public string? Meta { get; set; }
    }

    public class UpdateShippingDto
    {
        public int? InvoiceId { get; set; }
        public string? Carrier { get; set; }
        public string? TrackingNumber { get; set; }
        public string? Status { get; set; }
        public string? Meta { get; set; }
    }

    // ================ Warranty ================
    public class CreateWarrantyDto
    {
        public int? ProductId { get; set; }
        public int? PartyId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string? Terms { get; set; }
        public string? Meta { get; set; }
    }

    public class UpdateWarrantyDto
    {
        public int? ProductId { get; set; }
        public int? PartyId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string? Terms { get; set; }
        public string? Meta { get; set; }
    }

    // ================ Pricing ================
    public class CreatePricingDto
    {
        public int? ProductId { get; set; }
        public decimal Price { get; set; }
        public string? Currency { get; set; }
        public DateTime? ValidFrom { get; set; }
        public DateTime? ValidTo { get; set; }
        public string? Meta { get; set; }
    }

    public class UpdatePricingDto
    {
        public int? ProductId { get; set; }
        public decimal? Price { get; set; }
        public string? Currency { get; set; }
        public DateTime? ValidFrom { get; set; }
        public DateTime? ValidTo { get; set; }
        public string? Meta { get; set; }
    }

    // ================ AppEnum ================
    public class CreateAppEnumDto
    {
        public string Namespace { get; set; } = string.Empty;
        public string Key { get; set; } = string.Empty;
        public string? Value { get; set; }
        public string? Meta { get; set; }
    }

    public class UpdateAppEnumDto
    {
        public string? Namespace { get; set; }
        public string? Key { get; set; }
        public string? Value { get; set; }
        public string? Meta { get; set; }
    }

    // ================ Bank ================
    public class CreateBankDto
    {
        public string Name { get; set; } = string.Empty;
        public string? Bic { get; set; }
        public string? AccountNumber { get; set; }
        public string? Meta { get; set; }
    }

    public class UpdateBankDto
    {
        public string? Name { get; set; }
        public string? Bic { get; set; }
        public string? AccountNumber { get; set; }
        public string? Meta { get; set; }
    }

    // ================ AccountSetting ================
    public class CreateAccountSettingDto
    {
        public string? AccountId { get; set; }
        public string? Settings { get; set; }
    }

    public class UpdateAccountSettingDto
    {
        public string? AccountId { get; set; }
        public string? Settings { get; set; }
    }

    // ================ AppSetting ================
    public class CreateAppSettingDto
    {
        public string Key { get; set; } = string.Empty;
        public string? Value { get; set; }
    }

    public class UpdateAppSettingDto
    {
        public string? Key { get; set; }
        public string? Value { get; set; }
    }
}
