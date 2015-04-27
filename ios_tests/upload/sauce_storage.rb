=begin
See docs @ http://saucelabs.com/docs/rest#storage

s = SauceStorage.new username: 'my_user_name', key: '00', debug: true

# or if you have  SAUCE_USERNAME and SAUCE_ACCESS_KEY in env already

s = SauceStorage.new debug: true

# list all files
s.files

# upload a file
s.upload '/tmp/sauce/test.zip'

> s.files
=> [{"size"=>8,
  "mtime"=>1367700857.1011374,
  "name"=>"test.zip",
  "md5"=>"d8064dccc0b399d37c73ffa9661a79b6"}]
> s.upload '/tmp/sauce/test.zip'
Uploaded /tmp/sauce/test.zip
 local_md5: 764efa883dda1e11db47671c4a3bbd9e
remote_md5: 764efa883dda1e11db47671c4a3bbd9e
=end
require 'rubygems'
require 'restclient'
require 'json'

class SauceStorage
  attr_reader :username, :key, :url, :debug

  def initialize(opts)
    @username = opts.fetch :username, ENV['SAUCE_USERNAME']
    @key      = opts.fetch :key, ENV['SAUCE_ACCESS_KEY']
    @url      = "https://#{@username}:#{@key}@saucelabs.com/rest/v1/storage/#{@username}"
    @debug    = opts.fetch :debug, false
  end

  def upload(file_path)
    file_name = File.basename file_path
    file      = File.new file_path
    local_md5 = Digest::MD5.hexdigest File.read file_path

    files.each do |f|
      if f['md5'] == local_md5
        puts 'File already uploaded' if @debug
        return true
      end
    end

    url        = "#{@url}/#{file_name}?overwrite=plz"
    remote_md5 = JSON.parse(RestClient.post url, file, content_type: 'application/octet-stream')['md5']
    if @debug
      puts "Uploaded #{file_path}"
      puts " local_md5: #{local_md5}"
      puts "remote_md5: #{remote_md5}"
    end
    local_md5 == remote_md5
  end

  def files
    JSON.parse(RestClient.get @url)['files']
  end
end
