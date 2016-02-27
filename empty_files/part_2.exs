defmodule Santa do
	def help input_file do
		File.read!(input_file)
		|> help_santa
		|> IO.puts
	end

	def help_santa body do
		IO.puts body
	end
end

Santa.help "part_2.input"
# Santa.help "part_2.input.example"