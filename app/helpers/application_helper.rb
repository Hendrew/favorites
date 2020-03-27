module ApplicationHelper
  def flash_message_class(level)
    case level.to_s
      when 'notice'
        'is-success'
      when 'success'
        'is-success'
      when 'info'
        'is-info'
      when 'error'
        'is-danger'
      when 'alert'
        'is-danger'
      when 'danger'
        'is-danger'
    end
  end
end
