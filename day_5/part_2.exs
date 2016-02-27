defmodule Santa do

	def help input_file do
		File.read!(input_file)
		|> help_santa
		|> IO.puts
	end

	def help_santa body do
		String.split(body, "\n")
		|> Enum.reduce(0, &(is_nice?(&1) + &2))
	end

	def is_nice?(name), do: if has_double?(name) && has_triple?(name), do: 1, else: 0

	def has_double?(""), do: false

	def has_double? name do
		{double, rest} = String.split_at name, 2
		String.contains?(rest, double) || has_double? String.slice(name, 1..-1)
	end

	def has_triple?(""), do: false

	def has_triple? name do
		check = name
		|> String.slice(0..2)
		|> String.to_char_list
		|> is_triple?
		check || has_triple? String.slice(name, 1..-1)
	end

	def is_triple?([a, _, a]), do: true
	def is_triple?(_), do: false
end

Santa.help "day.input"
# Santa.help "day.input.example"