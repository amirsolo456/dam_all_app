-- Create schema if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Parties Table
CREATE TABLE IF NOT EXISTS parties (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    type TEXT NOT NULL DEFAULT 'customer',
    name TEXT NOT NULL,
    phone TEXT,
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    address TEXT,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Employees Table
CREATE TABLE IF NOT EXISTS employees (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    role TEXT,
    salary_amount DOUBLE PRECISION,
    is_commissioned BOOLEAN NOT NULL DEFAULT FALSE,
    commission_percent DOUBLE PRECISION,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- Products Table
-- Products
CREATE TABLE IF NOT EXISTS products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    unit TEXT,
    default_price DOUBLE PRECISION,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- Invoices Table
CREATE TABLE IF NOT EXISTS invoices (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    invoice_no TEXT NOT NULL,
    type TEXT NOT NULL,
    party_id UUID REFERENCES parties(id) ON DELETE SET NULL,
    seller_employee_id UUID REFERENCES employees(id) ON DELETE SET NULL,
    date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    total_amount DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    status TEXT NOT NULL DEFAULT 'open',
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- InvoiceLines Table
CREATE TABLE IF NOT EXISTS invoice_lines (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    invoice_id UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id) ON DELETE SET NULL,
    party_id UUID REFERENCES parties(id) ON DELETE SET NULL,
    seller_employee_id UUID REFERENCES employees(id) ON DELETE SET NULL,
    description TEXT,
    quantity DOUBLE PRECISION NOT NULL DEFAULT 1.0,
    unit_price DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    line_total DOUBLE PRECISION GENERATED ALWAYS AS (quantity * unit_price) STORED,
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Payments Table
CREATE TABLE IF NOT EXISTS payments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    amount DOUBLE PRECISION NOT NULL,
    direction TEXT NOT NULL,          -- 'in' | 'out'
    payment_method TEXT,
    from_party_id UUID REFERENCES parties(id) ON DELETE SET NULL,
    to_party_id UUID REFERENCES parties(id) ON DELETE SET NULL,
    reference TEXT,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- PaymentAllocations Table
CREATE TABLE IF NOT EXISTS payment_allocations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    payment_id UUID NOT NULL REFERENCES payments(id) ON DELETE CASCADE,
    invoice_id UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
    amount_allocated DOUBLE PRECISION NOT NULL,
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
-- Expenses Table
CREATE TABLE public.expenses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    category TEXT NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    notes TEXT,
    related_invoice_id UUID REFERENCES public.invoices(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- SalaryPayments Table
CREATE TABLE public.salary_payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    employee_id UUID NOT NULL REFERENCES public.employees(id) ON DELETE CASCADE,
    period_start TIMESTAMP WITH TIME ZONE NOT NULL,
    period_end TIMESTAMP WITH TIME ZONE NOT NULL,
    amount_paid DOUBLE PRECISION NOT NULL,
    date_paid TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS health (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  party_id UUID REFERENCES party(id),
  notes TEXT,
  meta JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- shipping
CREATE TABLE IF NOT EXISTS shipping (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id UUID REFERENCES invoice(id),
  carrier TEXT,
  tracking_number TEXT,
  status TEXT,
  meta JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- warranty
CREATE TABLE IF NOT EXISTS warranty (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID REFERENCES product(id),
  party_id UUID REFERENCES party(id),
  start_date DATE,
  end_date DATE,
  terms TEXT,
  meta JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- pricing (could be discounts, tiers)
CREATE TABLE IF NOT EXISTS pricing (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID REFERENCES product(id) ON DELETE SET NULL,
  price NUMERIC(12,2) NOT NULL,
  currency TEXT DEFAULT 'USD',
  valid_from TIMESTAMPTZ,
  valid_to TIMESTAMPTZ,
  meta JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS app_enum (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  namespace TEXT NOT NULL,
  key TEXT NOT NULL,
  value TEXT,
  meta JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- bank
CREATE TABLE IF NOT EXISTS bank (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  bic TEXT,
  account_number TEXT,
  meta JSONB,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ
);


-- settings
CREATE TABLE IF NOT EXISTS account_settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id TEXT,
  settings JSONB,
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS app_settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  key TEXT UNIQUE,
  value JSONB,
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- CommissionRecords Table
CREATE TABLE public.commission_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    employee_id UUID NOT NULL REFERENCES public.employees(id) ON DELETE CASCADE,
    invoice_id UUID NOT NULL REFERENCES public.invoices(id) ON DELETE CASCADE,
    calculated_amount DOUBLE PRECISION NOT NULL,
    paid_amount DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- Items Table
CREATE TABLE public.items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(512) NOT NULL,
    body TEXT,
    version INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

-- SyncQueue Table
CREATE TABLE public.sync_queue (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    seq SERIAL NOT NULL,
    entity_type TEXT NOT NULL,
    entity_id UUID NOT NULL,
    operation VARCHAR(50) NOT NULL,
    payload JSONB NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    version INTEGER NOT NULL DEFAULT 0,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tombstones Table
CREATE TABLE public.tombstones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entity_type TEXT NOT NULL,
    entity_id UUID NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance (optional, add as needed)
CREATE INDEX idx_invoices_party_id ON public.invoices(party_id);
CREATE INDEX idx_invoice_lines_invoice_id ON public.invoice_lines(invoice_id);
CREATE INDEX idx_payments_from_party_id ON public.payments(from_party_id);
CREATE INDEX idx_payments_to_party_id ON public.payments(to_party_id);
CREATE INDEX idx_payment_allocations_payment_id ON public.payment_allocations(payment_id);
CREATE INDEX idx_payment_allocations_invoice_id ON public.payment_allocations(invoice_id);
CREATE INDEX idx_expenses_related_invoice_id ON public.expenses(related_invoice_id);
CREATE INDEX idx_salary_payments_employee_id ON public.salary_payments(employee_id);
CREATE INDEX idx_commission_records_employee_id ON public.commission_records(employee_id);
CREATE INDEX idx_commission_records_invoice_id ON public.commission_records(invoice_id);
CREATE INDEX idx_sync_queue_seq ON public.sync_queue(seq);
CREATE INDEX idx_tombstones_entity_type ON public.tombstones(entity_type);

--EXECUTE format('
--DO $$
--BEGIN
--   IF NOT EXISTS (
--      SELECT 1 FROM pg_trigger WHERE tgname = %L
--   ) THEN
--      CREATE TRIGGER update_%s_updated_at
--      BEFORE UPDATE ON %s
--      FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
--   END IF;
--END $$;
--', 'update_'||tbl||'_updated_at', tbl, tbl);


CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$ language 'plpgsql';

-- اعمال trigger به جداول مهم
DO $$
DECLARE
    tbl TEXT;
BEGIN
    FOREACH tbl IN ARRAY ARRAY['parties','employees','products','invoices','invoice_lines','payments','expenses','commission_records','items','sync_queue']
    LOOP
        EXECUTE format('
            CREATE TRIGGER update_%s_updated_at
            BEFORE UPDATE ON %s
            FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
        ', tbl, tbl);
    END LOOP;
END $$;