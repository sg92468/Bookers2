class RenameIntroductionCulumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Introduction, :introduction
  end
end
