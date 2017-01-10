require './app/services/hotreadservice'

class Read < ApplicationRecord
  belongs_to :link

  def self.create_remote(link)
    HotReadService.read(link)
  end
end
