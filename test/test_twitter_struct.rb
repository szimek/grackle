require File.dirname(__FILE__) + '/test_helper'

class TestTwitterStruct < Test::Unit::TestCase
  def test_to_hash_with_id
    assert_equal twitter_hash(:id => 1), twitter_struct(:id => 1).to_hash
  end

  def test_to_hash_without_id
    assert_equal twitter_hash, twitter_struct.to_hash
  end

  def test_hash_like_access_with_symbol
    assert_equal twitter_hash[:screen_name], twitter_struct[:screen_name]
  end

  def test_hash_like_access_with_string
    assert_equal twitter_hash[:screen_name], twitter_struct['screen_name']
  end

  def test_hash_like_access_to_id_attribute
    assert_equal twitter_hash(:id => 1)[:id], twitter_struct(:id => 1)[:id]
  end

  def test_attributes_method
    assert_equal twitter_hash.keys, twitter_struct.attributes
  end

  def test_has_key_method
    assert twitter_struct.has_key?(:screen_name)
  end

  def test_key_alias_to_has_key_method
    assert twitter_struct.key?(:screen_name)
  end

  def test_include_alias_to_has_key_method
    assert twitter_struct.include?(:screen_name)
  end

  def test_member_alias_to_has_key_method
    assert twitter_struct.member?(:screen_name)
  end

  def test_custom_to_s_with_id_attribute
    assert_equal '#<Grackle::TwitterStruct id=1 screen_name="twitterman">', twitter_struct(:id => 1).to_s
  end

  def test_custom_to_s_without_id_attribute
    assert_equal '#<Grackle::TwitterStruct screen_name="twitterman">', twitter_struct.to_s
  end
  
  private
  def twitter_hash(options={})
    {:screen_name => 'twitterman'}.merge(options)
  end

  def twitter_struct(options={})
    struct = Grackle::TwitterStruct.new
    twitter_hash(options).each do |key,v|
      struct.send("#{key}=", v)
    end
    struct
  end
end
