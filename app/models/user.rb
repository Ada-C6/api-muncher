class User < ActiveRecord::Base
  has_many :authorizations

  def self.create_from_hash!(auth_hash)
    User.create(name: auth_hash[:extra][:raw_info][:name], email: auth_hash[:extra][:raw_info][:email])
  end
end
