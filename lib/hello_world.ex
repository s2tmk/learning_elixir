defmodule HelloWorld do
  def greet(person) do
    IO.puts "Hello, #{person}! My pid is #{inspect self}."
    receive do
      message -> IO.puts "Message is #{message}."
      greet(person)
    end
  end
end

# 処理をループする
# iex hello_world.ex
# pid = spawn(HelloWorld, :greet, ["Tom"])
# send pid, "Tom"


# iexごと終了する
# pid = spawn_link(HelloWorld, :greet, ["Tom"])
# send pid, "Tom"
# Process.exit(pid, "Exit!!")

# iexは終了しないようにシステムプロセス化する
# pid = spawn_link(HelloWorld, :greet, ["Tom"])
# send pid, "Tom"
# Process.flag(:trap_exit, true)
# Process.exit(pid, "Exit!!")
# flush()
