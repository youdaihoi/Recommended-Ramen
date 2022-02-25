# frozen_string_literal: true

class RemoveAssessmentFromPostComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :assessment, :integer
  end
end
