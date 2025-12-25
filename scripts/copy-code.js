/**
 * Copy to Clipboard for Code Blocks
 *
 * Adds a "Copy" button to all <pre> elements containing <code>.
 * When clicked, copies the text content to clipboard and shows feedback.
 *
 * Usage: Include this script at the end of your HTML body
 * <script src="/scripts/copy-code.js"></script>
 */

(function() {
  'use strict';

  // Initialize when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  function init() {
    const codeBlocks = document.querySelectorAll('pre');

    codeBlocks.forEach(function(pre) {
      // Skip if already has a copy button
      if (pre.querySelector('.copy-button')) return;

      // Create wrapper for positioning
      const wrapper = document.createElement('div');
      wrapper.className = 'code-block-wrapper';
      pre.parentNode.insertBefore(wrapper, pre);
      wrapper.appendChild(pre);

      // Create copy button
      const button = document.createElement('button');
      button.className = 'copy-button';
      button.setAttribute('aria-label', 'Copy code to clipboard');
      button.innerHTML = '<span class="copy-button__icon">Copy</span>';

      wrapper.appendChild(button);

      // Handle click
      button.addEventListener('click', function() {
        const code = pre.querySelector('code') || pre;
        const text = code.textContent;

        copyToClipboard(text).then(function() {
          showFeedback(button, true);
        }).catch(function() {
          showFeedback(button, false);
        });
      });
    });
  }

  function copyToClipboard(text) {
    // Modern async clipboard API
    if (navigator.clipboard && navigator.clipboard.writeText) {
      return navigator.clipboard.writeText(text);
    }

    // Fallback for older browsers
    return new Promise(function(resolve, reject) {
      const textArea = document.createElement('textarea');
      textArea.value = text;
      textArea.style.position = 'fixed';
      textArea.style.left = '-9999px';
      textArea.style.top = '-9999px';
      document.body.appendChild(textArea);
      textArea.focus();
      textArea.select();

      try {
        const successful = document.execCommand('copy');
        document.body.removeChild(textArea);
        if (successful) {
          resolve();
        } else {
          reject();
        }
      } catch (err) {
        document.body.removeChild(textArea);
        reject(err);
      }
    });
  }

  function showFeedback(button, success) {
    const icon = button.querySelector('.copy-button__icon');
    const originalText = icon.textContent;

    if (success) {
      icon.textContent = 'Copied!';
      button.classList.add('copy-button--success');
    } else {
      icon.textContent = 'Failed';
      button.classList.add('copy-button--error');
    }

    setTimeout(function() {
      icon.textContent = originalText;
      button.classList.remove('copy-button--success', 'copy-button--error');
    }, 2000);
  }
})();
