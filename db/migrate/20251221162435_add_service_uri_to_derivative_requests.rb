class AddServiceUriToDerivativeRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :derivative_requests, :service_uri, :text
  end
end
