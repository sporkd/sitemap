module SitemapsHelper
  
  def static_loc(path)
    return '' if path.blank?
    url = url_for(send(path.to_sym)) rescue nil
    url ||= "#{root_url}#{path.split('/').delete_if { |s| s.blank? }.join('/')}"
    return url
  end
  
  def w3c_date(date)
     date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end
  
  def copyright_date
    Time.now.year
  end
end