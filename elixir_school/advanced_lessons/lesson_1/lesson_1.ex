defmodule Example do
  def timed(fun, args) do
    {time, result} = :timer.tc(fun, args)
    IO.puts("time: #{time} μs")
    IO.puts("Result: #{result}")
  end
end
