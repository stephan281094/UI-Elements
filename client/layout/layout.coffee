Template.layout.events
	'click .applicationContent.menu-open': (event, template) ->
		if not $(event.target).hasClass 'menu-toggler'
			$('.applicationContent').removeClass('menu-open')

	'click .menu-toggler': (event, template) ->
		$('.applicationContent').toggleClass('menu-open')
