const checkConfirmationPassword = (passwordInputEl, passwordConfirmationInputEl) => {
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
}

document.addEventListener('turbolinks:load', () => {
  const passwordInputEl = document.querySelector('#user_password');
  const passwordConfirmationInputEl = document.querySelector('#user_password_confirmation');

  if (!passwordInputEl || !passwordConfirmationInputEl) return;

  passwordInputEl.addEventListener('input', () => checkConfirmationPassword(passwordInputEl, passwordConfirmationInputEl));
  passwordConfirmationInputEl.addEventListener('input', () => checkConfirmationPassword(passwordInputEl, passwordConfirmationInputEl));
});
