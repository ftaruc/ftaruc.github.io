---
layout: page
title: 
permalink: /archives/
---

<div class="archive-container">
  <div class="archive-sidebar">
    <div class="archive-header">
      <a href="{{ '/' | relative_url }}" class="home-button">home</a>
    </div>
    
    <div class="archive-divider"></div>
    
    <div class="archive-posts-list">
      {% assign post_index = 0 %}
      {% for post in site.posts %}
        {% if post.published != false %}
          <div class="archive-post-item hoverable-post" data-post-index="{{ post_index }}">
            <div class="archive-post-title">{{ post.title }}</div>
            <div class="archive-post-meta">
              {% if post.date %}
                <span class="archive-post-date">{{ post.date | date: "%B %d, %Y" }}</span>
              {% endif %}
              {% if post.categories.size > 0 %}
                <span class="archive-post-categories">
                  {% for category in post.categories %}
                    {{ category }}{% unless forloop.last %}, {% endunless %}
                  {% endfor %}
                </span>
              {% endif %}
              {% if post.tags.size > 0 %}
                <span class="archive-post-tags">
                  {% for tag in post.tags %}
                    {{ tag }}{% unless forloop.last %}, {% endunless %}
                  {% endfor %}
                </span>
              {% endif %}
            </div>
          </div>
          <div class="archive-divider"></div>
          {% assign post_index = post_index | plus: 1 %}
        {% endif %}
      {% endfor %}
    </div>
  </div>
  
  <div class="archive-preview">
    <div class="archive-content-carousel" id="archiveContentCarousel">
      {% for post in site.posts %}
        {% if post.published != false %}
          <div class="archive-content-item" data-post-index="{{ forloop.index0 }}">
            <div class="post-content">
              <h1>{{ post.title }}</h1>
              {% if post.date %}
                <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
              {% endif %}
              {% if post.categories.size > 0 %}
                <p class="post-meta">
                  Categories: {% for category in post.categories %}{{ category }}{% unless forloop.last %}, {% endunless %}{% endfor %}
                </p>
              {% endif %}
              {% if post.tags.size > 0 %}
                <p class="post-meta">
                  Tags: {% for tag in post.tags %}{{ tag }}{% unless forloop.last %}, {% endunless %}{% endfor %}
                </p>
              {% endif %}
              <div class="post-body">
                {{ post.content }}
              </div>
            </div>
          </div>
        {% endif %}
      {% endfor %}
    </div>
  </div>
</div>

<style>
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

/* Hide header on archive page only */
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

/* Hide footer on archive page only */
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

/* Hide page heading and any title elements */
.page-heading,
h1.page-heading,
.page-content h1,
.page-content h2.page-heading,
.page-content .page-heading {
  display: none !important;
  visibility: hidden !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  font-size: 0 !important;
  line-height: 0 !important;
}

/* Hide any h1 or h2 that might be showing the page title */
.page-content > h1:first-child,
.page-content > h2:first-child,
main h1:first-child,
main h2:first-child,
.wrapper h1:first-child,
.wrapper h2:first-child,
article h1:first-child,
article h2:first-child {
  display: none !important;
  visibility: hidden !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  font-size: 0 !important;
  line-height: 0 !important;
  overflow: hidden !important;
}

.archive-container {
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

.archive-sidebar {
  width: 25%;
  padding: 5px 40px 100px 10px;
  font-size: 13px;
  line-height: 1.3;
  color: #000000;
  background-color: #ffffff;
  font-family: "Arial-LC", sans-serif;
  font-weight: 400;
  letter-spacing: 0.02em;
  border-right: 1.5px solid #000000;
}

.archive-header {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 0;
  padding-bottom: 0;
  border-bottom: none;
}

.archive-name {
  font-weight: 400;
  font-size: 13px;
  letter-spacing: 0.02em;
  color: #000000;
  line-height: 1.3;
  margin-bottom: 0;
  font-family: "Arial-LC", sans-serif;
}

.home-button {
  color: #000000 !important;
  text-decoration: none;
  font-size: 13px;
  font-family: "Arial-LC", sans-serif;
  font-weight: 400;
  letter-spacing: 0.02em;
  text-transform: none;
  transition: opacity 0.2s ease;
}

.home-button:hover {
  opacity: 0.6;
  color: #000000 !important;
}

.home-button:visited {
  color: #000000 !important;
}

.archive-divider {
  height: 1px;
  background: #000000;
  margin: 20px 0;
  border: none;
  width: 100%;
}

.archive-posts-list {
  margin-bottom: 0;
}

.archive-post-item {
  margin-bottom: 0;
  cursor: pointer;
  transition: opacity 0.2s ease;
}

.archive-post-item:hover {
  opacity: 0.7;
}

.archive-post-title {
  font-size: 13px;
  line-height: 1.3;
  letter-spacing: 0.02em;
  color: #000000;
  margin-bottom: 5px;
  font-family: "Arial-LC", sans-serif;
  font-weight: 400;
}

.archive-post-meta {
  font-size: 11px;
  line-height: 1.3;
  letter-spacing: 0.02em;
  color: #666;
  font-family: "Arial-LC", sans-serif;
}

.archive-post-date,
.archive-post-categories,
.archive-post-tags {
  display: block;
  margin-bottom: 2px;
}

.archive-preview {
  width: 75%;
  position: relative;
  min-height: 100vh;
  perspective: 1500px;
  perspective-origin: center center;
  background-color: #ffffff !important;
  padding: 0 10px 100px 30px;
}

.archive-content-carousel {
  position: relative;
  width: 100%;
  height: 100%;
  transform-style: preserve-3d;
  overflow: hidden;
}

.archive-content-carousel .archive-content-item {
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
  align-items: flex-start;
  justify-content: flex-start;
  overflow-y: auto;
  padding: 40px;
}

.archive-content-carousel .archive-content-item.active {
  opacity: 1;
  transform: rotateY(0deg) translateZ(0px);
  z-index: 2;
  visibility: visible;
  transition-delay: 0s;
}

.archive-content-carousel .archive-content-item.transitioning-out-left {
  opacity: 0;
  transform: rotateY(-90deg) translateZ(250px);
  z-index: 1;
  visibility: visible;
  transition-delay: 0s;
}

.archive-content-carousel .archive-content-item.transitioning-out-right {
  opacity: 0;
  transform: rotateY(90deg) translateZ(250px);
  z-index: 1;
  visibility: visible;
  transition-delay: 0s;
}

.archive-content-carousel .archive-content-item.transitioning-in-left {
  opacity: 1;
  transform: rotateY(90deg) translateZ(250px);
  z-index: 3;
  visibility: visible;
  transition-delay: 0s;
}

.archive-content-carousel .archive-content-item.transitioning-in-right {
  opacity: 1;
  transform: rotateY(-90deg) translateZ(250px);
  z-index: 3;
  visibility: visible;
  transition-delay: 0s;
}

.archive-content-item .post-content {
  width: 100%;
  max-width: 800px;
  color: #000000;
  font-family: "Arial-LC", sans-serif;
  font-size: 13px;
  line-height: 1.3;
  letter-spacing: 0.02em;
}

.archive-content-item .post-content h1 {
  color: #000000;
  font-size: 13px;
  font-weight: 400;
  margin-bottom: 15px;
  font-family: "Arial-LC", sans-serif;
}

.archive-content-item .post-content h2,
.archive-content-item .post-content h3,
.archive-content-item .post-content h4 {
  color: #000000;
  font-size: 13px;
  font-weight: 400;
  margin-bottom: 10px;
  margin-top: 20px;
  font-family: "Arial-LC", sans-serif;
}

.archive-content-item .post-content p {
  margin-bottom: 15px;
  color: #000000;
}

.archive-content-item .post-content .post-meta {
  color: #666;
  font-size: 11px;
  margin-bottom: 10px;
}

.archive-content-item .post-content .post-body {
  margin-top: 20px;
}

.archive-content-item .post-content .post-body p {
  margin-bottom: 15px;
  color: #000000;
}

.archive-content-item .post-content img {
  max-width: 100%;
  height: auto;
  margin: 20px 0;
}

.archive-content-item .post-content a {
  color: #000000;
  text-decoration: underline;
}

.archive-content-item .post-content a:hover {
  opacity: 0.6;
}

.archive-content-item .post-content ul,
.archive-content-item .post-content ol {
  color: #000000;
  margin-bottom: 15px;
  padding-left: 20px;
}

.archive-content-item .post-content li {
  margin-bottom: 8px;
  color: #000000;
}

.archive-content-item .post-content blockquote {
  color: #000000;
  border-left: 4px solid #000000;
  padding-left: 15px;
  margin: 20px 0;
}

.archive-content-item .post-content code {
  background-color: rgba(0, 0, 0, 0.1);
  padding: 2px 5px;
  color: #000000;
}

.archive-content-item .post-content pre {
  background-color: rgba(0, 0, 0, 0.1);
  padding: 15px;
  overflow-x: auto;
  margin: 20px 0;
}

.archive-content-item .post-content pre code {
  background-color: transparent;
  padding: 0;
  color: #000000;
}

@media (max-width: 968px) {
  .archive-container {
    flex-direction: column;
  }
  
  .archive-sidebar {
    width: 100%;
    padding: 60px 40px;
  }
  
  .archive-preview {
    width: 100%;
    min-height: 500px;
    padding: 60px 40px !important;
    background-color: #ffffff !important;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const carousel = document.getElementById('archiveContentCarousel');
  const hoverablePosts = document.querySelectorAll('.hoverable-post');
  const contentItems = carousel.querySelectorAll('.archive-content-item');
  
  let currentPostIndex = -1;
  let hoverTimeout = null;
  let isScrolling = false;
  let scrollTimeout = null;
  
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
  
  function updateCarousel(index, previousIndex, direction) {
    // Validate indices
    if (index < 0 || index >= contentItems.length) return;
    if (previousIndex !== undefined && previousIndex !== -1 && (previousIndex < 0 || previousIndex >= contentItems.length)) {
      previousIndex = -1;
    }
    
    // Determine rotation direction
    let rotationDirection = direction;
    if (previousIndex !== undefined && previousIndex !== -1 && previousIndex !== index && !isScrolling) {
      if (!rotationDirection) {
        rotationDirection = index < previousIndex ? 'right' : 'left';
      }
      
      // Animate out the previous item
      const prevItem = contentItems[previousIndex];
      if (prevItem && prevItem.classList.contains('active')) {
        prevItem.classList.remove('active');
        prevItem.classList.add(rotationDirection === 'left' ? 'transitioning-out-left' : 'transitioning-out-right');
        
        setTimeout(() => {
          if (prevItem && !prevItem.classList.contains('active')) {
            prevItem.style.visibility = 'hidden';
            prevItem.classList.remove('transitioning-out-left', 'transitioning-out-right');
          }
        }, 1500);
      }
      
      // Animate in the new item
      const newItem = contentItems[index];
      if (newItem) {
        newItem.style.visibility = 'visible';
        newItem.classList.remove('transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
        newItem.classList.add(rotationDirection === 'left' ? 'transitioning-in-left' : 'transitioning-in-right');
        
        setTimeout(() => {
          if (currentPostIndex === index && newItem) {
            newItem.classList.remove('transitioning-in-left', 'transitioning-in-right');
            newItem.classList.add('active');
          }
        }, 50);
      }
    } else {
      // First item or no previous
      contentItems.forEach((item, i) => {
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
  
  hoverablePosts.forEach((postItem) => {
    const postIndex = parseInt(postItem.dataset.postIndex);
    
    postItem.addEventListener('mouseenter', function() {
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
        hoverTimeout = null;
      }
      
      hoverTimeout = setTimeout(function() {
        if (isScrolling) {
          hoverTimeout = null;
          return;
        }
        
        const previousIndex = currentPostIndex;
        let direction = null;
        if (previousIndex !== -1 && previousIndex !== postIndex && previousIndex >= 0 && previousIndex < contentItems.length) {
          direction = postIndex < previousIndex ? 'right' : 'left';
        }
        currentPostIndex = postIndex;
        updateCarousel(currentPostIndex, previousIndex, direction);
        hoverTimeout = null;
      }, 150);
    });
    
    postItem.addEventListener('click', function() {
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
        hoverTimeout = null;
      }
      
      const previousIndex = currentPostIndex;
      let direction = null;
      if (previousIndex !== -1 && previousIndex !== postIndex && previousIndex >= 0 && previousIndex < contentItems.length) {
        direction = postIndex < previousIndex ? 'right' : 'left';
      }
      currentPostIndex = postIndex;
      updateCarousel(currentPostIndex, previousIndex, direction);
    });
  });
  
  // Initialize with first post if available
  if (contentItems.length > 0) {
    currentPostIndex = 0;
    updateCarousel(0, -1, null);
  }
});
</script>
