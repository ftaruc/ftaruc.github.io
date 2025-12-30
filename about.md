---
layout: page
title: 
permalink: /about/
---

<div class="about-container">
  <div class="about-sidebar">
    <div class="about-header">
      <div class="about-name">Ferdie Taruc</div>
      <div class="about-header-links">
        <a href="{{ '/archives/' | relative_url }}" class="archive-button">archive</a>
        <a href="{{ '/photos/' | relative_url }}" class="photos-button">photos</a>
        <a href="{{ '/files/resume.pdf' | relative_url }}" class="resume-button">resume</a>
      </div>
    </div>
    
    <div class="about-divider"></div>
    
    <div class="about-content">
      <p>first generation filipino-american economics/data science graduate from uc berkeley; in search to understand the intersection of behavioral decisions and data.</p>
      
      <p>* prior work experience: product analytics rooted in insurance: namely <em>Geico</em>, <em>Metromile</em> and <em>Lemonade</em>.</p>
    </div>
    
    <div class="about-divider"></div>
    
    <div class="about-section">
      <p><strong>For inquiries</strong>, reach me through my email: <a href="mailto:ferdie@berkeley.edu">ferdie@berkeley.edu</a></p>
      
      <p><strong>GitHub</strong>: <a href="https://github.com/ftaruc" target="_blank">@ftaruc</a></p>

      <p><strong>Youtube</strong>: <a href="https://youtube.com/morimentos" target="_blank">@morimentos</a></p>
    </div>
    
    <div class="about-divider"></div>
    
    <div class="about-section hoverable-section" data-content="playlist">
      <p><strong>2025 playlist</strong>: <a href="/2021/01/01/playlists/">click here for the full list</a></p>
    </div>
    
    <div class="about-divider"></div>
    
    <div class="about-section">
      <p><strong>Favorites:</strong></p>
    </div>
    
    <div class="about-section hoverable-section" data-content="films">
      <p><strong>films</strong>: <a href="https://letterboxd.com/ferdie/" target="_blank">find me on letterbox</a></p>
    </div>
    
    <div class="about-section hoverable-section" data-content="albums">
      <p><strong>albums</strong>: <a href="https://ferdie.org/images/archive%20photos/final_albums.jpg" target="_blank">high resolution</a></p>
    </div>
    
    <div class="about-section hoverable-section" data-content="articles">
      <p><strong>favorite articles/videos from this year</strong></p>
      <ol>
        <li><a href="https://en.wikipedia.org/wiki/Hanakotoba" target="_blank">Hanakotoba (花言葉)</a></li>
        <li><a href="https://en.wikipedia.org/wiki/Hiroo_Onoda" target="_blank">Hiroo Onoda - What is a Right Goal?</a></li>
        <li><a href="https://www.youtube.com/watch?v=8bKy_MR_G80" target="_blank">MY FAVORITE PHOTOGRAPHER: RINKO KAWAUCHI (川内 倫子)</a></li>
      </ol>
    </div>
  </div>
  
  <div class="about-preview">
    <div class="content-carousel" id="contentCarousel">
      <!-- Content will be dynamically inserted here -->
    </div>
  </div>
</div>

<style>
/* CSS Variables from reference site */
:root {
  --pure-white: #ffffff;
  --primary-color: #b9c6d2;
  --secondary-color: #d0dde9;
  --tertiary-color: #edf0f8;
  --accent-color: #ff3e00;
  --heading-color: rgba(0, 0, 0, .7);
  --text-color: #444444;
  --background-without-opacity: rgba(255, 255, 255, .7);
  --column-width: 42rem;
  --column-margin-top: 4rem;
}

/* Override Jekyll wrapper constraints for full-width layout */
body .page-content {
  max-width: 100% !important;
  padding: 0 !important;
  margin: 0 !important;
}

body .wrapper {
  max-width: 100% !important;
  padding: 0 !important;
  margin: 0 !important;
}

body .page-content .wrapper {
  padding: 0 !important;
  margin: 0 !important;
}

body {
  background-color: #000000 !important;
  margin: 0 !important;
  padding: 0 !important;
}

body .page-content {
  background-color: #000000 !important;
  margin: 0 !important;
  padding: 0 !important;
}

html {
  background-color: #000000 !important;
  margin: 0 !important;
  padding: 0 !important;
}


body .page-content {
  margin-top: 0 !important;
  padding-top: 0 !important;
}

/* Hide header on about page only */
body .site-header {
  display: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  min-height: 0 !important;
  visibility: hidden !important;
}

body .site-header .wrapper {
  display: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
}

/* Hide footer on about page only */
body .site-footer {
  display: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  visibility: hidden !important;
}

body .page-content {
  margin-top: 0 !important;
  padding-top: 0 !important;
}

body .wrapper {
  margin-top: 0 !important;
  padding-top: 0 !important;
}

main {
  margin-top: 0 !important;
  padding-top: 0 !important;
}

/* Header links */
.about-header-links {
  display: flex;
  gap: 20px;
}

.about-header .archive-button,
.about-header .photos-button,
.about-header .resume-button {
  color: #000000 !important;
  text-decoration: none;
  font-size: 13px;
  font-family: "Arial-LC", sans-serif;
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
  transition: opacity 0.2s ease;
}

.about-header .archive-button:hover,
.about-header .photos-button:hover,
.about-header .resume-button:hover {
  opacity: 0.6;
  color: #000000 !important;
}

.about-header .archive-button:visited,
.about-header .photos-button:visited,
.about-header .resume-button:visited {
  color: #000000 !important;
}

.about-container {
  display: flex !important;
  min-height: 100vh;
  max-width: 100%;
  margin: 0;
  padding: 0 10px;
  background-color: #000000;
  width: 100%;
  box-sizing: border-box;
  visibility: visible !important;
  opacity: 1 !important;
}

.about-sidebar {
  width: 25%;
  padding: 5px 40px 100px 10px;
  font-size: 13px;
  line-height: 1.3;
  color: #000000;
  background-color: #ffffff;
  font-family: "Arial-LC", sans-serif;
  font-weight: 400;
  letter-spacing: 0.02em;
}

.about-header {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 0;
  padding-bottom: 0;
  border-bottom: none;
}

.about-name {
  font-weight: 400;
  font-size: 13px;
  letter-spacing: 0.02em;
  color: #000000;
  line-height: 1.3;
  margin-bottom: 0;
  font-family: "Arial-LC", sans-serif;
}

.about-label {
  font-size: 13px;
  color: #000000;
  text-transform: none;
  letter-spacing: 0;
  font-weight: 400;
}

.about-content {
  margin-bottom: 0;
}

.about-content p {
  display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  unicode-bidi: isolate;
  color: #000000;
  font-size: 13px;
  line-height: 1.3;
  letter-spacing: 0.02em;
}

.about-content em {
  font-style: normal;
  color: #000000;
}

.about-section {
  margin-bottom: 0;
}

.about-section p {
  display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  unicode-bidi: isolate;
  color: #000000;
  font-size: 13px;
  line-height: 1.3;
  letter-spacing: 0.02em;
}

.about-section p:first-of-type {
  margin-bottom: 1.2em;
}

.about-section strong {
  font-weight: 400;
  color: #000000;
}

.about-section a {
  color: #000000;
  text-decoration: underline;
  transition: opacity 0.2s ease;
}

.about-section a:hover {
  opacity: 0.6;
}

.about-section ol {
  margin-top: 0;
  padding-left: 20px;
  color: #000000;
  font-size: 13px;
  line-height: 1.3;
}

.about-section ol li {
  margin-bottom: 0;
  line-height: 1.3;
  letter-spacing: 0.02em;
}

.hoverable-section {
  cursor: pointer;
  transition: opacity 0.2s ease;
}

.hoverable-section:hover {
  opacity: 0.7;
}

.about-divider {
  height: 1px;
  background: #000000;
  margin: 20px 0;
  border: none;
  width: 100%;
}

.about-preview {
  width: 75%;
  position: relative;
  min-height: 100vh;
  perspective: 1500px;
  perspective-origin: center center;
  background-color: #000000 !important;
  padding: 5px 10px 100px 30px;
}

.content-carousel {
  position: relative;
  width: 100%;
  height: 100%;
  transform-style: preserve-3d;
}

.content-carousel {
  overflow: hidden;
}

.content-carousel .content-item {
  position: absolute;
  width: 100%;
  height: 100%;
  opacity: 0;
  transform: rotateY(90deg) translateZ(250px);
  transition: opacity 0.8s ease, transform 1.5s cubic-bezier(0.25, 0.46, 0.45, 0.94), visibility 0s linear 1.5s;
  transform-style: preserve-3d;
  transform-origin: center center;
  backface-visibility: hidden;
  visibility: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.content-carousel .content-item.active {
  opacity: 1;
  transform: rotateY(0deg) translateZ(0px);
  z-index: 2;
  visibility: visible;
  transition-delay: 0s;
}

.content-carousel .content-item.transitioning-out-left {
  opacity: 0;
  transform: rotateY(-90deg) translateZ(250px);
  z-index: 1;
  visibility: visible;
  transition-delay: 0s;
}

.content-carousel .content-item.transitioning-out-right {
  opacity: 0;
  transform: rotateY(90deg) translateZ(250px);
  z-index: 1;
  visibility: visible;
  transition-delay: 0s;
}

.content-carousel .content-item.transitioning-in-left {
  opacity: 1;
  transform: rotateY(90deg) translateZ(250px);
  z-index: 3;
  visibility: visible;
  transition-delay: 0s;
}

.content-carousel .content-item.transitioning-in-right {
  opacity: 1;
  transform: rotateY(-90deg) translateZ(250px);
  z-index: 3;
  visibility: visible;
  transition-delay: 0s;
}

.content-item img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
  filter: grayscale(100%);
  opacity: 0.9;
}

.content-item iframe {
  width: 100%;
  max-width: 100%;
  height: 600px;
  border: none;
}

.content-item .articles-list {
  width: 100%;
  max-width: 700px;
  padding: 0;
}

.content-item .articles-list h3 {
  font-size: 14px;
  font-weight: 400;
  margin-bottom: 40px;
  letter-spacing: 0;
  color: #ffffff;
  font-family: "Arial-LC", sans-serif;
  line-height: 1.5;
}

.content-item .articles-list ol {
  list-style: decimal;
  padding-left: 20px;
  font-size: 14px;
  line-height: 1.5;
  color: #ffffff;
}

.content-item .articles-list li {
  margin-bottom: 20px;
  line-height: 1.5;
  letter-spacing: 0;
}

.content-item .articles-list a {
  color: #ffffff;
  text-decoration: underline;
  transition: opacity 0.2s ease;
}

.content-item .articles-list a:hover {
  opacity: 0.6;
}

@media (max-width: 968px) {
  .about-container {
    flex-direction: column;
  }
  
  .about-sidebar {
    width: 100%;
    padding: 60px 40px;
  }
  
  .about-preview {
    width: 100%;
    min-height: 500px;
    padding: 60px 40px;
    background-color: #000000 !important;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const carousel = document.getElementById('contentCarousel');
  const hoverableSections = document.querySelectorAll('.hoverable-section');
  
  // Content data
  const contentData = {
    home: {
      type: 'image',
      src: '{{ "/images/archive photos/home_test.png" | relative_url }}'
    },
    playlist: {
      type: 'spotify',
      embed: '<iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/4lDl97fws5cTzmqXvkKaIy?utm_source=generator" width="100%" height="600" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>'
    },
    films: {
      type: 'image',
      src: '{{ "/images/archive photos/movies.png" | relative_url }}'
    },
    albums: {
      type: 'image',
      src: '{{ "/images/archive photos/final_albums.jpg" | relative_url }}'
    },
    articles: {
      type: 'articles',
      content: `
        <div class="articles-list">
          <h3>favorite articles/videos from this year</h3>
          <ol>
            <li><a href="https://en.wikipedia.org/wiki/Hanakotoba" target="_blank">Hanakotoba (花言葉)</a></li>
            <li><a href="https://en.wikipedia.org/wiki/Hiroo_Onoda" target="_blank">Hiroo Onoda - What is a Right Goal?</a></li>
            <li><a href="https://www.youtube.com/watch?v=8bKy_MR_G80" target="_blank">MY FAVORITE PHOTOGRAPHER: RINKO KAWAUCHI (川内 倫子)</a></li>
          </ol>
        </div>
      `
    }
  };
  
  let currentContentIndex = -1;
  let hoverTimeout = null;
  let isScrolling = false;
  let scrollTimeout = null;
  const contentOrder = ['home', 'playlist', 'films', 'albums', 'articles'];
  
  // Track scrolling
  window.addEventListener('scroll', function() {
    isScrolling = true;
    if (hoverTimeout) {
      clearTimeout(hoverTimeout);
      hoverTimeout = null;
    }
    clearTimeout(scrollTimeout);
    scrollTimeout = setTimeout(function() {
      isScrolling = false;
    }, 150);
  }, { passive: true });
  
  // Create content items
  contentOrder.forEach((key, index) => {
    const data = contentData[key];
    const item = document.createElement('div');
    item.className = 'content-item';
    item.dataset.contentKey = key;
    
    if (data.type === 'image') {
      const img = document.createElement('img');
      img.src = data.src;
      img.alt = key;
      item.appendChild(img);
    } else if (data.type === 'spotify') {
      item.innerHTML = data.embed;
    } else if (data.type === 'articles') {
      item.innerHTML = data.content;
    }
    
    carousel.appendChild(item);
  });
  
  function updateCarousel(index, previousIndex, direction) {
    const items = carousel.querySelectorAll('.content-item');
    
    // Validate indices
    if (index < 0 || index >= items.length) return;
    if (previousIndex !== undefined && previousIndex !== -1 && (previousIndex < 0 || previousIndex >= items.length)) {
      previousIndex = -1;
    }
    
    // Determine rotation direction
    let rotationDirection = direction;
    if (previousIndex !== undefined && previousIndex !== -1 && previousIndex !== index && !isScrolling) {
      if (!rotationDirection) {
        rotationDirection = index < previousIndex ? 'right' : 'left';
      }
      
      // Animate out the previous item
      const prevItem = items[previousIndex];
      if (prevItem && prevItem.classList.contains('active')) {
        prevItem.classList.remove('active');
        prevItem.classList.add(rotationDirection === 'left' ? 'transitioning-out-left' : 'transitioning-out-right');
        
        // Hide the previous item after transition completes
        setTimeout(() => {
          if (prevItem && !prevItem.classList.contains('active')) {
            prevItem.style.visibility = 'hidden';
            prevItem.classList.remove('transitioning-out-left', 'transitioning-out-right');
          }
        }, 1500);
      }
      
      // Animate in the new item
      const newItem = items[index];
      if (newItem) {
        newItem.style.visibility = 'visible';
        newItem.classList.remove('active', 'transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
        newItem.classList.add(rotationDirection === 'left' ? 'transitioning-in-left' : 'transitioning-in-right');
        
        setTimeout(() => {
          if (currentContentIndex === index && newItem) {
            newItem.classList.remove('transitioning-in-left', 'transitioning-in-right');
            newItem.classList.add('active');
          }
        }, 50);
      }
    } else {
      // First item or no previous
      items.forEach((item, i) => {
        if (i === index) {
          item.style.visibility = 'visible';
          item.classList.remove('transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
          item.classList.add('active');
        } else {
          item.style.visibility = 'hidden';
          item.classList.remove('active', 'transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
        }
      });
    }
  }
  
  hoverableSections.forEach((section) => {
    const contentKey = section.dataset.content;
    const contentIndex = contentOrder.indexOf(contentKey);
    
    if (contentIndex === -1) return;
    
    section.addEventListener('mouseenter', function() {
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
        hoverTimeout = null;
      }
      
      hoverTimeout = setTimeout(function() {
        if (isScrolling) {
          hoverTimeout = null;
          return;
        }
        
        const previousIndex = currentContentIndex;
        let direction = null;
        if (previousIndex !== -1 && previousIndex !== contentIndex && previousIndex >= 0 && previousIndex < contentOrder.length) {
          direction = contentIndex < previousIndex ? 'right' : 'left';
        }
        currentContentIndex = contentIndex;
        updateCarousel(currentContentIndex, previousIndex, direction);
        hoverTimeout = null;
      }, 150);
    });
  });
  
  // Initialize with first content (home image)
  if (contentOrder.length > 0) {
    currentContentIndex = 0;
    updateCarousel(0, -1, null);
  }
});
</script>
