defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case
  alias Exlivery.Orders.Order
  import Exlivery.Factory

  describe "build/2" do
    test "when theis not items in the order, returns an order" do
      user = build(:user)

      items = []

      response = Order.build(user, items)
      expected_response = {:error, "ivalid param error"}
      assert response == expected_response
    end

    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Temaki",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("30.40")
        )
      ]

      response = Order.build(user, items)
      expected_response = {:ok, build(:order)}
      assert response == expected_response
    end
  end
end
