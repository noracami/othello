json.extract! chat, :id, :chat_type, :name, :created_at, :updated_at
json.url chat_url(chat, format: :json)
