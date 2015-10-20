class Like < ActiveRecord::Base

  validates numericality: { maxmium: 1 }

end