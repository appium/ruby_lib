describe 'version.rb' do
  t '::Appium::VERSION' do
    ::Appium::VERSION.must_match(/(\d+)\.(\d+).(\d+)/)
  end

  t '::Appium::DATE' do
    ::Appium::DATE.must_match(/(\d+)\-(\d+)\-(\d+)/)
  end
end
