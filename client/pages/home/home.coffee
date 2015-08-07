Session.setDefault('errors', [])

Template.home.helpers
    validate: (input) ->
        'error ' if (input in Session.get('errors'))

Template.home.events
    'submit form': (event, template) ->
        event.preventDefault()

        email = template.find('input[type=email]').value
        pass  = template.find('input[type=password]').value

        if validateAll()
            template.find('form').classList.add('fadeOutLeft')
            template.find('.login').classList.add('fade-green')

    'keyup input': (event, template) ->
        self = event.target
        if self.type in Session.get('errors')
            validate(self)

validate = (input) ->
    errors = Session.get('errors')
    value  = input.value

    switch input.type
        when 'email'
            if validateEmail(value)
                spliceItem(errors, input.type)
            else
                uppush(errors, input.type)

        when 'password'
            if validatePassword(value)
                spliceItem(errors, input.type)
            else
                uppush(errors, input.type)

    Session.set('errors', errors)

validateAll = ->
    $('input').each ->
        validate(this)

    Session.get('errors').length is 0

# Helpers ---------------------------------------------------------------------
spliceItem = (haystack, item) ->
    index = haystack.indexOf(item)
    if index > -1
        haystack.splice(index, 1)

uppush = (haystack, item) ->
    index = haystack.indexOf(item)
    if index < 0
        haystack.push(item)

# Validators ------------------------------------------------------------------
validateEmail = (value) ->
    re = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$/
    return re.test(value)

validatePassword = (value) ->
    re = /[a-zA-Z0-9]{8,}/
    return re.test(value)
