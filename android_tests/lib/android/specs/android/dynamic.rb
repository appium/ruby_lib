describe 'android/dynamic.rb' do
  t 'dynamic_code_to_string' do
    wait { dynamic_code_to_string(3, 'hi').must_equal 'textContains( "hi" )' }
  end
end