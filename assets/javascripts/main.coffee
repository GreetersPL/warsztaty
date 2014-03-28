$           = require 'jquery'
Ember       = require 'ember'
DS          = require 'emberdata'
Bootstrap   = require 'bootstrap'
Templates   = require './templates'
moment		= require 'moment'
config      = require 'config'

window.App = Ember.Application.create(
  apiUrl: config.apiUrl
)
App.Router.reopen(location: 'none')

App.Router.reopen(
  location: config.location
)
require './app/stores'
require './app/adapters'
require './app/controllers'
require './app/views'
require './app/routes'
require './app/models'

App