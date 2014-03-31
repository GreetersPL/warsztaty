module.exports = App.Class = DS.Model.extend
  title: DS.attr('string')
  about: DS.attr('string')
  leader: DS.belongsTo('leader')
  begin: DS.attr('date')
  end: DS.attr('date')
  endHuman: (()-> moment(@.get('end')).format('DD-MM-YYYY, HH:mm')).property('end')
  beginHuman: (()-> moment(@.get('begin')).format('DD-MM-YYYY, HH:mm')).property('begin')