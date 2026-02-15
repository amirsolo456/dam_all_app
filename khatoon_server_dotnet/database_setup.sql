-- SQL Setup Script for Livestock Farm Management System
-- Database: Microsoft SQL Server

-- 1. Parties
CREATE TABLE parties (
    id INT IDENTITY(1,1) PRIMARY KEY,
    type NVARCHAR(MAX) NOT NULL DEFAULT 'customer',
    name NVARCHAR(MAX) NOT NULL,
    phone NVARCHAR(MAX),
    address NVARCHAR(MAX),
    notes NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 2. Employees
CREATE TABLE employees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(MAX) NOT NULL,
    role NVARCHAR(MAX),
    salary_amount DECIMAL(18,2),
    is_commissioned BIT DEFAULT 0,
    commission_percent DECIMAL(5,2),
    notes NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 3. Products
CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(MAX) NOT NULL,
    code NVARCHAR(MAX),
    description NVARCHAR(MAX),
    unit NVARCHAR(MAX),
    default_price DECIMAL(18,2),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 4. Animals
CREATE TABLE animals (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tag_number NVARCHAR(MAX) NOT NULL,
    name NVARCHAR(MAX),
    type NVARCHAR(MAX) NOT NULL,
    breed NVARCHAR(MAX),
    gender NVARCHAR(MAX) NOT NULL,
    birth_date DATETIME2,
    purchase_date DATETIME2,
    purchase_price DECIMAL(18,2),
    purchase_source NVARCHAR(MAX),
    current_weight DECIMAL(18,2),
    color NVARCHAR(MAX),
    health_status NVARCHAR(MAX),
    reproduction_status NVARCHAR(MAX),
    notes NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 5. Items
CREATE TABLE items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(512) NOT NULL,
    body NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 6. Users
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) NOT NULL,
    password_hash NVARCHAR(256) NOT NULL,
    full_name NVARCHAR(100),
    mobile NVARCHAR(20),
    email NVARCHAR(100),
    is_active BIT DEFAULT 1,
    last_login_at DATETIME2,
    role NVARCHAR(50) DEFAULT 'User',
    permissions NVARCHAR(MAX), -- Stored as JSON string
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 7. Roles
CREATE TABLE roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    description NVARCHAR(200),
    permissions NVARCHAR(MAX), -- Stored as JSON string
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 8. App Enum
CREATE TABLE app_enum (
    id INT IDENTITY(1,1) PRIMARY KEY,
    namespace NVARCHAR(MAX) NOT NULL,
    [key] NVARCHAR(MAX) NOT NULL,
    value NVARCHAR(MAX),
    meta NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 9. App Settings
CREATE TABLE app_settings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tblKey NVARCHAR(MAX) NOT NULL,
    value NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 10. Account Settings
CREATE TABLE account_settings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tblKey NVARCHAR(MAX) NOT NULL,
    value NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 11. Bank
CREATE TABLE bank (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(MAX) NOT NULL,
    bic NVARCHAR(MAX),
    account_number NVARCHAR(MAX),
    meta NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 12. Tombstones
CREATE TABLE tombstones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    entity_type NVARCHAR(MAX) NOT NULL,
    entity_id INT NOT NULL,
    deleted_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 13. Sync Queue
CREATE TABLE sync_queue (
    id INT IDENTITY(1,1) PRIMARY KEY,
    seq INT,
    entity_type NVARCHAR(100) NOT NULL,
    entity_id INT NOT NULL,
    operation NVARCHAR(50) NOT NULL,
    payload NVARCHAR(MAX) NOT NULL, -- JSON
    status NVARCHAR(50) DEFAULT 'pending',
    retry_count INT DEFAULT 0,
    error_message NVARCHAR(500),
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 14. Invoices
CREATE TABLE invoices (
    id INT IDENTITY(1,1) PRIMARY KEY,
    invoice_no NVARCHAR(MAX) NOT NULL,
    type NVARCHAR(MAX) NOT NULL,
    party_id INT FOREIGN KEY REFERENCES parties(id),
    seller_employee_id INT FOREIGN KEY REFERENCES employees(id),
    date DATETIME2 NOT NULL,
    total_amount DECIMAL(18,2) NOT NULL,
    status NVARCHAR(MAX) DEFAULT 'Open',
    notes NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 15. Invoice Lines
CREATE TABLE invoice_lines (
    id INT IDENTITY(1,1) PRIMARY KEY,
    invoice_id INT NOT NULL FOREIGN KEY REFERENCES invoices(id),
    product_id INT FOREIGN KEY REFERENCES products(id),
    description NVARCHAR(MAX),
    quantity DECIMAL(18,2) NOT NULL,
    unit_price DECIMAL(18,2) NOT NULL,
    line_total AS (quantity * unit_price) PERSISTED,
    party_id INT FOREIGN KEY REFERENCES parties(id),
    seller_employee_id INT FOREIGN KEY REFERENCES employees(id),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 16. Payments
CREATE TABLE payments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATETIME2 NOT NULL,
    amount DECIMAL(18,2) NOT NULL,
    direction NVARCHAR(MAX) NOT NULL, -- Inbound/Outbound
    payment_method NVARCHAR(MAX),
    from_party_id INT FOREIGN KEY REFERENCES parties(id),
    to_party_id INT FOREIGN KEY REFERENCES parties(id),
    reference NVARCHAR(MAX),
    notes NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 17. Payment Allocations
CREATE TABLE payment_allocations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    payment_id INT NOT NULL FOREIGN KEY REFERENCES payments(id),
    invoice_id INT NOT NULL FOREIGN KEY REFERENCES invoices(id),
    amount_allocated DECIMAL(18,2) NOT NULL,
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 18. Expenses
CREATE TABLE expenses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATETIME2 NOT NULL,
    category NVARCHAR(MAX) NOT NULL,
    amount DECIMAL(18,2) NOT NULL,
    notes NVARCHAR(MAX),
    related_invoice_id INT FOREIGN KEY REFERENCES invoices(id),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 19. Salary Payments
CREATE TABLE salary_payments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT NOT NULL FOREIGN KEY REFERENCES employees(id),
    period_start DATETIME2 NOT NULL,
    period_end DATETIME2 NOT NULL,
    amount_paid DECIMAL(18,2) NOT NULL,
    date_paid DATETIME2 DEFAULT GETUTCDATE(),
    notes NVARCHAR(MAX),
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 20. Commission Records
CREATE TABLE commission_records (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT NOT NULL FOREIGN KEY REFERENCES employees(id),
    invoice_id INT NOT NULL FOREIGN KEY REFERENCES invoices(id),
    calculated_amount DECIMAL(18,2) NOT NULL,
    paid_amount DECIMAL(18,2) DEFAULT 0,
    version INT DEFAULT 0,
    is_deleted BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT GETUTCDATE(),
    updated_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 21. Health Records
CREATE TABLE health (
    id INT IDENTITY(1,1) PRIMARY KEY,
    party_id INT FOREIGN KEY REFERENCES parties(id),
    notes NVARCHAR(MAX),
    meta NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 22. Shipping
CREATE TABLE shipping (
    id INT IDENTITY(1,1) PRIMARY KEY,
    invoice_id INT FOREIGN KEY REFERENCES invoices(id),
    carrier NVARCHAR(MAX),
    tracking_number NVARCHAR(MAX),
    status NVARCHAR(MAX),
    meta NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 23. Warranty
CREATE TABLE warranty (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT FOREIGN KEY REFERENCES products(id),
    party_id INT FOREIGN KEY REFERENCES parties(id),
    start_at DATETIME2,
    end_at DATETIME2,
    terms NVARCHAR(MAX),
    meta NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE()
);

-- 24. Pricing
CREATE TABLE pricing (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT FOREIGN KEY REFERENCES products(id),
    price DECIMAL(18,2) NOT NULL,
    currency NVARCHAR(MAX),
    valid_from DATETIME2,
    valid_to DATETIME2,
    meta NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETUTCDATE()
);

-- Indexes for performance
CREATE INDEX idx_invoices_party_id ON invoices(party_id);
CREATE INDEX idx_invoice_lines_invoice_id ON invoice_lines(invoice_id);
CREATE INDEX idx_payments_from_party_id ON payments(from_party_id);
CREATE INDEX idx_payments_to_party_id ON payments(to_party_id);
CREATE INDEX idx_payment_allocations_payment_id ON payment_allocations(payment_id);
CREATE INDEX idx_expenses_related_invoice_id ON expenses(related_invoice_id);
CREATE INDEX idx_salary_payments_employee_id ON salary_payments(employee_id);
CREATE INDEX idx_commission_records_employee_id ON commission_records(employee_id);
CREATE INDEX idx_sync_queue_seq ON sync_queue(seq);
CREATE INDEX idx_tombstones_entity_type ON tombstones(entity_type);
