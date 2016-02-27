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

	def is_nice? name do
		treat_line String.to_char_list(name), 0, false, false
	end

	def treat_line [fst, snd | name], vowel, double, bad do
		treat_line [snd | name], has_vowel?(fst, vowel), has_double?([fst, snd]) || double, bad || is_bad?([fst, snd])
	end

	def treat_line [fst | []], vowel, double, bad do
		vowel = has_vowel?(fst, vowel)
		if vowel >= 3 && double && !bad, do: 1, else: 0
	end

	def has_double? name do
		case name do
			[a, a] -> true
			_ -> false
		end
	end

	def has_vowel? name, vowels do
		if Enum.member?([97, 101, 117, 105, 111], name), do: vowels + 1, else: vowels
	end

	def is_bad? name do
		case name do
			'ab' -> true
			'cd' -> true
			'pq'-> true
			'xy'-> true
			_ -> false
		end		
	end
end

Santa.help "day.input"
# Santa.help "day.input.example"