Session.setDefault('errors', [])
Session.setDefault('submitted', false)

Template.home.helpers
    validate: (name) ->
        'error' if (name in Session.get('errors'))

Template.home.events
    'submit form': (event, template) ->
        event.preventDefault()

        Session.set('submitted', true)

        if validateAll()
            template.find('form').classList.add('fadeOutLeft')
            template.find('.login').classList.add('fade-green')

    'keyup input': (event, template) ->
        self = event.target
        if self.name in Session.get('errors') || Session.get('submitted')
            validate(self)

validate = (input) ->
    errors = Session.get('errors')

    switch input.type
        when 'email'
            if validateEmail(input.value)
                arrayRemove(errors, input.name)
            else
                arrayInsert(errors, input.name)

        when 'password'
            if validatePassword(input.value)
                arrayRemove(errors, input.name)
            else
                arrayInsert(errors, input.name)

    Session.set('errors', errors)

validateAll = ->
    $('input').each ->
        validate(this)

    Session.get('errors').length is 0

# Helpers ---------------------------------------------------------------------
arrayRemove = (haystack, item) ->
    index = haystack.indexOf(item)
    if index > -1
        haystack.splice(index, 1)

arrayInsert = (haystack, item) ->
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
