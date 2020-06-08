from django.urls import path
from blog import views

app_name = 'blog'
urlpatterns = [
    path("", views.blog_index, name="all_posts"),
    path("<int:pk>/", views.blog_detail, name="blog_detail")
]
