defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case
  alias Exlivery.Orders.Item
  import Exlivery.Factory

  describe "build/4" do
    test "when there is an invalid quantity, return an error" do
      response = Item.build("Pizza de banana", :pizza, 70, 0)
      expected_response = {:error, "invalid param error"}

      assert response == expected_response
    end

    test "when there is an invalid category, return an error" do
      response = Item.build("Pizza de banana", :any, 70, 1)
      expected_response = {:error, "invalid param error"}

      assert response == expected_response
    end

    test "when there is an invalid price, return an error" do
      response = Item.build("Pizza de banana", :pizza, "banana", 1)
      expected_response = {:error, "invalid param error 'unity_price'"}

      assert response == expected_response
    end

    test "when all parameters is valid" do
      response = Item.build("Pizza de banana", :pizza, "80.50", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end
  end
end
