describe 'android/dynamic.rb' do
  t 'dynamic_code_to_string' do
    act = dynamic_code_to_string 3, 'hi'
    act.must_equal 'textContains( "hi" )'
  end
end