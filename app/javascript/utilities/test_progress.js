document.addEventListener('turbolinks:load', () => {
  const progressBarEl = document.querySelector('.test-passage__progress');

  if (!progressBarEl) return;

  const { testProgress } = progressBarEl.dataset;

  progressBarEl.style.width = `${testProgress}%`;
});
