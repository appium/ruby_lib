# encoding: utf-8

describe 'android/helper' do
  t 'tag_name_to_android' do
    act = tag_name_to_android 'abslist'
    exp = ['android.widget.AbsListView']
    act.must_equal exp

    act = tag_name_to_android 'button'
    exp = %w(android.widget.Button android.widget.ImageButton)
    act.must_equal exp

    msg = ''
    begin; tag_name_to_android 'zz'; rescue Exception => e; msg = e.message; end
    msg.must_equal 'Invalid tag name zz'
  end

  t 'find_eles_attr' do
    act = find_eles_attr :text
    exp = ['API Demos', 'Accessibility', 'Animation', 'App', 'Content', 'Graphics', 'Media', 'NFC', 'OS', 'Preference', 'Text', 'Views']
    act.must_equal exp
  end

  def page_class_data
    (<<-TXT).gsub ' ', ''
      12x android.widget.TextView
      4x android.widget.FrameLayout
      4x android.widget.LinearLayout
      2x android.view.View
      1x android.widget.ListView
      1x android.widget.ImageView
    TXT
  end

  # t 'get_selendroid_inspect' # only works on selendroid
  t 'get_page_class' do
    # digit values change based on screen size
    exp = page_class_data.gsub(/\d+/,'')
    act = get_page_class.gsub(' ', '').gsub(/\d+/,'')
    act.must_equal exp
  end

  # t 'page_class' do # tested by get_page_class

  t 'get_android_inspect' do
    # line count changes based on screen size
    get_android_inspect.split("\n").length.must_be :>=, 36
  end

  # t 'get_inspect' do # tested by get_android_inspect
  # t 'page' do # tested by get_android_inspect

  t 'fast_duration' do
    fast_duration.must_equal 0.0357
  end


  def id_key
    'animation_2_instructions'
  end

  def id_value
    'Select an animation:'
  end

  t 'xml_keys' do
    id_pair = xml_keys id_key
    id_pair = id_pair.to_a[0]
    id_pair.length.must_equal 2
    id_pair.first.must_equal id_key
    id_pair.last.must_equal id_value
  end

  t 'resolve_id' do
    str = resolve_id id_key
    str.must_equal id_value
  end

  t 'xml_values' do
    value = xml_values(id_value).first.last
    value.must_equal id_value
  end

  t 'find by id' do
    name('accessibility').click
    name('accessibility node provider').click
    id 'accessibility_node_provider' # Accessibility/Accessibility Node Provider
    2.times { back }
  end
end