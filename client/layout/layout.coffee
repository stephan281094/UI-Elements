Template.layout.events
    'click .applicationContent.menu-open': (event, template) ->
        if not $(event.target).hasClass 'menu-toggler'
            event.preventDefault()
            document.querySelector('body').classList.remove('no-scroll')
            document.querySelector('.applicationContent')
                .classList.remove('menu-open')

    'click .menu-toggler': (event, template) ->
        document.querySelector('body').classList.add('no-scroll')
        document.querySelector('.applicationContent')
            .classList.toggle('menu-open')

Template.layout.rendered = ->
    $('a[href*=#]:not([href=#])').click ->
        if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
            target = $(@hash)
            target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
            if target.length
                $('html,body').animate { scrollTop: target.offset().top }, 350
                false
