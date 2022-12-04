class Feed < ActiveRecord::Base
    has_many :entries, dependent: :destroy

    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
