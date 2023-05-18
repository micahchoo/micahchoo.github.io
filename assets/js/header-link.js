document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('h1, h2, h3, h4, h5, h6').forEach((node) => {
    let link = document.createElement('a');
    link.href = `#${node.id}`;
    link.className = 'header-link';
    link.innerHTML = '<i class="fa-solid fa-link"></i>'; // replace this with your preferred link icon
    node.prepend(link);
  });
});
