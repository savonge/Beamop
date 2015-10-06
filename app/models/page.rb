class Page < ActiveRecord::Base

validates :headline, :presence => true, :length => {
  :maximum => 12,
  :tokenizer => lambda { |str| str.scan(/\w+/) },
  :too_long  => "Headline should be maximum 12 words"
}

validates :content, :length => {
  :maximum => 36,
  :tokenizer => lambda { |str| str.scan(/\w+/) },
  :too_long  => "Content should be maximum 36 words"
}

H1_STYLES = {

["Wagon", "accelerator"] => "tech",
["fashion", "sale"] => "fashion",
["surf", "Vacation"] => "travel",
["Show", "Live"] => "music",
["Class", "Lecture"] => "academic"


}

def detect_style(text, rules, default_style)
  rules.each do |keywords, style|
    return style if keywords.any? { |kw| text.include?(kw) }
  end

  default_style
end


  def h1_style
  @h1_style ||= detect_style(headline, H1_STYLES, "neutral")
  end

def backgroundimage
  "bg-"+h1_style
  end






end


# if headline.include?('Wagon')
#       'tech'
#     elsif headline.include?('Sale')
#        'fashion'
#        elsif headline.include?('Live')
#        'music'
#        elsif headline.include?('Vacation')
#        'travel'
#        elsif headline.include?('Ted')
#        'acedemic'
#     else
#       'neutral'
#     end
