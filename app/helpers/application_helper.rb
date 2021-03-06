module ApplicationHelper
    def gravatar_for(user, options= {size: 80})
        gravatar_id = Digest::MD5.hexdigest(user.email).to_s
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
end
