Knihovna

Jednoduchá CRUD aplikace v Ruby on Rails pro správu knihovny — knihy, členové a výpůjčky.
Do projektu jsem nepřidával autentizaci, protože mi přišlo, že už to nesplňuje jednoduchou CRUD aplikaci, pokud je to ale vyžadováno rád ho přidám.

Technologie

- Ruby 3.4.9
- Rails 8.1.3
- MySQL

Modely

BOOK - kniha v katalogu (title, author, isbn, quantity, description)
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
- Design byl tvořen AI (css,html)

## Spuštění

Je potřeba mít nainstalované Ruby, Rails a MySQL.

1. Je potřeba nainstalovat závislosti:
   
   bundle install
   

2. Je potřeba zkopírovat `.env.example` jako `.env` a vyplnit MySQL credentials:
   
   cp .env.example .env
 

3. Je potřeba vytvořit databázi a načíst vzorová data:
   
   rails db:prepare db:seed

4. Program je připravený ke spuštění

   rails s
   


   
