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
		[lw, wh, hl] = [li * wi, wi * hi, hi * li]
		min = Enum.min([lw, wh, hl])
		(2 * lw) + (2 * wh) + (2 * hl) + min
	end

end

Santa.help "day.input"
# Santa.help "day.input.example"
