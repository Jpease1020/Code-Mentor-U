class User < ActiveRecord::Base
  attr_reader :client

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end


# t.datetime "created_at",         null: false
# t.datetime "updated_at",         null: false
# t.string   "name"
# t.string   "uid"
# t.string   "screen_name"
# t.string   "oauth_token"
# t.string   "oauth_token_secret"

  # def self.from_omniauth(auth_hash)
  #   byebug
  #   user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
  #   user.name = auth_hash['info']['name']
  #   user.url = get_social_url_for user.provider, auth_hash['info']['urls']
  #   user.save!
  #   user
  # end
  #

  # private
  #
  # def get_social_location_for(provider, location_hash)
  #   case provider
  #     when 'linkedin'
  #       location_hash['name']
  #     else
  #       location_hash
  #   end
  # end
  #
  # def get_social_url_for(provider, urls_hash)
  #   case provider
  #     when 'linkedin'
  #       urls_hash['public_profile']
  #     else
  #       urls_hash[provider.capitalize]
  #   end
  # end
end
