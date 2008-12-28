class Translation < ActiveRecord::Base
  belongs_to :language
  belongs_to :phrase

 def to_s
    return self.translation
  end
end
