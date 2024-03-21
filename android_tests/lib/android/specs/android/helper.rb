# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# rake "android[android/helper]"
class AndroidTest
  class Helper < Minitest::Test
    def test_01_tags
      wait { assert_equal tags('android.widget.TextView').length, 13 }
    end

    def test_01_get_page_class
      # digit values change based on screen size
      # larger screens have more elements

      act = get_page_class
      assert act.split("\n").length >= 5

      assert act.include? '13x android.widget.TextView'
      if automation_name_is_espresso?
        # 13x android.widget.TextView
        # 1x android.widget.ActionMenuView
        # 1x android.widget.Toolbar
        # 1x com.android.internal.widget.ActionBarContainer
        # 1x com.android.internal.widget.ActionBarContextView
        # 1x android.widget.ListView
        # 1x android.widget.FrameLayout
        # 1x com.android.internal.widget.ActionBarOverlayLayout
        # 1x com.android.internal.policy.DecorView
        assert act.include? '1x android.widget.ActionMenuView'
      else
        assert act.include? '3x android.widget.FrameLayout'
        assert act.include? '2x android.view.ViewGroup'
        assert act.include? '1x android.widget.ListView'
        assert act.include? '1x hierarchy'
      end
    end

    # def test_01_page_class' do # tested by get_page_c

    def test_02_get_android_inspect
      # line count changes based on screen size
      wait { assert get_android_inspect.split("\n").length >= 40 }
    end

    # def test_01_get_inspect' do # tested by get_android_ins
    # def test_01_page' do # tested by get_android_ins

    def id_key
      'animation_2_instructions'
    end

    def id_value
      'Select an animation:'
    end

    def test_03_xml_keys
      wait do
        id_pair = xml_keys id_key
        id_pair = id_pair.to_a[0]
        assert_equal id_pair.length, 2
        assert_equal id_pair.first, id_key
        assert_equal id_pair.last, id_value
      end
    end

    def test_04_resolve_id
      wait do
        str = resolve_id id_key
        assert_equal str, id_value
      end
    end

    def test_05_xml_values
      wait do
        value = xml_values(id_value).first.last
        assert_equal value, id_value
      end
    end

    def test_06_find_by_id
      wait { find('accessibility').click }
      wait { find('accessibility node provider').click }

      if automation_name_is_uiautomator2? || automation_name_is_espresso?
        wait { text 'Accessibility/Accessibility Node Provider' }
      else
        # With string.xml
        # Only for uiautomator1
        wait { id 'accessibility_node_provider' }
      end

      2.times { back }
    end

    def test_07_ids
      wait { assert_equal ids('android:id/text1').length, 12 }
    end
  end
end
