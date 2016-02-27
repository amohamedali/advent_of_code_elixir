defmodule Santa do
	def help input_file do
		File.read!(input_file)
		|> help_santa
		|> IO.puts
	end

	def help_santa body do
		String.split(body, "\n")
		|> Enum.reduce(0, &(get_box_size(&1) + &2))
	end


	def get_box_size box_dimensions do
		[l,w,h] = String.split(box_dimensions, "x")
		{li, ""} = Integer.parse l
		{wi, ""} = Integer.parse w
		{hi, ""} = Integer.parse h
		min = Enum.min([li + wi, hi + wi, li + hi])
		li * wi * hi + 2 * min
	end
end

Santa.help "part_1.input"
# Santa.help "part_1.input.example"