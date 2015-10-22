RankingsPage = require 'views/page/rankings'
ProfilePage = require 'views/page/profile'
AvailabilityPage = require 'views/page/availability'
SplashPage = require 'views/page/splash'
ParticipationPage = require 'views/page/participation'

# Singleton report generator
reportGenerator = require 'views/reportgenerator'

# Function to consistently target the main div
# Generator of singleton view pages
singletons =
    rankingsPage:  -> return @_rankings = @_rankings or new RankingsPage()
    availabilityPage:  -> return @_avail = @_avail or new AvailabilityPage()
    splashPage:  -> return @_splash = @_splash or new SplashPage()
    participationPage:  -> return @_participation = @_participation or new ParticipationPage()

module.exports = class Router extends Backbone.Router
    routes:
        '': 'home'
        'home': 'home'
        'rankings' : 'rankings'
        'availability' : 'availability'
        'participation' : 'participation'
        'profile' : 'profile'
        'profile/:country' : 'profile'

    initialize: ->
        # Create basic page
        reportGenerator.render $('#report-generator')
        reportGenerator.setInitialState()
        # Trigger nav updates
        @on 'all', (trigger) =>
            location = (window.location.hash.slice(1))
            trigger = trigger.split(':')
            if trigger[0]=='route'
              $('#main-nav li').removeClass 'active'
              active = $('#main-nav li a[href$="#'+location+'"]') 
              if active.length==0
                active = $('#main-nav li a[href$="#'+trigger[1]+'"]')
              active = $(active.parents('li')[0])
              active.add( active.parents('.dropdown') ).addClass 'active'

    setCurrent: (view, showReportGenerator=true) =>
        if not (view==@currentView)
            @currentView = view
            view.renderPage $('#explorer')
        if showReportGenerator
            $('#report-generator').show()
        else
            $('#report-generator').hide()

    home: ->
      @setCurrent singletons.splashPage(), showReportGenerator=false
    rankings: ->
      @setCurrent singletons.rankingsPage()
    availability: ->
      @setCurrent singletons.availabilityPage(), showReportGenerator=false
    participation: ->
      @setCurrent singletons.participationPage(), showReportGenerator=false
    profile: (country='') ->
      @setCurrent new ProfilePage(country)


