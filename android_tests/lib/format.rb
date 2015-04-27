# helper code useful for writing and verifying tests using Pry
list = <<TXT
find
text
texts
name
names
scroll_to
TXT

list.split("\n").each do |method|
  puts "t '#{method}' do"
  puts
  puts 'end'
  puts
end

# --

# Format AndroidElementClassMap from
# https://github.com/appium/appium/blob/master/android/bootstrap/src/io/appium/android/bootstrap/AndroidElementClassMap.java
# for ruby_lib android/helper.rb tag_name_to_android
list = <<TXT
    map.put("abslist", "AbsListView");
    map.put("button", "Button");
TXT

list.split("\n").each do |method|
  pair  = method.match(/"([^"]+)"[^"]+"([^"]+)"/)
  tag   = pair[1]
  klass = pair[2]

  indent = 6
  puts ' ' * indent + "when '" + tag + "'"
  line2 = ' ' * (indent + 2) + "prefix '" + klass + "'"
  # button must translate to both button and image button
  # for ruby_lib to find all buttons
  line2 += ", 'ImageButton'" if klass == 'Button'
  puts line2
end

# for Pry
# class Object
#   def must_equal b
#     raise 'not equal' unless self == b
#   end
# end
