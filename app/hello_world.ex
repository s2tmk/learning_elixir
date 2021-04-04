defmodule HelloWorld do

  # def say do
  #   IO.puts "Hello World!"
  # end

  # HelloWorld.say

  def greet(person) do
    IO.puts "Hello, #{person}! My pid is #{inspect self}."
    receive do
      message -> IO.puts "Message is #{message}."
    end
  end
end
