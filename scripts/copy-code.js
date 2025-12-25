/**
 * Copy to Clipboard for Code Blocks and Prompt Blocks
 *
 * Adds a "Copy" button to:
 * - All <pre> elements (code blocks)
 * - All .prompt-block elements (AI prompts/templates)
 *
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
    // Target both <pre> elements and .prompt-block elements
    var codeBlocks = document.querySelectorAll('pre, .prompt-block');

    codeBlocks.forEach(function(block) {
      // Skip if already has a copy button
      if (block.querySelector('.copy-button')) return;
      if (block.parentNode && block.parentNode.classList && block.parentNode.classList.contains('code-block-wrapper')) return;

      // Create wrapper for positioning
      var wrapper = document.createElement('div');
      wrapper.className = 'code-block-wrapper';
      block.parentNode.insertBefore(wrapper, block);
      wrapper.appendChild(block);

      // Create copy button
      var button = document.createElement('button');
      button.className = 'copy-button';
      button.setAttribute('aria-label', 'Copy to clipboard');
      button.innerHTML = '<span class="copy-button__icon">Copy</span>';

      wrapper.appendChild(button);

      // Handle click
      button.addEventListener('click', function() {
        // For <pre>, get text from <code> child if present, otherwise from pre itself
        // For .prompt-block, get text directly
        var textElement = block.querySelector('code') || block;
        var text = textElement.textContent;

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
      var textArea = document.createElement('textarea');
      textArea.value = text;
      textArea.style.position = 'fixed';
      textArea.style.left = '-9999px';
      textArea.style.top = '-9999px';
      document.body.appendChild(textArea);
      textArea.focus();
      textArea.select();

      try {
        var successful = document.execCommand('copy');
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
    var icon = button.querySelector('.copy-button__icon');
    var originalText = icon.textContent;

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
