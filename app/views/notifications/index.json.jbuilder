json.array! @notifications do |notification|
  json.actor notification.actor.name
  json.action notification.action
  json.picture notification.actor.avatar
  # byebug
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  if notification.notifiable_type=="Question"

    json.url question_path(notification.notifiable,anchor: dom_id(notification.notifiable))
  end

  if notification.notifiable_type=="User"

    json.url '/'
  end

  end