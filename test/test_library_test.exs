defmodule LiveViewDevToolsTest do
  use ExUnit.Case
  doctest LiveViewDevTools

  test "greets the world" do
    assert LiveViewDevTools.hello() == :world
  end
end
