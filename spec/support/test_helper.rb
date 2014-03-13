module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(email, password)
        page.driver.post(login_path, { email: email, password: password}) 
      end
    end
  end
end