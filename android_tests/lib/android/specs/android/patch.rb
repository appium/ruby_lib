# rake android[android/patch]
describe 'android/patch.rb' do
  t 'type' do
    # nav to textfield
    wait { find('app').click }
    wait { find('Search').click }
    wait { find('Invoke Search').click }

    wait { first_textfield.type 'ok' }
    wait { first_textfield.text.must_equal 'ok' }

    # TODO: how to invoke random am start commands?
    # nav to start activity
    # io.appium.android.apis/.ApiDemos

    # keyboard may exist, if it doesn't then an error will raise
    ignore { hide_keyboard }

    # return to app start
    back
    wait { find('Invoke Search') }
    back
    wait { find_exact('Search') }
    back
    wait { find('app') }
  end
end
