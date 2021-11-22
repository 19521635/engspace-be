from django.db import models
from django.conf import settings
from django.db.models.deletion import CASCADE

# Create your models here.


class Post(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=CASCADE,
                             related_name='posts', related_query_name='post')
    name = models.CharField(max_length=255)
    body = models.TextField()
    view_count = models.IntegerField(default=0)
    is_public = models.BooleanField(default=True, verbose_name='public')
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['id']


class PostLike(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=CASCADE,
                             related_name='user_post_likes', related_query_name='user_post_like')
    post = models.ForeignKey(
        Post, on_delete=CASCADE, related_name='post_likes', related_query_name='post_like')
    is_like = models.BooleanField(default=True)
    date_created = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'post'], name='unique_postlike')
        ]
        ordering = ['-date_created']


class PostFollow(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=CASCADE,
                             related_name='user_post_follows', related_query_name='user_post_follow')
    post = models.ForeignKey(
        Post, on_delete=CASCADE, related_name='post_follows', related_query_name='post_follow')
    date_created = models.DateTimeField(auto_now_add=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'post'], name='unique_postfollow')
        ]
        ordering = ['-date_created']


class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=CASCADE,
                             related_name='comments', related_query_name='comment')
    post = models.ForeignKey(
        Post, on_delete=CASCADE, related_name='post_comments', related_query_name='post_comment')
    parent = models.ForeignKey(
        'self', on_delete=CASCADE, related_name='childrens', related_query_name='children', null=True, blank=True)
    body = models.TextField()
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)


class CommentLike(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=CASCADE,
                             related_name='user_comment_likes', related_query_name='user_comment_like')
    comment = models.ForeignKey(
        Comment, on_delete=CASCADE, related_name='comment_likes', related_query_name='comment_like')
    is_like = models.BooleanField(default=True)
    date_created = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'comment'], name='unique_commentlike')
        ]
        ordering = ['-date_created']
