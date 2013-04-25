# encoding: utf-8
module Appium::Android
  # Returns an array of android classes that match the tag name
  def tag_name_to_android tag_name
    tag_name = tag_name.to_s.downcase.strip

    def prefix *tags
      tags.map!{ |tag| "android.widget.#{tag}" }
    end
    # note that 'secure' is not an allowed tag name on android
    # because android can't tell what a secure textfield is
    # they're all edittexts.

    # must match names in AndroidElementClassMap (Appium's Java server)
    case tag_name
      when 'button'
        prefix 'Button', 'ImageButton'
      when 'text'
        prefix 'TextView'
      when 'list'
        prefix 'ListView'
      when 'window', 'frame'
        prefix 'FrameLayout'
      when 'grid'
        prefix 'GridView'
      when 'relative'
        prefix 'RelativeLayout'
      when 'linear'
        prefix 'LinearLayout'
      when 'textfield'
        prefix 'EditText'
      else
        raise "Invalid tag name #{tag_name}"
    end # return result of case
  end

  # on android, assume the attr is name (which falls back to text).
  def find_eles_attr tag_name
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


  # Android only.
  def get_inspect
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

    json = JSON.parse(@driver.page_source)
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

  # Android only. Intended for use with console.
  # Inspects and prints the current page.
  def page
    puts get_inspect
    nil
  end

  # JavaScript code from https://github.com/appium/appium/blob/master/app/android.js
  #
  # Math.round((duration * 1000) / 200)
  # (.20 * 1000) / 200 = 1
  #
  # We want steps to be exactly 1. If it's zero then a tap is used instead of a swipe.
  def fast_duration
    0.20
  end
end # module Appium::Android