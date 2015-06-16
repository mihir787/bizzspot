class Map

  def self.service
    @service ||= MapboxService.new
  end

end
