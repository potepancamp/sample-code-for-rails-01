class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :memo, length: { maximum: 500 }

  validate :end_at_must_after_start_at

  def end_at_must_after_start_at
    errors.add(:end_at, "は開始日以降の日付で選択してください。") if end_at.nil? || end_at < start_at
  end
end