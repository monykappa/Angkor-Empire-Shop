from django.db import models
import uuid
from django.contrib.auth.models import User  # Assuming you are using Django's built-in User model


# Create your models here.
class APIKey(models.Model):
    key = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True) 

    def __str__(self):
        return str(self.key)