# rubocop:disable Metrics/LineLength

# rake android[android/helper]
describe 'android/helper' do
  t 'tags' do
    wait { tags('android.widget.TextView').length.must_equal 13 }
  end

  # t 'get_selendroid_inspect' # only works on selendroid
  t 'get_page_class' do
    # digit values change based on screen size
    # larger screens have more elements

    act = get_page_class
    act.must_include 'android.widget.TextView'
    act.must_include 'android.widget.ListView'
    act.must_include 'android.widget.FrameLayout'
    act.must_include 'hierarchy'
  end

  # t 'page_class' do # tested by get_page_class

  t 'get_android_inspect' do
    # line count changes based on screen size
    wait { get_android_inspect.split("\n").length.must_be :>=, 40 }
  end

  # t 'get_inspect' do # tested by get_android_inspect
  # t 'page' do # tested by get_android_inspect

  def id_key
    'animation_2_instructions'
  end

  def id_value
    'Select an animation:'
  end

  t 'xml_keys' do
    wait do
      id_pair = xml_keys id_key
      id_pair = id_pair.to_a[0]
      id_pair.length.must_equal 2
      id_pair.first.must_equal id_key
      id_pair.last.must_equal id_value
    end
  end

  t 'resolve_id' do
    wait do
      str = resolve_id id_key
      str.must_equal id_value
    end
  end

  t 'xml_values' do
    wait do
      value = xml_values(id_value).first.last
      value.must_equal id_value
    end
  end

  t 'find by id' do
    wait { find('accessibility').click }
    wait { find('accessibility node provider').click }
    wait { id 'accessibility_node_provider' } # Accessibility/Accessibility Node Provider
    2.times { back }
  end

  t 'ids' do
    wait { ids('android:id/text1').length.must_equal 12 }
  end

  t '_parse_current_app_line' do
    # test values from appium's test/unit/adb-specs.js
    expected = [
      # api 16 line
      ['mFocusedApp=AppWindowToken{417ee228 token=Token{41602f78 ActivityRecord{41798a08 io.appium.android.apis/.ApiDemos}}}',
       'io.appium.android.apis',
       '.ApiDemos'],
      # api 18 line
      ['mFocusedApp=AppWindowToken{41744660 token=Token{41ac7198 ActivityRecord{41af55c8 u0 io.appium.android.apis/.ApiDemos}}}',
       'io.appium.android.apis',
       '.ApiDemos'],
      # api 19
      ['mFocusedApp=AppWindowToken{b40af858 token=Token{b3e2ce38 ActivityRecord{b3eb47d8 u0 io.appium.android.apis/.ApiDemos t6}}}',
       'io.appium.android.apis',
       '.ApiDemos'
      ],
      # api 16 selendroid
      ['mFocusedApp=AppWindowToken{4157a2c8 token=Token{41582628 ActivityRecord{415821f0 com.android.launcher/com.android.launcher2.Launcher}}}',
       'com.android.launcher',
       'com.android.launcher2.Launcher'
      ]
    ]

    expected.each do |line, package, activity|
      parsed = _parse_current_app_line(line)
      fail "failed to parse #{line}" if parsed.nil?
      parsed.package.must_equal package
      parsed.activity.must_equal activity
      parsed.am_start.must_equal package + '/' + activity
    end
  end
end
