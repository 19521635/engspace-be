# Generated by Django 3.2.7 on 2021-09-16 10:03

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dob', models.DateField()),
                ('website', models.URLField(blank=True, default='')),
                ('bio', models.TextField(blank=True, default='', max_length=100)),
                ('fb_url', models.URLField(blank=True, default='')),
                ('avatar', models.ImageField(default='default.jpg', upload_to='profile_imgs')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]