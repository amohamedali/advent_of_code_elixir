defmodule Santa do

	def help input_file do
		File.read!(input_file)
		|> help_santa
	end

	def help_santa body do
		get_path(body, [[0, 0]])
		|> Enum.uniq
		|> Enum.count
		|> IO.puts
	end

	def get_path("<" <> body, [[x, y] | path]), do: get_path(body, [[x - 1, y], [x, y] | path])

	def get_path(">" <> body, [[x, y] | path]), do: get_path(body, [[x + 1, y], [x, y] | path])

	def get_path("v" <> body, [[x, y] | path]), do: get_path(body, [[x, y - 1], [x, y] | path])

	def get_path("^" <> body, [[x, y] | path]), do: get_path(body, [[x, y + 1], [x, y] | path])

	def get_path("", path), do: path
end

Santa.help "part_1.input"
# Santa.help "part_1.input.example"