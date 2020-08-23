document.addEventListener('DOMContentLoaded', () => {
  const progressBarEl = document.querySelector('.test-passage__progress');
  const { testProgress } = progressBarEl.dataset;

  progressBarEl.style.width = `${testProgress}%`;
});
