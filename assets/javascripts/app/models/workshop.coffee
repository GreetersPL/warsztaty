moment = require 'moment'
module.exports = App.Workshop = DS.Model.extend
  end: DS.attr('date')
  start: DS.attr('date')
  blocks: DS.hasMany('Block')
  endHuman: (()-> moment(@.get('end')).format('DD-MM-YYYY')).property('end')
  startHuman: (()-> moment(@.get('start')).format('DD-MM-YYYY')).property('start')