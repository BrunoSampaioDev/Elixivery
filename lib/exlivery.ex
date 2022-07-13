defmodule Exlivery do
  alias Exlivery.Users.Agent, as: UserAgente
  alias Exlivery.Users.CreateOrUpdate

  def start_agents do
    UserAgente.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
end
