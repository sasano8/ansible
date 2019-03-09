# coding: UTF-8
from jinja2 import Template

str = """
### {{ title }} ###

{% for user in users %}
{{ user }}{% if not loop.last %},{% endif %}{% endfor %}
"""

dic = {
        'title': 'my report'
        ,'users': None
}

users = [ 'Tom','John' ]

dic['users'] = users

template = Template(str)
out = template.render(dic)
print out
