class Product < ActiveRecord::Base
	
	#default_scope :order => 'title' # The Old!
       default_scope -> { order('title') }
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item #在删除物品之前确保购物车里没有
	
	#校验
	validates 	:title, presence: true,	#presence 字段存在且不唯一
  		    		length: { minimum: 2, :message => "zui shao 2 wei !" }
 	validates 	:description, presence: true, #the same as :presence => true
  		  		length: { minimum: 3 }
  	validates 	:image_url, presence: true,
  		  		length: { minimum: 5 }
  	validates    :price,  
  	 	     :numericality => {:greater_than_or_equal_to =>0.1} # make sure is a number

  	 private

  	 	def ensure_not_referenced_by_any_line_item
  	 		if line_items.empty?
  	 		  return true
  	 		elsif 
  	 		  errors.add(:base, 'Line Items present')
  	 		  return false
  	 		end
  	 	end
end

