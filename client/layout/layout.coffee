Template.layout.events
	'click .applicationContent.menu-open': (event, template) ->
		if not $(event.target).hasClass 'menu-toggler'
			event.preventDefault()
			$('.applicationContent').removeClass('menu-open')

	'click .menu-toggler': (event, template) ->
		$('.applicationContent').toggleClass('menu-open')

Template.layout.rendered = ->
    $('a[href*=#]:not([href=#])').click ->
        if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
            target = $(@hash)
            target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
            if target.length
                $('html,body').animate { scrollTop: target.offset().top }, 1000
                false
