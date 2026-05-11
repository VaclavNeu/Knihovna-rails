Knihovna

CRUD aplikace v Ruby on Rails pro správu knihovny — knihy, členové a výpůjčky.

Technologie

- Ruby 3.4.9
- Rails 8.1.3
- MySQL

Modely

B kniha v katalogu (title, author, isbn, quantity, description)
MEMBER - registrovaný člen knihovny (name, email)
LOAN - výpůjčka knihy členem (start_date, end_date, returned_at)

Asociace:
- Book has_many Loans, has_many Members through Loans
- Member has_many Loans, has_many Books through Loans
- Loan belongs_to Book a Member

Funkce

- Plný CRUD pro Book (včetně edit/update)
- CRUD pro Member a Loan (bez edit)
- Validace ISBN-13 (formát + kontrolní číslice)
- Automatický výpočet dostupných výtisků
- Sledování stavu výpůjček (aktivní / po termínu / vrácená)
- Ochrana proti smazání knih a členů s aktivními výpůjčkami



