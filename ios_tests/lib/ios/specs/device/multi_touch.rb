# rake ios[device/multi_touch]
describe 'device/multi_touch' do
  def before_first
    screen.must_equal catalog
  end

  # go back to the main page
  def go_back
    back
    wait { !exists { id 'ArrowButton' } } # successfully transitioned back
  end

  t 'before_first' do
    before_first
  end

  t 'pinch & zoom' do
    wait { id('Images').click }
    # both of these appear to do nothing on iOS 8
    Appium::MultiTouch.zoom 200
    Appium::MultiTouch.pinch 75
    go_back
  end
end

# TODO: write tests
# pinch
# zoom
# initialize
# add
# perform
