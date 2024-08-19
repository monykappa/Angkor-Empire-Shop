from rest_framework.permissions import BasePermission
from .models import APIKey
import logging

logger = logging.getLogger(__name__)

class HasKeyPermission(BasePermission):
    def has_permission(self, request, view):
        key = request.query_params.get('key')
        logger.info(f"Checking key: {key}")
        if not key:
            logger.info("No key provided")
            return False
        valid = APIKey.objects.filter(key=key).exists()
        logger.info(f"Key valid: {valid}")
        return valid