# encoding: utf-8
module Appium::Android
  # Returns an array of android classes that match the tag name
  # @param tag_name [String] the tag name to convert to an android class
  # @return [String]
  def tag_name_to_android tag_name
    tag_name = tag_name.to_s.downcase.strip

    # @private
    def prefix *tags
      tags.map!{ |tag| "android.widget.#{tag}" }
    end
    # note that 'secure' is not an allowed tag name on android
    # because android can't tell what a secure textfield is
    # they're all edittexts.

    # must match names in AndroidElementClassMap (Appium's Java server)
    case tag_name
      when 'abslist'
        prefix 'AbsListView'
      when 'absseek'
        prefix 'AbsSeekBar'
      when 'absspinner'
        prefix 'AbsSpinner'
      when 'absolute'
        prefix 'AbsoluteLayout'
      when 'adapterviewanimator'
        prefix 'AdapterViewAnimator'
      when 'adapterviewflipper'
        prefix 'AdapterViewFlipper'
      when 'analogclock'
        prefix 'AnalogClock'
      when 'appwidgethost'
        prefix 'AppWidgetHostView'
      when 'autocomplete'
        prefix 'AutoCompleteTextView'
      when 'button'
        prefix 'Button', 'ImageButton'
      when 'breadcrumbs'
        prefix 'FragmentBreadCrumbs'
      when 'calendar'
        prefix 'CalendarView'
      when 'checkbox'
        prefix 'CheckBox'
      when 'checked'
        prefix 'CheckedTextView'
      when 'chronometer'
        prefix 'Chronometer'
      when 'compound'
        prefix 'CompoundButton'
      when 'datepicker'
        prefix 'DatePicker'
      when 'dialerfilter'
        prefix 'DialerFilter'
      when 'digitalclock'
        prefix 'DigitalClock'
      when 'drawer'
        prefix 'SlidingDrawer'
      when 'expandable'
        prefix 'ExpandableListView'
      when 'extract'
        prefix 'ExtractEditText'
      when 'fragmenttabhost'
        prefix 'FragmentTabHost'
      when 'frame'
        prefix 'FrameLayout'
      when 'gallery'
        prefix 'Gallery'
      when 'gesture'
        prefix 'GestureOverlayView'
      when 'glsurface'
        prefix 'GLSurfaceView'
      when 'grid'
        prefix 'GridView'
      when 'gridlayout'
        prefix 'GridLayout'
      when 'horizontal'
        prefix 'HorizontalScrollView'
      when 'image'
        prefix 'ImageView'
      when 'imagebutton'
        prefix 'ImageButton'
      when 'imageswitcher'
        prefix 'ImageSwitcher'
      when 'keyboard'
        prefix 'KeyboardView'
      when 'linear'
        prefix 'LinearLayout'
      when 'list'
        prefix 'ListView'
      when 'media'
        prefix 'MediaController'
      when 'mediaroutebutton'
        prefix 'MediaRouteButton'
      when 'multiautocomplete'
        prefix 'MultiAutoCompleteTextView'
      when 'numberpicker'
        prefix 'NumberPicker'
      when 'pagetabstrip'
        prefix 'PageTabStrip'
      when 'pagetitlestrip'
        prefix 'PageTitleStrip'
      when 'progress'
        prefix 'ProgressBar'
      when 'quickcontactbadge'
        prefix 'QuickContactBadge'
      when 'radio'
        prefix 'RadioButton'
      when 'radiogroup'
        prefix 'RadioGroup'
      when 'rating'
        prefix 'RatingBar'
      when 'relative'
        prefix 'RelativeLayout'
      when 'row'
        prefix 'TableRow'
      when 'rssurface'
        prefix 'RSSurfaceView'
      when 'rstexture'
        prefix 'RSTextureView'
      when 'scroll'
        prefix 'ScrollView'
      when 'search'
        prefix 'SearchView'
      when 'seek'
        prefix 'SeekBar'
      when 'space'
        prefix 'Space'
      when 'spinner'
        prefix 'Spinner'
      when 'stack'
        prefix 'StackView'
      when 'surface'
        prefix 'SurfaceView'
      when 'switch'
        prefix 'Switch'
      when 'tabhost'
        prefix 'TabHost'
      when 'tabwidget'
        prefix 'TabWidget'
      when 'table'
        prefix 'TableLayout'
      when 'text'
        prefix 'TextView'
      when 'textclock'
        prefix 'TextClock'
      when 'textswitcher'
        prefix 'TextSwitcher'
      when 'texture'
        prefix 'TextureView'
      when 'textfield'
        prefix 'EditText'
      when 'timepicker'
        prefix 'TimePicker'
      when 'toggle'
        prefix 'ToggleButton'
      when 'twolinelistitem'
        prefix 'TwoLineListItem'
      when 'video'
        prefix 'VideoView'
      when 'viewanimator'
        prefix 'ViewAnimator'
      when 'viewflipper'
        prefix 'ViewFlipper'
      when 'viewgroup'
        prefix 'ViewGroup'
      when 'viewpager'
        prefix 'ViewPager'
      when 'viewstub'
        prefix 'ViewStub'
      when 'viewswitcher'
        prefix 'ViewSwitcher'
      when 'web'
        'android.webkit.WebView' # WebView is not a widget
      when 'window'
        prefix 'FrameLayout'
      when 'zoom'
        prefix 'ZoomButton'
      when 'zoomcontrols'
        prefix 'ZoomControls'
      else
        raise "Invalid tag name #{tag_name}"
    end # return result of case
  end
  # Find all elements matching the attribute
  # On android, assume the attr is name (which falls back to text).
  #
  # ```ruby
  #   find_eles_attr :text
  # ```
  #
  # @param tag_name [String] the tag name to search for
  # @return [Element]
  def find_eles_attr tag_name, attribute=nil
=begin
    sel1 = [ [4, 'android.widget.Button'], [100] ]
    sel2 = [ [4, 'android.widget.ImageButton'], [100] ]

    args = [ 'all', sel1, sel2 ]

    mobile :find, args
=end
    array = ['all']

    tag_name_to_android(tag_name).each do |name|
      # sel.className(name).getStringAttribute("name")
      array.push [ [4, name], [100] ]
    end

    mobile :find, array
  end

  # Selendroid only.
  # Returns a string containing interesting elements.
  # @return [String]
  def get_selendroid_inspect
    # @private
    def run node
      r = []

      run_internal = lambda do |node|
        if node.kind_of? Array
          node.each { |node| run_internal.call node }
          return
        end

        keys = node.keys
        return if keys.empty?

        obj = {}
        # name is id
        obj.merge!( { id: node['name'] } ) if keys.include?('name') && !node['name'].empty?
        obj.merge!( { text: node['value'] } ) if keys.include?('value') && !node['value'].empty?
        # label is name
        obj.merge!( { name: node['label'] } ) if keys.include?('label') && !node['label'].empty?
        obj.merge!( { class: node['type'] } ) if keys.include?('type') && !obj.empty?
        obj.merge!( { shown: node['shown'] } ) if keys.include?('shown')

        r.push obj if !obj.empty?
        run_internal.call node['children'] if keys.include?('children')
      end

      run_internal.call node
      r
    end

    json = get_source
    node = json['children']
    results = run node

    out = ''
    results.each { |e|
      no_text = e[:text].nil?
      no_name = e[:name].nil? || e[:name] == 'null'
      next unless e[:shown] # skip invisible
      # Ignore elements with id only.
      next if no_text && no_name

      out += e[:class].split('.').last + "\n"

      # name is id when using selendroid.
      # remove id/ prefix
      e[:id].sub!(/^id\//, '') if e[:id]

      out += "  class: #{e[:class]}\n"
      # id('back_button').click
      out += "  id: #{e[:id]}\n" unless e[:id].nil?
      # find_element(:link_text, 'text')
      out += "  text: #{e[:text]}\n" unless no_text
      # label is name. default is 'null'
      # find_element(:link_text, 'Facebook')
      out += "  name: #{e[:name]}\n" unless no_name
      # out += "  visible: #{e[:shown]}\n" unless e[:shown].nil?
    }
    out
  end

  def get_page_class
    r = []
    run_internal = lambda do |node|
      if node.kind_of? Array
        node.each { |node| run_internal.call node }
        return
      end

      keys = node.keys
      return if keys.empty?
      r.push node['@class'] if keys.include?('@class')

      run_internal.call node['node'] if keys.include?('node')
    end
    json = get_source
    run_internal.call json['hierarchy']

    res = ''
    r = r.sort
    r.uniq.each do |ele|
      res += "#{r.count(ele)}x #{ele}\n"
    end
    res
  end

  # Count all classes on screen and print to stdout.
  # Useful for appium_console.
  def page_class
    puts get_page_class
    nil
  end

  # Android only.
  # Returns a string containing interesting elements.
  # If an element has no content desc or text, then it's not returned by this method.
  # @return [String]
  def get_android_inspect
    # @private
    def run node
      r = []

      run_internal = lambda do |node|
        if node.kind_of? Array
          node.each { |node| run_internal.call node }
          return
        end

        keys = node.keys
        return if keys.empty?

        obj = {}
        obj.merge!( { desc: node['@content-desc'] } ) if keys.include?('@content-desc') && !node['@content-desc'].empty?
        obj.merge!( { text: node['@text'] } ) if keys.include?('@text') && !node['@text'].empty?
        obj.merge!( { class: node['@class'] } ) if keys.include?('@class') && !obj.empty?

        r.push obj if !obj.empty?
        run_internal.call node['node'] if keys.include?('node')
      end

      run_internal.call node
      r
    end

    json = get_source
    node = json['hierarchy']
    results = run node

    out = ''
    results.each { |e|
      out += e[:class].split('.').last + "\n"

      out += "  class: #{e[:class]}\n"
      if e[:text] == e[:desc]
        out += "  text, name: #{e[:text]}\n" unless e[:text].nil?
      else
        out += "  text: #{e[:text]}\n" unless e[:text].nil?
        out += "  name: #{e[:desc]}\n" unless e[:desc].nil?
      end
    }
    out
  end

  # Automatically detects selendroid or android.
  # Returns a string containing interesting elements.
  # @return [String]
  def get_inspect
    @selendroid ? get_selendroid_inspect : get_android_inspect
  end

  # Intended for use with console.
  # Inspects and prints the current page.
  def page
    puts get_inspect
    nil
  end

  # JavaScript code from https://github.com/appium/appium/blob/master/app/android.js
  #
  # ```javascript
  # Math.round((duration * 1000) / 200)
  # (.20 * 1000) / 200 = 1
  # ```
  #
  # We want steps to be exactly 1. If it's zero then a tap is used instead of a swipe.
  def fast_duration
    0.20
  end

  # Search strings.xml's values for target.
  # @param target [String] the target to search for in strings.xml values
  # @return [Array]
  def xml_keys target
    mobile :xmlKeyContains, target
  end

  # Search strings.xml's keys for target.
  # @param target [String] the target to search for in strings.xml keys
  # @return [Array]
  def xml_values target
    mobile :xmlValueContains, target
  end

  # Resolve id in strings.xml and return the value.
  # @param id [String] the id to resolve
  # @return [String]
  def resolve_id id
    mobile :resolveId, id
  end

  # Lists package, activity, and adb shell am start -n value for current app.
  # Works on local host only (not remote).
  def current_app
    line = `adb shell dumpsys window windows`.each_line.grep(/mFocusedApp/).first.strip
    pair = line.split(' ').last.gsub('}','').split('/')
    OpenStruct.new line: line,
                   package: pair.first,
                   activity: pair.last,
                   am_start: pair.first + '/' + pair.last
  end
end # module Appium::Android