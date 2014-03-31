module.exports = App.PopoverLinkView = Ember.View.extend
  templateName: 'popover'
  tagName: 'a'
  attributeBindings: ['data-content']
  'data-content': null
  didInsertElement: ()->
    @.set('data-content', @.content.get('leader.about'))
    @.$().popover({trigger: 'hover'})