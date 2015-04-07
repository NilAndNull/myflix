class Video < ActiveRecord::Base

  belongs_to :category

  # Default Values
  # Set :uuid attribute with UUID version 4
  default_value_for :uuid do
    SecureRandom.uuid
  end  


end
