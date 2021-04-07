defmodule HelloWorld do
  def greet(person) do
    IO.puts "Hello, #{person}! My pid is #{inspect self}."
    receive do
      message -> IO.puts "Message is #{message}."
      greet(person)
    end
  end
end

# iex hello_world.ex
# pid = spawn(HelloWorld, :greet, ["Taro"])
