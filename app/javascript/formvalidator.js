document.addEventListener('turbolinks:load', function() {

  if (document.querySelector('.user_signup_form')) {

    let form = document.querySelector('.user_signup_form')
      form.addEventListener('submit', function() {
      event.preventDefault()
    }
    let username = document.getElementById('username').value
      if (username.length < 3) {
        document.getElementById('formErrors').innerHTML +='Must be at least 3 characters'
    // let password = document.getElementById('password').value
      if (username.length > 20) {
        document.getElementById('formErrors').innerHTML +='Cannot exceed 20 characters'
      }
    }

})
