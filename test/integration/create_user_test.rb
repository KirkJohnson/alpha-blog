require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
    
    test "get signup form and create new users" do
        get signup_path
        assert_template 'users/new'
        assert_difference 'Users.count', 1 do
           post_via_redirect users_path, user: {username: "John", email: "johnsmith@gmail.com", password: "password"} 
        end
        assert_template 'users/show'
        assert_match 'John', response.body
    end
    
end