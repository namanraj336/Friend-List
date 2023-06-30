json.extract! friend_list, :id, :first_name, :last_name, :email, :phone, :insta, :created_at, :updated_at
json.url friend_list_url(friend_list, format: :json)
