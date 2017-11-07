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

    if automation_name_is_uiautomator2?
      wait { text 'Accessibility/Accessibility Node Provider' }
    else
      # With string.xml
      # Only for uiautomator1
      wait { id 'accessibility_node_provider' }
    end

    2.times { back }
  end

  t 'ids' do
    wait { ids('android:id/text1').length.must_equal 12 }
  end
end
