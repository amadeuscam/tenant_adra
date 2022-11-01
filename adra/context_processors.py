from django.conf import settings


def get_tenant_name(request):
    print(request.tenant)
    return {"tenant_name": request.tenant}
    # tenant_info = get_tenant_model().objects.get(schema_name=connection.get_schema())


def add_variable_to_context(request):
    return {"debug": settings.DEBUG}
