module UsersHelper
  def avatar_for(user,options={size: 25})
    size=options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb),width: size,class: 'avatar-image'
    else
      image_tag "1.jpg",width: size,height: size,class: 'avatar-image'
    end
  end
end