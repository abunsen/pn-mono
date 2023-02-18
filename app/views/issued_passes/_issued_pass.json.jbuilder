json.extract! issued_pass, :id, :pass_template_id, :issue_date, :install_date, :install_ip, :install_user_agent, :delivered_via, :delivered_date, :created_at, :updated_at
json.url issued_pass_url(issued_pass, format: :json)
