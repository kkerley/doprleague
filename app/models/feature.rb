class Feature < ActiveRecord::Base
  include PublicActivity::Common

  paginates_per 5

  attr_accessible :content, :feature_type, :on_homepage, :homepage_order, :show_title, :title, :is_published, :url_path, :avatar, :excerpt, :image_classes, :highlighted_post, :subtitle, 
    :category_one_on, :category_one_text, :category_one_class, :category_two_on, :category_two_text, :category_two_class, :category_three_on, :category_three_text, :category_three_class
    
  belongs_to :user
  
  has_attached_file :avatar, :styles => { :max830 => "830x830>", 
                                          :max720 => "720x720>", 
                                          :max620 => "620x620>",
                                          :max600 => "600x600>", 
                                          :max520 => "520x520>", 
                                          :max500 => "500x500>", 
                                          :max420 => "420x420>",
                                          :max370 => "370x370>",
                                          :max300 => "300x300>", 
                                          :max200 => "200x200>", 
                                          :max100 => "100x100>" }
  
  scope :published, lambda { where(is_published: true) }
  scope :jumbotron, lambda { where(highlighted_post: true) }
  
  
  
  scope :for_announcements,   lambda { where("feature_type = ?", "Announcements").order("homepage_order desc") }
  scope :for_faqs,            lambda { where("feature_type = ?", "FAQ").order("homepage_order asc") }
  scope :for_constitution,    lambda { where("feature_type = ?", "Constitution").order("homepage_order asc") }
  scope :for_polls,           lambda { where("feature_type = ?", "Poll").order("homepage_order asc") }
  scope :for_help,            lambda { where("feature_type = ?", "Help").order("homepage_order asc") }
  scope :for_admin_help,      lambda { where("feature_type = ?", "Admin help").order("homepage_order asc") }
  
end
