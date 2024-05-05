class CreateTutors < ActiveRecord::Migration[7.1]
  def change
    create_table :tutors do |t|
      t.string :name, null: false, comment: 'Name of the tutor'
      t.string :email, null: false, index: { unique: true }, comment: 'Email of the tutor'
      t.references :course, null: false, foreign_key: true, comment: 'Course that the tutor teaches'

      t.timestamps
    end
  end
end
