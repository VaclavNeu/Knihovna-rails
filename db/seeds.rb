
puts "Mažu existující data..."
Loan.destroy_all
Member.destroy_all
Book.destroy_all


puts "Vytvářím knihy..."

books = [
  {
    title: "1984",
    author: "George Orwell",
    isbn: "9780451524935",
    quantity: 5,
    description: "Antiutopický román o totalitním státu Oceánie, kde vláda Velkého bratra kontroluje každý aspekt života občanů.\n\nHlavní hrdina Winston Smith pracuje v Ministerstvu pravdy a v skrytu se začíná bouřit proti systému."
  },
  {
    title: "Harry Potter a Kámen mudrců",
    author: "J. K. Rowling",
    isbn: "9788000061917",
    quantity: 8,
    description: "Příběh mladého kouzelníka Harryho Pottera, který v jedenácti letech zjišťuje, že je čaroděj a nastupuje do Školy čar a kouzel v Bradavicích."
  },
  {
    title: "Pán prstenů: Společenstvo prstenu",
    author: "J. R. R. Tolkien",
    isbn: "9780261103573",
    quantity: 3,
    description: "Epická fantasy o cestě hobita Froda Pytlíka, který musí zničit Jeden prsten v ohních Hory osudu, aby zachránil Středozem před temným vládcem Sauronem."
  },
  {
    title: "Babička",
    author: "Božena Němcová",
    isbn: "9788072689347",
    quantity: 4,
    description: "Klasické dílo české literatury popisující život na vesnici v Ratibořickém údolí v 19. století. Vzpomínky autorky na svou babičku."
  },
  {
    title: "Malý princ",
    author: "Antoine de Saint-Exupéry",
    isbn: "9780156012195",
    quantity: 6,
    description: "Filozofická pohádka o malém princi z asteroidu B-612, který putuje vesmírem a setkává se s různými postavami. Kniha o lásce, přátelství a smyslu života."
  },
  {
    title: "Sapiens: Stručná historie lidstva",
    author: "Yuval Noah Harari",
    isbn: "9780099590088",
    quantity: 2,
    description: "Populárně-naučná kniha mapující vývoj lidstva od kamenné doby po současnost. Vysvětluje, jak se Homo sapiens stal dominantním druhem na Zemi."
  },
  {
    title: "Krakatit",
    author: "Karel Čapek",
    isbn: "9788025707371",
    quantity: 3,
    description: "Sci-fi román o vynálezu zničující výbušniny a morálních dilematech vědce, který stojí před otázkou, co s ní udělat."
  },
  {
    title: "Hobit",
    author: "J. R. R. Tolkien",
    isbn: "9780261102217",
    quantity: 4,
    description: "Předehra k Pánovi prstenů. Příběh hobita Bilba Pytlíka, který se vydává s trpaslíky na výpravu k Osamělé hoře, aby získali zpět svůj poklad od draka Šmaka."
  }
]

created_books = books.map { |attrs| Book.create!(attrs) }
puts "Vytvořeno #{created_books.size} knih."


puts "Vytvářím členy..."

members = [
  { name: "Václav Neuman", email: "vaclav.neuman@example.com" },
  { name: "Jana Nováková", email: "jana.novakova@example.com" },
  { name: "Petr Svoboda", email: "petr.svoboda@example.com" },
  { name: "Anna Dvořáková", email: "anna.dvorakova@example.com" },
  { name: "Tomáš Procházka", email: "tomas.prochazka@example.com" },
  { name: "Marie Černá", email: "marie.cerna@example.com" }
]

created_members = members.map { |attrs| Member.create!(attrs) }
puts "Vytvořeno #{created_members.size} členů."


puts "Vytvářím výpůjčky..."


Loan.create!(
  book: created_books[0],   # 1984
  member: created_members[0],
  start_date: Date.current - 5.days,
  end_date: Date.current + 9.days
)

Loan.create!(
  book: created_books[1],   # Harry Potter
  member: created_members[1],
  start_date: Date.current - 2.days,
  end_date: Date.current + 12.days
)


Loan.create!(
  book: created_books[2],   # Pán prstenů
  member: created_members[2],
  start_date: Date.current - 30.days,
  end_date: Date.current - 5.days
)


Loan.create!(
  book: created_books[3],   # Babička
  member: created_members[3],
  start_date: Date.current - 13.days,
  end_date: Date.current + 1.day
)

# Vrácené výpůjčky (historie)
returned_loan_1 = Loan.create!(
  book: created_books[4],   # Malý princ
  member: created_members[0],
  start_date: Date.current - 30.days,
  end_date: Date.current - 16.days
)
returned_loan_1.update!(returned_at: Date.current - 20.days)

returned_loan_2 = Loan.create!(
  book: created_books[5],   # Sapiens
  member: created_members[4],
  start_date: Date.current - 45.days,
  end_date: Date.current - 31.days
)
returned_loan_2.update!(returned_at: Date.current - 35.days)

puts "Vytvořeno #{Loan.count} výpůjček."
puts ""
puts "✅ Seeding hotovo!"
puts ""
puts "Souhrn:"
puts "  - #{Book.count} knih"
puts "  - #{Member.count} členů"
puts "  - #{Loan.count} výpůjček (#{Loan.active.count} aktivních, #{Loan.returned.count} vrácených)"
