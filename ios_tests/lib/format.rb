# helper code useful for writing and verifying tests using Pry
list = <<TXT
alert_click
alert_text
alert_accept
alert_accept_text
alert_dismiss
alert_dismiss_text
TXT

list.split("\n").each do |method|
  puts "t '#{method}' do"
  puts
  puts 'end'
  puts
end

=begin
# for Pry
class Object
  def must_equal b
    raise 'not equal' unless self == b
  end
end
=end