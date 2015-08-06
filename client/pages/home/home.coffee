Session.setDefault('errors', [])

Template.home.helpers
    validate: ->
        # 'error' if element in Session.get('errors')

Template.home.events
    'submit form': (event, template) ->
        event.preventDefault()

        email = template.find('input[type=email]').value
        pass  = template.find('input[type=password]').value

        if (validate(template))
            template.find('form').classList.add('fadeOutLeft')
            template.find('.login-wrapper').classList.add('fade-green')

    'keyup input': (event, template) ->
        if event.target in Session.get('errors')
            validate(template)

validate = (template) ->
    for input in $('input:not([type=submit])')
        value = input.value
        switch input.type
            when 'email'
                validateEmail(value)
            when 'password'
                validatePassword(value)

validateEmail = (value) ->
    re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/
    return re.test(value)

validatePassword = (value) ->
    re = /[a-zA-Z0-9]{8,}/
    return re.test(value)
