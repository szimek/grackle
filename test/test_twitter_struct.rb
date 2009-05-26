require File.dirname(__FILE__) + '/test_helper'

class TestTwitterStruct < Test::Unit::TestCase
  def test_to_hash
    assert_equal twitter_struct.to_hash, twitter_hash
  end

  def test_hash_like_access_with_symbol
    assert_equal twitter_hash[:screen_name], twitter_struct[:screen_name]
  end

  def test_hash_like_access_with_string
    assert_equal twitter_hash[:screen_name], twitter_struct['screen_name']
  end

  def test_hash_like_access_to_id_attribute
    assert_equal twitter_hash[:id], twitter_struct[:id]
  end

  def test_attributes_method
    assert_equal twitter_hash.keys, twitter_struct.attributes
  end

  private
  def twitter_hash(options={})
    {:id => 123, :screen_name => 'twitterman'}.merge(options)
  end

  def twitter_struct(options={})
    struct = Grackle::TwitterStruct.new
    twitter_hash(options).each do |key,v|
      struct.send("#{key}=", v)
    end
    struct
  end
end
