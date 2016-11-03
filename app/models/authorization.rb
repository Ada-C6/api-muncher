class Authorization < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(auth_hash)
    find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
  end

  def self.create_from_hash(auth_hash, user = nil)
    user ||= User.create_from_hash!(auth_hash)
    Authorization.create(user: user, uid: auth_hash['uid'], provider: auth_hash['provider'])
  end

end
