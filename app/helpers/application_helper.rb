module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      asset_path('user.jpg')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(:thumb)
    else
      asset_path('user.jpg')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.variant(resize_to_limit: [130, 130]).processed
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.variant(:thumb).url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def bi_icon(icon_class)
    content_tag 'i', '', class: "bi bi-#{icon_class}"
  end
end
