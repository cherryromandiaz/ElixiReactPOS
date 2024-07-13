alias PosApp.{Repo, Accounts.User, Inventory.Product}
alias PosApp.Accounts
alias PosApp.Inventory
alias PosApp.Sales
alias PosApp.Notifications.Notification
alias PosApp.Accounts.Role
alias PosApp.Sales.Sale
alias PosApp.Orders.Order
alias PosApp.Customers.Customer
alias PosApp.LoyaltyPrograms.LoyaltyProgram
alias PosApp.EmployeeManagement.{Role, TimeEntry}

# Create products
for i <- 1..10 do
  Repo.insert!(%Product{name: "Product #{i}", description: "Description for product #{i}", price: Decimal.new("#{i}0.00"), stock: 100})
end

user = Accounts.create_user(%{name: "Cherry Romandiaz", email: "cherryromandiaz@gmail.com", password: "password"})

product1 = Inventory.create_product(%{name: "Mie Sedap Goreng", description: "Mie Sedap Goreng", price: Decimal.new("10.00"), stock: 100})
product2 = Inventory.create_product(%{name: "Kusuka Snack", description: "Kusuka Snack", price: Decimal.new("20.00"), stock: 200})

customer1 = Customers.create_customer(%{name: "Dini Ayu Putri", email: "diniayuputri@gmail.com"})
customer2 = Customers.create_customer(%{name: "Jessica Isabelle", email: "jessicaisabelle@gmail.com"})

Sales.create_sale(%{user_id: user.id, product_id: product1.id, quantity: 2, total_price: Decimal.new("20.00")})
Sales.create_sale(%{user_id: user.id, product_id: product2.id, quantity: 3, total_price: Decimal.new("60.00")})

Sales.create_order(%{user_id: user.id, total_price: Decimal.new("80.00"), status: "completed"})
Sales.create_order(%{user_id: user.id, total_price: Decimal.new("40.00"), status: "pending"})

Repo.insert!(%Notification{message: "Low inventory alert for Product A", type: "inventory", is_read: false})
Repo.insert!(%Notification{message: "System update available", type: "system", is_read: false})
Repo.insert!(%Notification{message: "Pending order needs attention", type: "order", is_read: false})

Repo.insert!(%User{
  name: "Cherry Romandiaz",
  email: "cherryromandiaz@gmail.com",
  language: "en",
  theme: "light",
  notification_preferences: "all"
})

Repo.insert!(%User{
  name: "Jennifer Emily",
  email: "jenniferemily@gmail.com",
  language: "fr",
  theme: "dark",
  notification_preferences: "important"
})

roles = [
  %{name: "Admin"},
  %{name: "Manager"},
  %{name: "Employee"}
]

Enum.each(roles, fn role ->
  Role.create_role(role)
end)

sales = [
  %{/* Define your dummy data for sales */}
]

Enum.each(sales, fn sale ->
  Sale.create_sale(sale)
end)

orders = [
  %{/* Define your dummy data for orders */}
]

Enum.each(orders, fn order ->
  Order.create_order(order)
end)

products = [
  %Product{name: "Mie Sedap Goreng", description: "Mie Sedap Goreng", price: 10.00, stock: 100, barcode: "123456789012", stock_quantity: 10},
  %Product{name: "Kusuka Snack", description: "Kusuka Snack", price: 20.00, stock: 200, barcode: "234567890123, stock_quantity: 15"},
  %Product{name: "Chitatoes", description: "Chitatoes", price: 30.00, stock: 300, barcode: "345678901234, stock_quantity: 20"}
]

Enum.each(products, fn product ->
  %Product{}
  |> Product.changeset(product)
  |> Repo.insert!()
end)

customers = [
  %{name: "Dini Ayu Putri", email: "diniayuputri@gmail.com", phone: "+1234567890"},
  %{name: "Jessica Isabelle", email: "jessicaisabelle@gmail.com", phone: "+1987654321"}
]

Enum.each(customers, fn customer ->
  Customer.create_customer(customer)
end)

loyalty_programs = [
  %{name: "Silver", description: "Silver Loyalty Program", discount_percentage: 5.0},
  %{name: "Gold", description: "Gold Loyalty Program", discount_percentage: 10.0}
]

Enum.each(loyalty_programs, fn program ->
  LoyaltyProgram.create_loyalty_program(program)
end)

roles = [
  %{name: "Admin", description: "Administrator role"},
  %{name: "Cashier", description: "Cashier role"}
]

Enum.each(roles, fn role ->
  Role.create_role(role)
end)

time_entries = [
  %{employee_name: "Cherry Romandiaz", start_time: "2024-07-10T09:00:00Z", end_time: "2024-07-10T17:00:00Z"},
  %{employee_name: "Jennifer Emily", start_time: "2024-07-10T10:00:00Z", end_time: "2024-07-10T18:00:00Z"}
]

Enum.each(time_entries, fn entry ->
  TimeEntry.create_time_entry(entry)
end)