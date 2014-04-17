# encoding: utf-8

describe 'version.rb' do
  before_first { screen.must_equal catalog }
  t '::Appium::VERSION' do
    ::Appium::VERSION.must_match /(\d+)\.(\d+).(\d+)/
  end

  t '::Appium::DATE' do
    ::Appium::DATE.must_match /(\d+)\-(\d+)\-(\d+)/
  end
end