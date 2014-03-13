Fabricator(:user, :class_name => "User") do
  id { sequence }
 
  password { "admin" }
  display_name { "Admin Boom"}
  role { "admin" }
  email { "whatever@whatever.com" }
  salt { "asdasdastr4325234324sdfds" }
  crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret", 
                     "asdasdastr4325234324sdfds") }
end