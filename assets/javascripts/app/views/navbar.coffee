module.exports = App.NavbarView = Ember.View.extend
  templateName: 'navbar'
  tagName: 'nav'
  didInsertElement: ()->
    $('body').scrollspy(
      target: 'nav'
    )
  actions: 
    collapse: (e)->
      $(e).collapse('toggle')