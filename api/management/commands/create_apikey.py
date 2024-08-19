from django.core.management.base import BaseCommand
from api.models import APIKey
from django.contrib.auth.models import User

class Command(BaseCommand):
    help = 'Create a new API key for a user'

    def add_arguments(self, parser):
        parser.add_argument('username', type=str)

    def handle(self, *args, **kwargs):
        username = kwargs['username']
        try:
            user = User.objects.get(username=username)
            api_key = APIKey.objects.create(user=user)
            self.stdout.write(f'API Key for {username}: {api_key.key}')
        except User.DoesNotExist:
            self.stderr.write(f'User with username {username} does not exist.')
