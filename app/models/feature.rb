class Feature < ActiveRecord::Base
  attr_accessible :content, :feature_type, :on_homepage, :homepage_order, :show_title, :title, :is_published, :url_path, :avatar, :excerpt, :image_classes, :highlighted_post, :subtitle, 
    :category_one_on, :category_one_text, :category_one_class, :category_two_on, :category_two_text, :category_two_class, :category_three_on, :category_three_text, :category_three_class
  
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
  # scope :on_homepage, lambda { where(on_homepage: true) }
  scope :jumbotron, lambda { where(highlighted_post: true) }
  
  scope :for_announcements, lambda { where("feature_type = ?", "Announcements").order("homepage_order desc") }
  #scope :for_projects, lambda{ where("feature_type = ?", "Project").order("homepage_order asc") }
  scope :for_faqs, lambda{ where("feature_type = ?", "FAQ").order("homepage_order asc") }
  scope :for_constitution, lambda{ where("feature_type = ?", "Constitution").order("homepage_order asc") }
  
  # scope :featured_faq, for_faqs.on_homepage 
  # scope :featured_project, for_projects.on_homepage
  
 
  scope :announcements_list, for_announcements.order("homepage_order asc")
  scope :faqs_list, for_faqs.where("homepage_order > ?", "0")
  scope :constitution_list, for_constitution.where("homepage_order > ?", "0")
  # scope :projects_list, for_projects.order("homepage_order asc")
  # scope :item_two, lambda { where("homepage_order = ?", "1") }
  # scope :item_three, lambda { where("homepage_order = ?", "2") }  
  # scope :item_four, lambda { where("homepage_order = ?", "3") }  
  # scope :item_five, lambda { where("homepage_order = ?", "4") }  
  
  scope :evens, lambda { where("homepage_order % 2 = 0")} #modulus = 0 to get the evens
  scope :odds, lambda { where("homepage_order % 2 = 1")} #modulus = 1 to get the odds


  # scope :the_rest, lambda { where("homepage_order > ?", "3") }
  
  
  scope :others, lambda { where("homepage_order > ?", "0") }
  
  
end
