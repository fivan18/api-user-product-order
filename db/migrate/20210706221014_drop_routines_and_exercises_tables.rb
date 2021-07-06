class DropRoutinesAndExercisesTables < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :routines 
      drop_table :exercises
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
