const sortRows = () => {
  const ascSort = (rowA, rowB) => (rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1);
  const descSort = (rowA, rowB) => (rowA.cells[0].innerHTML < rowB.cells[0].innerHTML ? 1 : -1);

  const table = document.querySelector('.table');

  const rows = table.tBodies[0].children;

  let sortedRows;

  if (table.classList.contains('asc')) {
    sortedRows = Array.from(rows).sort(descSort);
    
    table.classList.remove('asc');
    table.classList.add('desc');
  } else {
    sortedRows = Array.from(rows).sort(ascSort);

    table.classList.remove('desc');
    table.classList.add('asc');
  }

  table.tBodies[0].append(...sortedRows);
};

document.addEventListener('DOMContentLoaded', () => {
  const controlEl = document.querySelector('.sort-control');

  if (!controlEl) return;

  controlEl.addEventListener('click', sortRows);
});
