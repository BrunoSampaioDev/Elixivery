defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "Rua da bananeiras",
      age: 31,
      cpf: "00000000",
      email: "email@mail.com",
      name: "Bruno"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de banana",
      quantity: 1,
      unity_price: Decimal.new("80.50")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua da bananeiras",
      items: [
        build(:item),
        build(:item,
          description: "Temaki",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("30.40")
        )
      ],
      total_price: Decimal.new("141.30"),
      user_cpf: "00000000"
    }
  end
end
