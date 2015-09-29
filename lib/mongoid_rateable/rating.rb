class RatingMark
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  embedded_in :rateable, :polymorphic => true
  field :mark, :type => Integer
  field :title, type: String
  field :feedback, type: String
  field :rater_class, :type => String
  field :rater_id, :type => BSON::ObjectId
  field :weight, :type => Integer, :default => 1
  
  def rater
    @rater ||= if rater_class && rater_id
      rater_class.constantize.find(rater_id)
    end
  end  
end
