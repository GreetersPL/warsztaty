module.exports = App.IndexController = Ember.ArrayController.extend
	phone: null
	email: null
	name: null
	singup_model: null
	info: []

	saveDataToStorage: ()->
		if !window.localStorage?
  			return false;
  		localStorage.setItem('phone', @.get('phone'))
  		localStorage.setItem('email', @.get('email'))
  		localStorage.setItem('name', @.get('name'))

	actions:
    showPopover: (clas)->
      $("##{clas.get('liID')} .workshopLeader a").popover({content: clas.get('leader.about'), trigger: 'hover'})
  
    confirm: ()->
      kod = $('#confirmCode').val()
      
      confirm = $.post(App.apiUrl+'/workshops/confirm', {code: kod})
      confirm.then(((data)=>
			    @.info.pushObject({success: true, text: 'Już się nie możemy doczekać spotkania!'})	
				), (data)=>
          data = data.responseJSON
          if data.error is "no code"
            @.info.pushObject({success: false, text:'Nie ma takiego kodu!'})
          else if data.error is "limit"
            @.info.pushObject({success: false, text:'Limit zapisu został przekroczony!'})
          else
            @.info.pushObject({success: false, text:'Niestety coś poszło nie tak, proszę spróbuj jeszcze raz!'})
			)
      return false
		signup: (id)->
			@.set('singup_model', id)
			$('#personData').modal('toggle')
			
			return
		dataConfirmed: ()->
			$('#personData').modal('toggle')
			@.set('name', $('#personName').val())
			@.set('email', $('#personEmail').val())
			@.set('phone', $('#personPhone').val())
			data = {
				name: @.get('name')
				email: @.get('email')
				phone: @.get('phone')
			}
			post = $.post(App.apiUrl+'/workshops/'+@.get('singup_model'), data)
			post.then(((data)=>
          @.info.pushObject({success: true, text: 'Kod powinien zostać przesłany na podany email.'})
        ), (data)=>
          @.info.pushObject({success: false, text:'Niestety coś poszło nie tak, proszę spróbuj jeszcze raz!'})
      )
			@.saveDataToStorage()

			@.set('singup_model', null)
      
    
