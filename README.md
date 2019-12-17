# Questions-and-Answers-Website

A Quora-like single page application made using:
- Django
- Django Rest Framework
- Vue JS
- Prerequisites to all of the above

Problems and how to fix them:

1) Django 3.0 drops all Python2 compatibilities, meaning all modules have to
as well in order to work. All modules except for django-registration have new
versions also dropping Python2 compatibility - project not using this module
can now use Django 3.0, otherwise use Django 2.2.8

2) AttributeError: Manager isn't available; 'auth.User' has been swapped
for 'users.CustomUser'.

Usually, this error is raised if a custom user model is being used, while
the regular User model is used somewhere. The solution there is to simply
replace all instances of User with get_user_model.
The actual problem in my case ended up being my incorrect path order within
the urlpatterns in urls.py file.
When using RegistrationView, put its 'accounts/register/' path in front of
any 'account/' paths.

Also, in very old Django versions, the form and add_form variables of a custom
user admin have to be rewritten to replace all instance of User with
get_user_model - they no longer contain any in newer Django versions. 
