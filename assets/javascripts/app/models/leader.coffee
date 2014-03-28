module.exports = App.Leader = DS.Model.extend
  name: DS.attr('string')
  about: DS.attr('string')
  classes: DS.hasMany('class')