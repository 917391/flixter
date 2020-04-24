class AddVideoToLessons < ActiveRecord::Migration[5.2]
  def change
    def change
      add_column :lessons, :video, :string
    end
  end
end
