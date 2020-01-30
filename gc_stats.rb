#!/usr/bin/env ruby

stops = []
if ARGV.length <= 0 
    STDERR.puts "must provide a gclog file"
    exit(false)
end

gclog = ARGV[0]
if !File.exist?(gclog)
    STDERR.puts "file #{ARGV[0]} doesn't exist"
    exit(false)
end

File.open(gclog, "r") do |file|
    while line = file.gets
        left = line.index("Total time for which application threads were stopped:")
        if left != nil
            left = left +  "Total time for which application threads were stopped:".length
            right = line.index("seconds", left)

            stop_time = Float(line[left, right-left])
            puts stop_time
            stops.push(stop_time)
        end
    end
end

require 'array_stats'
puts "-" * 80
#printf "number of stops = %d mean=%f median=%f p99=%f\n", stops.length, stops.mean, stops.median, stops.percentile(99)

[50, 95, 99, 100].each do |i| 
    if i == 50 
        name = "median"
    else
        name = "p" + i.to_s
    end

    if i == 100
        sorted_array = stops.sort
        value = sorted_array[-1]
    else
        value = stops.percentile(i)
    end

    printf "#{name}= #{value}"
end
puts 
