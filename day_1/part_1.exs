defmodule Santa do
	
	def help input_file do
		File.read!(input_file)
		|> help_santa
		|> IO.inspect
	end

	def help_santa body do
		String.to_char_list(body)
		|> Enum.reduce(0, &(count(&1, &2)))
	end

	def count(40, acc), do: acc + 1

	def count(41, acc), do: acc - 1

end

Santa.help "day.input"