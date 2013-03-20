def self.add_to_path file, path=false
 path = path ? "../#{path}/" : '..' 
 path = File.expand_path path, file

 $:.unshift path unless $:.include? path
end

add_to_path __FILE__, 'app_lib'

require 'console'
