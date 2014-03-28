moment = require 'moment'
module.exports = App.Block = DS.Model.extend
  name: DS.attr('string')
  place: DS.attr('string')
  date: DS.attr('date')
  classes: DS.hasMany('class')
  dateHuman: (()->
  		moment(@.get('date')).format('DD-MM-YYYY')
  	).property('date')