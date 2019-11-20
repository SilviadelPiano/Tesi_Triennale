Feature: SignUp
    As a User
    So that I can use the app's services

        Scenario: 
            Given I am on the sign-up page
            When I fill the form correctly
                | user_name                  | Silvia                      |
                | user_surname               | del Piano                   |
                | user_CF                    | DLPSLV97L67H501J            |
                | user_birth_place           | Roma                        |
                | user_email                 | silvia.delpiano27@gmail.com |
                | user_password              | *YukiShiro27                |
                | user_password_confirmation | *YukiShiro27                |
                And I click radio button user_sex_f
                And I click radio button user_roles_student_student
                And I press Registrati
            Then I should be on the new-class page