-- 2_create_views.sql
-- Создаём две витрины:
-- 1) plan_fact_vitrina: аггрегированный план-факт по периодам, отделам и статьям
-- 2) plan_fact_totals_by_department: сводка по отделам на втором уровне

-- Первая витрина: подробная план-факт таблица
CREATE OR REPLACE VIEW plan_fact_vitrina AS
WITH combined AS (
  SELECT
    COALESCE(p.period, f.period) AS period,
    COALESCE(p.department, f.department) AS department,
    COALESCE(p.article, f.article) AS article,
    COALESCE(p.plan_amount, 0) AS plan_amount,
    COALESCE(f.fact_amount, 0) AS fact_amount
  FROM plan_budget p
  FULL JOIN fact_budget f
    ON p.period = f.period
    AND p.department = f.department
    AND p.article = f.article
)
SELECT
  period,
  department,
  article,
  SUM(plan_amount) AS total_plan,
  SUM(fact_amount) AS total_fact,
  SUM(fact_amount) - SUM(plan_amount) AS deviation,
  ROUND(
    CASE
      WHEN SUM(plan_amount) = 0 THEN NULL
      ELSE (SUM(fact_amount) - SUM(plan_amount)) * 100.0 / SUM(plan_amount)
    END, 2
  ) AS deviation_percent
FROM combined
GROUP BY period, department, article;

-- Вторая витрина: итоги по отделам
CREATE OR REPLACE VIEW plan_fact_totals_by_department AS
SELECT
  department,
  SUM(total_plan) AS total_plan,
  SUM(total_fact) AS total_fact,
  SUM(total_fact) - SUM(total_plan) AS deviation,
  ROUND(
    CASE
      WHEN SUM(total_plan) = 0 THEN NULL
      ELSE (SUM(total_fact) - SUM(total_plan)) * 100.0 / SUM(total_plan)
    END, 2
  ) AS deviation_percent
FROM plan_fact_vitrina
GROUP BY department
ORDER BY department;
