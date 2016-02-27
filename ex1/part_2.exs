defmodule Santa do
	def help input_file do
		File.read!(input_file)
		|> help_santa
		|> IO.puts
	end

	def help_santa body do
		String.to_char_list(body)
		|> count(0, 0)
	end

	def count(_body, -1, nth_guy), do: nth_guy

	def count([40 | body], acc, nth_guy), do: count(body, acc + 1, nth_guy + 1)

	def count([41 | body], acc, nth_guy), do: count(body, acc - 1, nth_guy + 1)

	def count([], _acc, _nth_guy), do: "never reached"


end

Santa.help "part_2.input"
# Santa.help "part_2.input.example"