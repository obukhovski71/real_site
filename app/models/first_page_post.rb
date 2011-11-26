class FirstPagePost < ActiveRecord::Base
  has_many :first_page_comments
end
