if Meteor.isClient
	Router.configure
		loadingTemplate:  'loading'
		notFoundTemplate: 'notfound'
		layoutTemplate:   'layout'

	Router.route '/',
		action: ->
			@render 'home'
	Router.route '/recommended',
		action: ->
			@render 'home'
	Router.route '/bookmarks',
		action: ->
			@render 'home'
