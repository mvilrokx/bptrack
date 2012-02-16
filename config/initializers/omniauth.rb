Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "Xy9nnPnLzDmiMpajpMIjqA", "Cg0z1dp7tpkOO2Ouwx39tPaGPrtnEdMQnvze4IRA" 
  provider :facebook, "323519861017545", "015dc8601dd69afbda1b9dfefe696ab8"
  provider :google_oauth2, "340450112994.apps.googleusercontent.com", "Dz-yYAcBkLPVScaNkRpkRlGO", {access_type: 'online', approval_prompt: ''}
end