#!/usr/bin/env ruby
#
# encoding: utf-8

# B: 96% ↑ (0:14)
# B: 20% ↓ (0:30)
# B: 100% ↔

acpi_output = %x[/usr/bin/acpi].split(' ').map{|i| i.gsub(',', '')}

status_symbols = {
  'Unknown'     => '',
  'Full'        => ' ',
  'Charging'    => '',
  'Discharging' => ''
}

level_colors = {
  'red'         => (0..9),
  'yellow'      => (10..19),
  'green'       => (20..100)
}

output_percentage = acpi_output[3]

battery_level = case output_percentage.delete('%').to_i
                when level_colors['red']
                  "<fc=#d68787><fn=1></fn>"
                when level_colors['yellow']
                  "<fc=#d8af5f><fn=1></fn>"
                when level_colors['green']
                  "<fc=#5f865f><fn=1></fn>"
                else
                  "<fc=#85add4><fn=1></fn>"
                end

symbol = status_symbols[acpi_output[2]]

time = if acpi_output[4]
         time_orig = acpi_output[4].split(':')
         "(#{time_orig[0]}:#{time_orig[1]})"
       else
         "(F)"
       end

puts "#{battery_level}  #{output_percentage} <fn=1>#{symbol}</fn></fc>  <fc=#3a3a3a,#626262> #{time} </fc>"
