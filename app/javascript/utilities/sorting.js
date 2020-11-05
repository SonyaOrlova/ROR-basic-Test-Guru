const sortRows = () => {
  const ascSort = (rowA, rowB) => (rowA.cells[0].innerText > rowB.cells[0].innerText ? 1 : -1);
  const descSort = (rowA, rowB) => (rowA.cells[0].innerText < rowB.cells[0].innerText ? 1 : -1);

  const controlEl = document.querySelector('.tests__title-th');
  const table = document.querySelector('.tests__table');

  const rows = table.tBodies[0].children;

  let sortedRows;

  if (controlEl.classList.contains('tests__title-th_asc')) {
    sortedRows = Array.from(rows).sort(descSort);
    
    controlEl.classList.remove('tests__title-th_asc');
    controlEl.classList.add('tests__title-th_desc');
  } else {
    sortedRows = Array.from(rows).sort(ascSort);

    controlEl.classList.remove('tests__title-th_desc');
    controlEl.classList.add('tests__title-th_asc');
  }

  table.tBodies[0].append(...sortedRows);
};

document.addEventListener('turbolinks:load', () => {
  const controlEl = document.querySelector('.tests__title-th');

  if (!controlEl) return;

  controlEl.addEventListener('click', sortRows);
});
