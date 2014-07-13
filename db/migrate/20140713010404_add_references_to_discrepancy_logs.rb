class AddReferencesToDiscrepancyLogs < ActiveRecord::Migration
  def change
    add_reference :discrepancy_logs, :show, index: true
  end
end
