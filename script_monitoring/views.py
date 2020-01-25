from django.shortcuts import render
from subprocess import Popen
from subprocess import PIPE
from django.http import JsonResponse
from ruamel.yaml import YAML

import subprocess


def run_ansible_script(request):
    if request.method == 'POST':
        # cmd = ["ansible-playbook", "-vvv", request.POST.get('script_path')]
        cmd = [request.POST.get('script_path')]
        output = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()[0]
        return JsonResponse(str(output), safe=False)
    return render(request, 'script_monitoring/ansible_script_run.html')

