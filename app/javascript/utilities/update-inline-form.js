function editTest(control) {
  const { testId } = control.dataset;

  const testTitleEl = document.querySelector(`.tests-item__title[data-test-id='${testId}'`);
  const changeTestTitleFormEl = document.querySelector(`.tests-item__update-inline-form[data-test-id='${testId}'`);

  if (changeTestTitleFormEl.classList.contains('hidden')) {
    testTitleEl.classList.add('hidden');
    changeTestTitleFormEl.classList.remove('hidden');
    control.textContent = I18n.admin.tests.index.cancel;
  } else {
    testTitleEl.classList.remove('hidden');
    changeTestTitleFormEl.classList.add('hidden');
    control.textContent = I18n.admin.tests.index['update-inline'];
  }
};

function editTestHandler(event) {
  event.preventDefault();

  editTest(event.currentTarget);
}

document.addEventListener('turbolinks:load', () => {
  const controls = document.querySelectorAll('.tests-item__action_update-inline');

  if (!controls.length) return;

  controls.forEach(control => control.addEventListener('click', editTestHandler));

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    const control = Array.from(controls).find(c => c.dataset.testId === errors.dataset.resourceId);
    editTest(control);
  }
});
