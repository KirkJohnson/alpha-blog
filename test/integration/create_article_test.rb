require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
   
   def setup
    @user = User.create(username: "John", email: "john@example2.com", password: "password", admin: true)
   end
   
   test "create new article test" do
       sign_in_as(@user,"password")
       get new_article_path
       assert_template 'articles/new'
       assert_difference "Article.count", 1 do
         post_via_redirect articles_path, article: {title: "This is a Test Title", description: "This is a test description"}
       end
       assert_template 'articles/show'
       assert_match "This is a Test Title", response.body
   end
    
end