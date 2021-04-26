defmodule Lesson3Test do
  use ExUnit.Case
  doctest Lesson3

  test "greets the world" do
    assert Lesson3.hello() == :world
  end
end
