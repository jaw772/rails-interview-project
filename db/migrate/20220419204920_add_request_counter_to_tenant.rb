class AddRequestCounterToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :request_counter, :integer
  end
end
