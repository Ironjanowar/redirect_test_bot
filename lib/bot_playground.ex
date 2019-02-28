defmodule BotPlayground do
  use Application

  require Logger

  def start(_, _) do
    token = ExGram.Config.get(:ex_gram, :token)

    children = [
      ExGram,
      {BotPlayground.Bot, [method: :polling, token: token]}
    ]

    opts = [strategy: :one_for_one, name: BotPlayground]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting BotPlayground")
        ok

      error ->
        Logger.error("Error starting BotPlayground")
        error
    end
  end
end
