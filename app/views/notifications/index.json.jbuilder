json.array! @notifications do |notification|
  json.actor notification.actor.name
  json.action notification.action
  json.picture notification.actor.avatar
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url question_path(notification.notifiable,anchor: dom_id(notification.notifiable))
end