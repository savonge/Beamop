class Page < ActiveRecord::Base

validates :headline, :presence => true, :length => {
  :maximum => 12,
  :tokenizer => lambda { |str| str.scan(/\w+/) },
  message: "Please limit your headline to to 12 words"
}


end
