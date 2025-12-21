/**
 * Lightbox functionality for image viewing
 *
 * Usage:
 * 1. Add class="lightbox-trigger" to any image
 * 2. Include this script at the end of your HTML
 * 3. Include the lightbox HTML structure (see templates)
 */

document.addEventListener('DOMContentLoaded', function() {
  const lightbox = document.getElementById('lightbox');
  if (!lightbox) {
    console.warn('Lightbox element not found. Make sure to include lightbox HTML structure.');
    return;
  }

  const lightboxImg = lightbox.querySelector('.lightbox__image');
  const lightboxCaption = lightbox.querySelector('.lightbox__caption');
  const lightboxClose = lightbox.querySelector('.lightbox__close');
  const triggers = document.querySelectorAll('.lightbox-trigger');

  // Add pointer cursor to all triggers
  triggers.forEach(trigger => {
    trigger.style.cursor = 'pointer';

    // Open lightbox on click
    trigger.addEventListener('click', () => {
      lightboxImg.src = trigger.src;
      lightboxImg.alt = trigger.alt;
      lightboxCaption.textContent = trigger.alt;
      lightbox.classList.add('active');
      document.body.style.overflow = 'hidden'; // Prevent scrolling
    });
  });

  // Close lightbox on close button click
  lightboxClose.addEventListener('click', closeLightbox);

  // Close lightbox on background click
  lightbox.addEventListener('click', (e) => {
    if (e.target === lightbox) {
      closeLightbox();
    }
  });

  // Close lightbox on ESC key
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && lightbox.classList.contains('active')) {
      closeLightbox();
    }
  });

  function closeLightbox() {
    lightbox.classList.remove('active');
    document.body.style.overflow = ''; // Restore scrolling
  }
});
