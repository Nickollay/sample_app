module SessionsHelper
  def flash_message(type)
    if flash.present?
      case type
        when :notice then content_tag :p, flash[:notice], class: 'flash notice'
        when :success then content_tag :p, flash[:success], class: 'flash success'
        when :error then content_tag :p, flash[:error], class: 'flash error'
        when :alert then content_tag :p, flash[:alert], class: 'flash alert'
      end
    end
  end
end
