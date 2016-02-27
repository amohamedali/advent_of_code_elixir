defmodule Santa do
	def help input_file do
		File.read!(input_file)
		|> help_santa
		|> IO.puts
	end

	def help_santa body do
		String.to_char_list(body)
		|> get_houses_count([[0, 0]], [[0, 0]])
	end

	def get_houses_count([santa_move, robot_move | path], santa_path, robot_path) do
		get_houses_count(path, get_path(santa_move, santa_path), get_path(robot_move, robot_path))
	end

	def get_houses_count([santa_move | []], santa_path, robot_path) do
		get_houses_count([], get_path(santa_move, santa_path), robot_path)
	end

	def get_houses_count([], santa_path, robot_path) do 
	 	robot_path ++ santa_path 
	 	|> Enum.uniq 
	 	|> Enum.count
	end

	def get_path(60, [[x, y] | path]), do: [[x - 1, y], [x, y] | path]

	def get_path(62, [[x, y] | path]), do: [[x + 1, y], [x, y] | path]

	def get_path(118, [[x, y] | path]), do: [[x, y - 1], [x, y] | path]

	def get_path(94, [[x, y] | path]), do: [[x, y + 1], [x, y] | path]


end

Santa.help "part_1.input"
# Santa.help "part_1.input.example"