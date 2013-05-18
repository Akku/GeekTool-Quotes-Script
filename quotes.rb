#!/usr/bin/env ruby
require 'rubygems'
require 'rfeedparser'

	pf = FeedParser.parse('http://feeds.feedburner.com/quotationspage/qotd')
	number1 = rand(pf['entries'].length-1)+2
	number2 = rand(pf['entries'].length-1)+2
	number3 = rand(pf['entries'].length-1)+2

	while number1 == number2 do
		number2 = rand(pf['entries'].length)+1
	end

	while number3 == number2 || number3 == number1 do
		number3 = rand(pf['entries'].length)+1
	end
	
	i = 1

	pf['entries'].each{
		|e|
		i = i+1
		if (i != number1) and (i != number2) #and (i != number3) #comment out if you want three quotes
			next
		end
	
		puts e['description'] + " - " + e['title']
		puts ""
	}