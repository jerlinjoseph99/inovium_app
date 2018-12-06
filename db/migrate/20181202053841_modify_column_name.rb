class ModifyColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :name, :contact_name
    rename_column :contacts, :email, :contact_email
    rename_column :contacts, :subject, :contact_subject
    rename_column :contacts, :message, :contact_message
  end
end
