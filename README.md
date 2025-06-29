# Plan–Fact Data Mart in SQL / Витрина данных «План–Факт» на SQL

---

## 🇬🇧 English

🔍 **Project Overview**  
This project demonstrates how to build a plan-vs-actual financial data mart using near-realistic extracts from 1C (Russian accounting system).  
Built on PostgreSQL, it includes two aggregation levels and document-level drilldown.

📁 **Project Structure**  
`/SQL-PlanFact-Vitrina/`  
│  
├── `data/`  
│   ├── `plan_budget.csv`          — Planned values  
│   ├── `fact_budget.csv`          — Actual values  
│  
├── `sql/`  
│   ├── `1_create_tables.sql`      — Table creation scripts  
│   ├── `2_create_views.sql`       — View definitions  
│   ├── `3_analysis_queries.sql`   — Sample analytical queries  
│  
├── `README.md`                    — Project description  

⚙️ **Components**  
**🗂️ Tables:**  
- `plan_budget` — planned expenses  
- `fact_budget` — actual expenses  
- `document_log` — document-level details (invoices, payments)

**🧩 Views:**  
- `plan_fact_vitrina` — plan-vs-actual by period, department, category  
- `plan_fact_totals_by_department` — summary by departments

**📈 Sample Analytics:**  
- Categories with variance >10%  
- Top deviations by department  
- Drilldown of variances to document level

🚀 **How to Use**  
1. Create tables:  
   `sql/1_create_tables.sql`  

2. Load CSV data into PostgreSQL (via COPY or DBeaver)  

3. Create views:  
   `sql/2_create_views.sql`  

4. Run analytics:  
   `sql/3_analysis_queries.sql`  

5. *(Optional)* Connect `plan_fact_vitrina` to Power BI for visualization  

🛠️ **Technologies Used**  
- PostgreSQL (12+)  
- Power BI Desktop  
- DBeaver  

👨‍💼 **Author**  
Evgeny Kharyanov  
[Power BI GitHub Portfolio](https://github.com/EvgenyPowerBI)

---

## 🇷🇺 Русский

🔍 **Описание проекта**  
Проект демонстрирует создание витрины данных для анализа плановых и фактических затрат по подразделениям и статьям на основе приближённых к реальным выгрузок из 1С.  
Используется PostgreSQL. Реализованы два уровня агрегации и детализация до уровня документов.

📁 **Структура проекта**  
`/SQL-PlanFact-Vitrina/`  
│  
├── `data/`  
│   ├── `plan_budget.csv`          — Плановые значения  
│   ├── `fact_budget.csv`          — Фактические значения  
│  
├── `sql/`  
│   ├── `1_create_tables.sql`      — Создание таблиц  
│   ├── `2_create_views.sql`       — Создание витрин  
│   ├── `3_analysis_queries.sql`   — Примеры аналитики  
│  
├── `README.md`                    — Описание проекта  

⚙️ **Состав проекта**  
**🗂️ Таблицы:**  
- `plan_budget` — плановые значения затрат  
- `fact_budget` — фактические значения затрат  
- `document_log` — детализация (документы, счета, платёжки)

**🧩 Представления (Views):**  
- `plan_fact_vitrina` — свод план–факт по периоду, отделу и статье  
- `plan_fact_totals_by_department` — агрегация по отделам

**📈 Примеры аналитики:**  
- Отклонения по статьям >10%  
- Топ-отклонения по отделам  
- Расшифровка документации по отклонениям

🚀 **Как использовать**  
1. Создайте таблицы:  
   `sql/1_create_tables.sql`  

2. Загрузите данные из CSV-файлов в PostgreSQL (через COPY или DBeaver)  

3. Создайте представления:  
   `sql/2_create_views.sql`  

4. Выполните аналитику:  
   `sql/3_analysis_queries.sql`  

5. *(Опционально)* подключите `plan_fact_vitrina` в Power BI для визуализации  

🛠️ **Используемые технологии**  
- PostgreSQL (12+)  
- Power BI Desktop  
- DBeaver (для работы с БД)  

👨‍💼 **Автор**  
Евгений Харьянов  
[GitHub портфолио Power BI](https://github.com/EvgenyPowerBI)

