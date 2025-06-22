-- 1_create_tables.sql
-- Создаём структуру таблиц для витрины "План–Факт" и детализации документов

-- Плановые значения (имитация выгрузки из 1С)
CREATE TABLE plan_budget (
  period TEXT,           -- Период, например '2024-01'
  department TEXT,       -- Подразделение или ЦФО
  article TEXT,          -- Статья затрат
  plan_amount NUMERIC    -- Сумма плановых затрат
);

-- Фактические значения (имитация выгрузки из 1С)
CREATE TABLE fact_budget (
  period TEXT,           -- Период
  department TEXT,       -- Подразделение
  article TEXT,          -- Статья затрат
  fact_amount NUMERIC    -- Сумма фактических затрат
);

-- Детализация документов (транзакции из 1С)
CREATE TABLE document_log (
  doc_id SERIAL PRIMARY KEY,  -- Уникальный ID документа
  period TEXT,                -- Период документа
  department TEXT,            -- Подразделение
  article TEXT,               -- Статья затрат
  doc_type TEXT,              -- Тип документа, например 'Платёжка'
  doc_sum NUMERIC,            -- Сумма по документу
  doc_comment TEXT            -- Комментарий или описание документа
);
