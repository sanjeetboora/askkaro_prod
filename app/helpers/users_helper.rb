module UsersHelper
  def avatar_for(user,options={size: 50})
    size=options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb),width: size,class: 'avatar-image'
    else
      image_tag "1.jpg",width: 2*size,class: 'avatar-image'
    end
  end
end