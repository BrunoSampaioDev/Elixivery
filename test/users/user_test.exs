defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua da bananeiras",
          "Bruno",
          "email@mail.com",
          "00000000",
          31
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when the user is under 18 years old, return an error" do
      response =
        User.build(
          "Rua da bananeiras",
          "Bruno",
          "email@mail.com",
          "00000000",
          15
        )

      expected_response = {:error, "ivalid param error"}

      assert response == expected_response
    end

    test "when cpf is not bit string, return an error" do
      response =
        User.build(
          "Rua da bananeiras",
          "Bruno",
          "email@mail.com",
          00_000_000,
          32
        )

      expected_response = {:error, "ivalid param error"}

      assert response == expected_response
    end
  end
end
