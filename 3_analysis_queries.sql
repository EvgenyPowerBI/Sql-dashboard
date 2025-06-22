-- 3_analysis_queries.sql
-- Несколько полезных запросов для анализа полученных витрин

-- 1. Топ-5 отделов с наибольшим процентом отклонения
SELECT *
FROM plan_fact_totals_by_department
ORDER BY deviation_percent DESC
LIMIT 5;

-- 2. Подробности отклонений по статьям и подразделениям
SELECT *
FROM plan_fact_vitrina
WHERE deviation_percent > 10
ORDER BY deviation_percent DESC;

-- 3. Расшифровка документов для отдела 'Логистика'
SELECT f.period, f.department, f.article, f.total_fact, d.doc_type, d.doc_sum, d.doc_comment
FROM plan_fact_vitrina f
JOIN document_log d
  ON f.period = d.period
 AND f.department = d.department
 AND f.article = d.article
WHERE f.department = 'Логистика'
ORDER BY f.period;
