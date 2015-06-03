FlowRouter.route '/',
	action: ->
		FlowLayout.render('layout', {content: 'home'})
