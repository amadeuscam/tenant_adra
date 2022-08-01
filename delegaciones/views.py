from django.contrib.auth.decorators import login_required
from django.shortcuts import render


@login_required
def home(request):
    return render(request, "../../delegaciones/templates/adra/index.html", context={"var": 123})
