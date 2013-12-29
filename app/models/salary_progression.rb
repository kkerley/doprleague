class SalaryProgression < ActiveRecord::Base
  attr_accessible :auction_value, :year2, :year3, :year4, :year5
  
  default_scope order('auction_value ASC')
  
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |salary|
        csv << salary.attributes.values_at(*column_names)
      end
    end
  end
    
    
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      salary = find_by_id(row["id"]) || new
      salary.attributes = row.to_hash.slice(*accessible_attributes)
      salary.save!
    end
  end
  
  
end
