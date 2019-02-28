defmodule BotPlayground.Middlewares.Entities do
  use ExGram.Middleware

  require Logger

  alias ExGram.Cnt

  def call(%Cnt{update: %{message: %{entities: entities}}} = cnt, _opts) do
    Logger.info("Entities: #{inspect(entities)}")

    case Enum.find(entities, fn entity -> entity[:type] == "bot_command" end) do
      nil ->
        cnt

      r ->
        Logger.debug("Redirection found: #{inspect(r)}")
        add_extra(cnt, %{is_redirection: true})
    end
  end

  def call(cnt, _), do: cnt
end
