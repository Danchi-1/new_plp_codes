// Flip the card
function flipCard(cardElement) {
  cardElement.classList.toggle('flipped');
}

// Theme switching with localStorage memory
function toggleTheme() {
  document.body.classList.toggle('dark');
  const currentTheme = document.body.classList.contains('dark') ? 'dark' : 'light';
  localStorage.setItem('theme', currentTheme);
}

// On page load, apply stored theme
window.onload = () => {
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark');
  }
};
