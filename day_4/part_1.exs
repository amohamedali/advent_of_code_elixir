defmodule Santa do

	def help(key) do
		help_santa(key, 0)
		|> IO.puts
	end

	def help_santa(key, acc) do
		case md5(key <> Integer.to_string(acc)) do
			"00000" <> _key -> acc
			_ ->  help_santa(key, acc + 1)
		end
	end

  def md5(data) do
    Base.encode16(:erlang.md5(data), case: :lower)
  end
end

Santa.help("iwrupvqb")