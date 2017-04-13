# rake ios[ios/xcuitest_gestures]
describe 'ios/xcuitest_gestures' do
  def before_first
    screen.must_equal catalog
  end

  def after_last
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'tap' do
    element = text('controls')
    tap(x: 0, y: 0, element: element)
  end

  t 'double_tap' do
    element = button('Tinted')
    double_tap(element: element)
  end

  t 'scroll' do
    scroll direction: "down"
    text("Style Default").displayed?.must_be true
  end

  t 'swipe' do
    swipe direction: "down"
    swipe direction: "down"

    proc { text("Style Default") }.must_raise ::Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'pinch' do
    pinch(scale: 0.5, velocity: -1)
  end

  t 'after_last' do
    back_click
    after_last
  end
end
