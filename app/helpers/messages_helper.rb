module MessagesHelper
  def visibility_text(visible)
    "#{visible ? 'Hide' : 'Display'} Message"
  end
end
