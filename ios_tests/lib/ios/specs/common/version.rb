describe 'version.rb' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t '::Appium::VERSION' do
    ::Appium::VERSION.must_match(/(\d+)\.(\d+).(\d+)/)
  end

  t '::Appium::DATE' do
    ::Appium::DATE.must_match(/(\d+)\-(\d+)\-(\d+)/)
  end
end
