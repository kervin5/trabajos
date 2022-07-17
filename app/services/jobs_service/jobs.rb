module JobsService
  class Jobs
    def self.find_by_id(id)
      Job.find_by(id: id)
    end
  end
end
