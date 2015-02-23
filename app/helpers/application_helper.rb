module ApplicationHelper
	def avatar_url(user)
    	if user.avatar_url.present?
     	 user.avatar_url
    	else
     	  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    	  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=48"
    	end
  end
end
