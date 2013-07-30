#! /usr/bin/ruby

def parse_moves(game)
	if(game)
		moves = game.scan(/;[B|W]\[(.+?)\]/).flatten.compact.join(',')
		return moves
	else p 'no game given'
		return nil
	end
end

def parse_size(game)
	if(game)
		size = game.scan(/SZ\[(.+?)\]/).flatten[0].to_i
		return size
	else p 'no game given'
		return nil
	end
end

if(!ARGV[0])
	puts "Usage:" 
	puts "hgf2tex [PATH] where PATH denotes a relative path to a hgf file" 
	exit
end

path = ARGV[0]
if(!File.exists?("#{path}"))
	puts "could not find file for given path #{path}"
	exit
end

contents = IO.readlines("#{path}")
moves = parse_moves(contents[0])
size = parse_size(contents[0])
if(size && moves)
	puts "\\begin{figure}" 
	puts "\\centering" 
	puts "\\begin{HavannahBoard}[board size=#{size},show coordinates=true]" 
	puts "\\HGame[first player=black]{#{moves}}" 
	puts "\\end{HavannahBoard}" 
	puts "\\caption{}"
	puts "\\label{fig:}" 
	puts "\\end{figure}" 
else
	puts "could not parse size and moves from given file #{path}" 
end
