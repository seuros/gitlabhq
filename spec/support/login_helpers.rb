module LoginHelpers
  # Internal: Create and log in as a user of the specified role
  #
  # role - User role (e.g., :admin, :user)
  def login_as(role)
    @user = create(role)

    login_with(@user)
  end

  # Internal: Login as the specified user
  #
  # user - User instance to login with
  def login_with(user)
    visit new_user_session_path
    fill_in "user_login", with: user.email
    fill_in "user_password", with: "12345678"
    click_button "Sign in"
    Thread.current[:current_user] = user
  end

  # Requires Javascript driver.
  def logout
    find(:css, ".icon-signout").click
  end
end
