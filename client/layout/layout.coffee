Template.layout.events
    'click .applicationContent.menu-open': (event, template) ->
        if (not event.target.classList.contains('menu-toggler'))
            event.preventDefault()
            dqs('.applicationContent').classList.remove('menu-open')
            dqs('body').classList.remove('no-scroll')

    'click .menu-toggler': (event, template) ->
        dqs('.applicationContent').classList.toggle('menu-open')
        dqs('body').classList.add('no-scroll')

Template.layout.rendered = ->
    $('a[href*=#]:not([href=#])').click ->
        if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
            target = $(@hash)
            target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
            if target.length
                $('html,body').animate { scrollTop: target.offset().top }, 350
                false

dqs = (query) ->
    document.querySelector(query)
