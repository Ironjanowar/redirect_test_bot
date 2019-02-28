defmodule BotPlayground.Bot do
  @bot :bot_playground_bot

  use ExGram.Bot,
    name: @bot

  require Logger

  middleware(ExGram.Middleware.IgnoreUsername)

  def bot(), do: @bot

  def handle({:command, "start", %{text: "deep_" <> deep_command}}, context) do
    Logger.debug("Command: #{deep_command}")

    answer(context, "Executing *#{deep_command}* command", parse_mode: "Markdown")
  end

  def handle({:command, "test", _}, context) do
    markup =
      ExGram.Dsl.create_inline([
        [
          [text: "Yes", url: "t.me/irontest_bot?start=deep_test"]
        ]
      ])

    answer(context, "Are you sure you want to execute the test command?", reply_markup: markup)
  end
end
