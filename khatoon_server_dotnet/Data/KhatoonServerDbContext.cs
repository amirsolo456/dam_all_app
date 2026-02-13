using khatoon_server_dotnet.Model;
using khatoon_server_dotnet.Model.Entities;
using khatoon_server_dotnet.Model.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.IO;

namespace khatoon_server_dotnet.Data
{
#pragma warning disable CS1591
    public class  KhatoonServerDbContext : DbContext
    {
        public KhatoonServerDbContext(DbContextOptions<KhatoonServerDbContext> options) : base(options) { }
        public DbSet<Party> Parties { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Animal> Animals { get; set; }
        public DbSet<Invoice> Invoices { get; set; }
        public DbSet<InvoiceLine> InvoiceLines { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<PaymentAllocation> PaymentAllocations { get; set; }
        public DbSet<Expense> Expenses { get; set; }
        public DbSet<SalaryPayment> SalaryPayments { get; set; }
        public DbSet<CommissionRecord> CommissionRecords { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<SyncQueue> SyncQueues { get; set; }
        public DbSet<Tombstone> Tombstones { get; set; }
        public DbSet<Health> HealthRecords { get; set; }
        public DbSet<Shipping> Shippings { get; set; }
        public DbSet<Warranty> Warranties { get; set; }
        public DbSet<Pricing> Pricings { get; set; }
        public DbSet<AppEnum> AppEnums { get; set; }
        public DbSet<Bank> Banks { get; set; }
        public DbSet<AccountSetting> AccountSettings { get; set; }
        public DbSet<AppSetting> AppSettings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // ---------- تنظیمات پیش‌فرض برای CreatedAt و UpdatedAt ----------
            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                var createdAt = entityType.FindProperty("CreatedAt");
                if (createdAt?.ClrType == typeof(DateTime))
                    createdAt.SetDefaultValueSql("NOW()");

                var updatedAt = entityType.FindProperty("UpdatedAt");
                if (updatedAt?.ClrType == typeof(DateTime))
                    updatedAt.SetDefaultValueSql("NOW()");
            }

            // ---------- Soft Delete Global Filter ----------
            modelBuilder.Entity<Party>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Employee>().HasQueryFilter(e => !e.IsDeleted);
            modelBuilder.Entity<Product>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Animal>().HasQueryFilter(a => !a.IsDeleted);
            modelBuilder.Entity<Invoice>().HasQueryFilter(i => !i.IsDeleted);
            modelBuilder.Entity<InvoiceLine>().HasQueryFilter(il => !il.IsDeleted);
            modelBuilder.Entity<Payment>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<PaymentAllocation>().HasQueryFilter(pa => !pa.IsDeleted);
            modelBuilder.Entity<Expense>().HasQueryFilter(e => !e.IsDeleted);
            modelBuilder.Entity<SalaryPayment>().HasQueryFilter(sp => !sp.IsDeleted);
            modelBuilder.Entity<CommissionRecord>().HasQueryFilter(cr => !cr.IsDeleted);
            modelBuilder.Entity<Item>().HasQueryFilter(i => !i.IsDeleted);
            modelBuilder.Entity<SyncQueue>().HasQueryFilter(sq => !sq.IsDeleted);
            // Tombstone بدون IsDeleted است
            // سایر موجودیت‌ها (Health,Shipping,Warranty,Pricing,AppEnum,Bank,AccountSetting,AppSetting) IsDeleted ندارند

            // ---------- ایندکس‌ها (طبق SQL شما) ----------
            modelBuilder.Entity<Invoice>().HasIndex(i => i.PartyId).HasDatabaseName("idx_invoices_party_id");
            modelBuilder.Entity<InvoiceLine>().HasIndex(il => il.InvoiceId).HasDatabaseName("idx_invoice_lines_invoice_id");
            modelBuilder.Entity<Payment>().HasIndex(p => p.FromPartyId).HasDatabaseName("idx_payments_from_party_id");
            modelBuilder.Entity<Payment>().HasIndex(p => p.ToPartyId).HasDatabaseName("idx_payments_to_party_id");
            modelBuilder.Entity<PaymentAllocation>().HasIndex(pa => pa.PaymentId).HasDatabaseName("idx_payment_allocations_payment_id");
            modelBuilder.Entity<PaymentAllocation>().HasIndex(pa => pa.InvoiceId).HasDatabaseName("idx_payment_allocations_invoice_id");
            modelBuilder.Entity<Expense>().HasIndex(e => e.RelatedInvoiceId).HasDatabaseName("idx_expenses_related_invoice_id");
            modelBuilder.Entity<SalaryPayment>().HasIndex(sp => sp.EmployeeId).HasDatabaseName("idx_salary_payments_employee_id");
            modelBuilder.Entity<CommissionRecord>().HasIndex(cr => cr.EmployeeId).HasDatabaseName("idx_commission_records_employee_id");
            modelBuilder.Entity<CommissionRecord>().HasIndex(cr => cr.InvoiceId).HasDatabaseName("idx_commission_records_invoice_id");
            modelBuilder.Entity<SyncQueue>().HasIndex(sq => sq.Seq).HasDatabaseName("idx_sync_queue_seq");
            modelBuilder.Entity<Tombstone>().HasIndex(t => t.EntityType).HasDatabaseName("idx_tombstones_entity_type");

            // ---------- فیلد محاسبه شده (Stored Computed Column) ----------
            modelBuilder.Entity<InvoiceLine>()
                .Property(il => il.LineTotal)
                .HasComputedColumnSql("quantity * unit_price", stored: true);

            // ---------- تنظیم Decimal برای قیمت‌ها ----------
            modelBuilder.Entity<Product>()
                .Property(p => p.DefaultPrice)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<InvoiceLine>()
                .Property(il => il.UnitPrice)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<Payment>()
                .Property(p => p.Amount)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<Expense>()
                .Property(e => e.Amount)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<SalaryPayment>()
                .Property(sp => sp.AmountPaid)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<CommissionRecord>()
                .Property(cr => cr.CalculatedAmount)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<CommissionRecord>()
                .Property(cr => cr.PaidAmount)
                .HasColumnType("decimal(18,2)");
            modelBuilder.Entity<Pricing>()
                .Property(p => p.Price)
                .HasColumnType("decimal(18,2)");

            // ---------- روابط (Relationships) ----------
            // Party -> Invoices
            modelBuilder.Entity<Invoice>()
                .HasOne(i => i.Party)
                .WithMany(p => p.Invoices)
                .HasForeignKey(i => i.PartyId)
                .OnDelete(DeleteBehavior.SetNull);

            // Employee -> Invoices (seller)
            modelBuilder.Entity<Invoice>()
                .HasOne(i => i.SellerEmployee)
                .WithMany(e => e.SoldInvoices)
                .HasForeignKey(i => i.SellerEmployeeId)
                .OnDelete(DeleteBehavior.SetNull);

            // Invoice -> InvoiceLines
            modelBuilder.Entity<InvoiceLine>()
                .HasOne(il => il.Invoice)
                .WithMany(i => i.InvoiceLines)
                .HasForeignKey(il => il.InvoiceId)
                .OnDelete(DeleteBehavior.Cascade);

            // Product -> InvoiceLine
            modelBuilder.Entity<InvoiceLine>()
                .HasOne(il => il.Product)
                .WithMany(p => p.InvoiceLines)
                .HasForeignKey(il => il.ProductId)
                .OnDelete(DeleteBehavior.SetNull);

            // Party -> InvoiceLine (optional direct relation)
            modelBuilder.Entity<InvoiceLine>()
                .HasOne(il => il.Party)
                .WithMany(p => p.InvoiceLines)
                .HasForeignKey(il => il.PartyId)
                .OnDelete(DeleteBehavior.SetNull);

            // Employee -> InvoiceLine (optional seller)
            modelBuilder.Entity<InvoiceLine>()
                .HasOne(il => il.SellerEmployee)
                .WithMany(e => e.SoldInvoiceLines)
                .HasForeignKey(il => il.SellerEmployeeId)
                .OnDelete(DeleteBehavior.SetNull);

            // Payment -> FromParty
            modelBuilder.Entity<Payment>()
                .HasOne(p => p.FromParty)
                .WithMany(pa => pa.PaymentsFrom)
                .HasForeignKey(p => p.FromPartyId)
                .OnDelete(DeleteBehavior.SetNull);

            // Payment -> ToParty
            modelBuilder.Entity<Payment>()
                .HasOne(p => p.ToParty)
                .WithMany(pa => pa.PaymentsTo)
                .HasForeignKey(p => p.ToPartyId)
                .OnDelete(DeleteBehavior.SetNull);

            // PaymentAllocation -> Payment
            modelBuilder.Entity<PaymentAllocation>()
                .HasOne(pa => pa.Payment)
                .WithMany(p => p.Allocations)
                .HasForeignKey(pa => pa.PaymentId)
                .OnDelete(DeleteBehavior.Cascade);

            // PaymentAllocation -> Invoice
            modelBuilder.Entity<PaymentAllocation>()
                .HasOne(pa => pa.Invoice)
                .WithMany(i => i.PaymentAllocations)
                .HasForeignKey(pa => pa.InvoiceId)
                .OnDelete(DeleteBehavior.Cascade);

            // Expense -> RelatedInvoice
            modelBuilder.Entity<Expense>()
                .HasOne(e => e.RelatedInvoice)
                .WithMany(i => i.Expenses)
                .HasForeignKey(e => e.RelatedInvoiceId)
                .OnDelete(DeleteBehavior.SetNull);

            // SalaryPayment -> Employee
            modelBuilder.Entity<SalaryPayment>()
                .HasOne(sp => sp.Employee)
                .WithMany(e => e.SalaryPayments)
                .HasForeignKey(sp => sp.EmployeeId)
                .OnDelete(DeleteBehavior.Cascade);

            // CommissionRecord -> Employee
            modelBuilder.Entity<CommissionRecord>()
                .HasOne(cr => cr.Employee)
                .WithMany(e => e.CommissionRecords)
                .HasForeignKey(cr => cr.EmployeeId)
                .OnDelete(DeleteBehavior.Cascade);

            // CommissionRecord -> Invoice
            modelBuilder.Entity<CommissionRecord>()
                .HasOne(cr => cr.Invoice)
                .WithMany(i => i.CommissionRecords)
                .HasForeignKey(cr => cr.InvoiceId)
                .OnDelete(DeleteBehavior.Cascade);

            // Health -> Party
            modelBuilder.Entity<Health>()
                .HasOne(h => h.Party)
                .WithMany(p => p.HealthRecords)
                .HasForeignKey(h => h.PartyId)
                .OnDelete(DeleteBehavior.SetNull);

            // Shipping -> Invoice
            modelBuilder.Entity<Shipping>()
                .HasOne(s => s.Invoice)
                .WithMany(i => i.Shippings)
                .HasForeignKey(s => s.InvoiceId)
                .OnDelete(DeleteBehavior.SetNull);

            // Warranty -> Product
            modelBuilder.Entity<Warranty>()
                .HasOne(w => w.Product)
                .WithMany(p => p.Warranties)
                .HasForeignKey(w => w.ProductId)
                .OnDelete(DeleteBehavior.SetNull);

            // Warranty -> Party
            modelBuilder.Entity<Warranty>()
                .HasOne(w => w.Party)
                .WithMany(p => p.Warranties)
                .HasForeignKey(w => w.PartyId)
                .OnDelete(DeleteBehavior.SetNull);

            // Pricing -> Product
            modelBuilder.Entity<Pricing>()
                .HasOne(p => p.Product)
                .WithMany(pr => pr.Pricings)
                .HasForeignKey(p => p.ProductId)
                .OnDelete(DeleteBehavior.SetNull);
        }

        // داخل KhatoonServerDbContext.cs
        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {
            var entries = ChangeTracker.Entries<IHasTimestamps>();
            foreach (var entry in entries)
            {
                if (entry.State == EntityState.Modified)
                {
                    entry.Entity.UpdatedAt = DateTime.UtcNow;
                }
                else if (entry.State == EntityState.Added)
                {
                    entry.Entity.CreatedAt = DateTime.UtcNow;
                    entry.Entity.UpdatedAt = DateTime.UtcNow;
                }
            }
            return base.SaveChangesAsync(cancellationToken);
        }
    }
#pragma warning restore CS1591
}
