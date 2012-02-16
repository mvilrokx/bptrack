Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "5wtkQ8hxowBxHz3ZKkeJw", "SYLugYnqxaLlZzSAw0E5bm60OeHSJOlqY9qpYXlmbKQ" 
  provider :identity
end