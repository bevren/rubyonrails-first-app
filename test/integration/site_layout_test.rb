require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", hakkinda_path
    assert_select "a[href=?]", iletisim_path
    assert_select "a[href=?]", kayit_path
    
  end
end
