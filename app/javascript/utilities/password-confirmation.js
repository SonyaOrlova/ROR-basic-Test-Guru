document.addEventListener('turbolinks:load', () => {
  const passwordInputEl = document.querySelector('#user_password');
  const passwordConfirmationInputEl = document.querySelector('#user_password_confirmation');

  if (!passwordConfirmationInputEl) return;

  passwordConfirmationInputEl.addEventListener('input', () => {
    if (!passwordConfirmationInputEl.value) {
      passwordConfirmationInputEl.classList.remove('valid', 'invalid');
      return;
    }

    if (passwordConfirmationInputEl.value !== passwordInputEl.value) {
      passwordConfirmationInputEl.classList.remove('valid');
      passwordConfirmationInputEl.classList.add('invalid');
    } else {
      passwordConfirmationInputEl.classList.remove('invalid');
      passwordConfirmationInputEl.classList.add('valid');
    }
  });
});
