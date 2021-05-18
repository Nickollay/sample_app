module ApplicationHelper
  FLASH_CLASS = {
   'notice' => "alert alert-info",
   'success' => "alert alert-success",
   'alert' => "alert alert-warning",
   'error' => "alert alert-danger",
  }.freeze

  def flash_class(level)
    FLASH_CLASS[level]
  end
end
