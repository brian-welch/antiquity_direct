class Artifact < ApplicationRecord
  belongs_to :cultural_origin
  belongs_to :time_period
  belongs_to :artifact_type
  belongs_to :condition

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :cultural_origin_id, presence: true
  validates :time_period_id, presence: true
  validates :artifact_type_id, presence: true
  validates :condition_id, presence: true
end


    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "discount"
    t.string "photo"
    t.boolean "free_shipping"
    t.bigint "cultural_origin_id"
    t.bigint "time_period_id"
    t.bigint "artifact_type_id"
    t.bigint "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
