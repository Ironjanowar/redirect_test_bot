defmodule BotPlaygroundTest do
  use ExUnit.Case
  doctest BotPlayground

  test "greets the world" do
    assert BotPlayground.hello() == :world
  end
end
