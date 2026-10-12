/* Progressive enhancement: all workshop content remains in index.html. */
(() => {
  'use strict';
  document.documentElement.classList.add('js');
  const toggle = document.querySelector('.menu-toggle');
  const nav = document.querySelector('.site-nav');
  const navLinks = [...document.querySelectorAll('.nav-list a')];
  const mobile = window.matchMedia('(max-width: 1020px)');

  const setMenu = (open, returnFocus = false) => {
    toggle.setAttribute('aria-expanded', String(open));
    toggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
    nav.classList.toggle('is-open', open);
    document.body.classList.toggle('menu-open', open && mobile.matches);
    if (open && mobile.matches) navLinks[0].focus();
    if (returnFocus) toggle.focus();
  };
  toggle.addEventListener('click', () => setMenu(toggle.getAttribute('aria-expanded') !== 'true'));
  navLinks.forEach(link => link.addEventListener('click', () => setMenu(false)));
  document.querySelectorAll('.brand, .nav-contact').forEach(link => link.addEventListener('click', () => setMenu(false)));
  document.addEventListener('keydown', event => {
    if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') setMenu(false, true);
  });
  document.addEventListener('click', event => {
    if (toggle.getAttribute('aria-expanded') === 'true' && !event.target.closest('.site-header')) setMenu(false);
  });
  document.addEventListener('focusin', event => {
    if (toggle.getAttribute('aria-expanded') === 'true' && !event.target.closest('.site-header')) setMenu(false);
  });
  if (mobile.addEventListener) mobile.addEventListener('change', () => setMenu(false));

  // Track the last section whose heading has passed below the fixed header.
  const sections = navLinks.map(link => document.querySelector(link.getAttribute('href'))).filter(Boolean);
  const backTop = document.querySelector('.back-top');
  let ticking = false;
  function updateScrollState() {
    const offset = document.querySelector('.site-header').offsetHeight + 90;
    let current = sections[0];
    sections.forEach(section => { if (section.getBoundingClientRect().top <= offset) current = section; });
    navLinks.forEach(link => {
      if (current && link.hash === '#' + current.id) link.setAttribute('aria-current', 'location');
      else link.removeAttribute('aria-current');
    });
    backTop.hidden = window.scrollY < 700;
    ticking = false;
  }
  window.addEventListener('scroll', () => {
    if (!ticking) { window.requestAnimationFrame(updateScrollState); ticking = true; }
  }, { passive: true });
  window.addEventListener('resize', updateScrollState, { passive: true });
  window.addEventListener('load', updateScrollState);
  updateScrollState();
})();
