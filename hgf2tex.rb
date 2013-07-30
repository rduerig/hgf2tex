#! /usr/bin/ruby

=begin
hgf2tex.rb

Published under the MIT License (MIT)

Copyright (c) 2013 Ralph Dürig (ralphduerig@googlemail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=end

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
