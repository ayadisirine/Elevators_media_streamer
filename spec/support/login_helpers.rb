module LoginHelpers
    def login_as(user)
      post "/session", params: { session: { email: user.email, password: "newdog1" } }
    end
  end