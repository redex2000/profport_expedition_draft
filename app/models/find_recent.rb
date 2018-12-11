module FindRecent
  def find_recent
    where(updated_at: Time.zone.now - 3.days .. Time.zone.now)
  end
end