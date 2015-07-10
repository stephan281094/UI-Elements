Template.layout.events
	'click .applicationContent.menu-open': (event, template) ->
		if not $(event.target).hasClass 'menu-toggler'
			event.preventDefault()
			$('.applicationContent').removeClass('menu-open')

	'click .menu-toggler': (event, template) ->
		$('.applicationContent').toggleClass('menu-open')

Template.layout.rendered = ->
	$nav    = $('.nav')
	$window = $(window)

	$window.scroll ->
		if $window.scrollTop() <= 0
			$nav.addClass('fixed')
		else
			$nav.removeClass('fixed')
