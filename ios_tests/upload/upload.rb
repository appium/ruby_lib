require File.expand_path '../sauce_storage', __FILE__

s   = SauceStorage.new debug: true
apk = File.expand_path '../' * 2 + ENV['UPLOAD_FILE'], __FILE__

s.upload apk
