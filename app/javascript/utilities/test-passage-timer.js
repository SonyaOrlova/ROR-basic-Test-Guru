document.addEventListener('turbolinks:load', () => {
  const timerEl = document.querySelector('.test-passage__timer');

  if (!timerEl) return;

  const timerMinutesEl = timerEl.querySelector('.test-passage__timer-minutes');
  const timerSecondsEl = timerEl.querySelector('.test-passage__timer-seconds');

  let time = Number(timerEl.dataset.timer);

  const renderTimer = () => {
    const minutes = Math.floor(time / 60);
    const seconds = time % 60;

    timerMinutesEl.textContent = minutes;
    timerSecondsEl.textContent = seconds;

    time--;
  }

  renderTimer();

  const timerInterval = setInterval(() => {
    if (time === 0) {
      clearInterval(timerInterval);

      window.location.replace(`${window.location.href}/result`);
    }

    renderTimer();
  }, 1000);
});
