---
layout: page
title: 
permalink: /photos/
---

<div class="presentation-container">
  <div class="photos-nav">
    <a href="{{ '/' | relative_url }}" class="home-button">home</a>
  </div>
  <div class="project-filters" id="projectFilters" style="display: none;">
    <!-- Project buttons will be dynamically inserted here -->
  </div>
  
  {% assign projects = site.data.photos | group_by_exp: "photo", "photo.code | split: '-' | first" %}
  {% for project_group in projects %}
    {% assign project_name = project_group.name %}
    <div class="project-wrapper" data-project="{{ project_name }}">
      <div class="project-header">
        <h2 class="project-title">{{ project_name }}</h2>
        <button class="project-toggle" data-project="{{ project_name }}">{{ project_name }}</button>
      </div>
      <div class="project-container" data-project="{{ project_name }}" style="display: none;">
        <table class="presentation-table">
        <thead>
          <tr>
            <th class="col-code">No.</th>
            <th class="col-title">Timestamp</th>
            <th class="col-notes">Notes</th>
          </tr>
        </thead>
        <tbody>
          {% for photo in project_group.items %}
            <tr class="presentation-row" data-image="{{ photo.image | relative_url }}">
              <td class="col-code">
                {% if photo.code %}
                  {{ photo.code }}
                {% else %}
                  GP-{% assign padded = forloop.index | prepend: '000' | slice: -3, 3 %}{{ padded }}
                {% endif %}
              </td>
              <td class="col-title">{{ photo.timestamp | default: photo.title | default: 'Untitled' }}</td>
              <td class="col-notes">{{ photo.notes | default: photo.caption | default: '' }}</td>
            </tr>
          {% endfor %}
        </tbody>
      </table>
      </div>
    </div>
  {% endfor %}
  
</div>

<div class="image-preview" id="imagePreview">
  <div class="image-carousel" id="imageCarousel">
    <!-- Images will be dynamically inserted here -->
  </div>
  <div class="image-caption" id="previewCaption"></div>
</div>

<style>
/* Override wrapper and page-content for photos page only */
body {
  background-color: #f5f5f5 !important;
  margin: 0 !important;
  padding: 0 !important;
}

body .page-content {
  max-width: 100% !important;
  padding: 0 !important;
  margin: 0 !important;
  background-color: #f5f5f5 !important;
}

html {
  background-color: #f5f5f5 !important;
  margin: 0 !important;
  padding: 0 !important;
}

body .wrapper {
  max-width: 100% !important;
  margin-right: 0 !important;
  margin-left: 0 !important;
  padding-right: 0 !important;
  padding-left: 0 !important;
}

/* Reduce margin between header and content */
.site-header {
  display: none !important;
  margin-bottom: 0 !important;
  min-height: 0 !important;
  padding: 0 !important;
  height: 0 !important;
  visibility: hidden !important;
}

.site-header .wrapper {
  padding: 0 !important;
  margin: 0 !important;
  width: 100% !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
}

.presentation-container {
  margin-top: 0 !important;
}

/* Center the site title in header */
.site-header .site-title {
  float: none !important;
  text-align: center !important;
  width: 100% !important;
  margin: 0 auto !important;
  margin-left: -250px !important;
  margin-top: 0px !important;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji" !important;
  font-size: 16px !important;
  font-weight: 350 !important;
  letter-spacing: 0 !important;
  line-height: 56px !important;
  padding: 0 !important;
  position: relative !important;
  color: #000000 !important;
}

.site-header .wrapper {
  text-align: center !important;
}

.site-nav {
  float: none !important;
  text-align: center !important;
  width: 100% !important;
  line-height: 1.2 !important;
  padding: 0 !important;
  margin: 0 !important;
}

.presentation-container {
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 20px;
  position: relative;
}

.photos-nav {
  margin-bottom: 20px;
  padding: 0;
}

.home-button {
  color: #999999 !important;
  text-decoration: none;
  font-size: 13px;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
  transition: opacity 0.2s ease;
}

.home-button:hover {
  opacity: 0.6;
  color: #999999 !important;
}

.home-button:visited {
  color: #999999 !important;
}

.project-filters {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 30px;
  padding: 0px 0;
  justify-content: center;
}

.project-filter-btn {
  padding: 10px 20px;
  background-color: #ffffff;
  color: #000000;
  border: 1px solid #000000;
  cursor: pointer;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-size: 14px;
  font-weight: 400;
  letter-spacing: 0;
  transition: all 0.2s ease;
}

.project-filter-btn:hover {
  background-color: #000000;
  color: #ffffff;
}

.project-filter-btn.active {
  background-color: #000000;
  color: #ffffff;
}

.project-wrapper {
  margin-bottom: 40px;
}

.project-container {
  margin-bottom: 0;
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
  padding-bottom: 0;
  border-bottom: 1px solid #000000;
}

.project-title {
  display: none;
}

.project-toggle {
  padding: 5px 15px;
  background-color: #f5f5f5;
  color: #000000;
  border: 1px solid #000000;
  cursor: pointer;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0;
  transition: all 0.2s ease;
}

.project-toggle:hover {
  background-color: #000000;
  color: #ffffff;
}

.presentation-table {
  width: 100%;
  border-collapse: collapse;
  font-family: "PP Supply Mono", "PP Supply Mono Light", "JetBrains Mono", "Courier New", monospace;
  font-size: 12.64px;
  font-weight: 400;
  letter-spacing: 0;
  background: transparent;
  margin-top: 0;
  border: 1px solid rgba(60, 70, 97, 0.5);
}

.presentation-table thead {
  border-bottom: 0px solid rgba(60, 70, 97, 0.5);
  margin-bottom: 0;
  padding-bottom: 0;
}

.presentation-table th {
  text-align: left;
  padding: 6.32px;
  font-weight: normal;
  text-transform: none;
  letter-spacing: 0;
  font-size: 12.64px;
  line-height: 18.96px;
  color: rgb(60, 70, 97);
  border: 1px solid rgba(60, 70, 97, 0.5);
  background: rgba(255, 255, 255, 0.95);
  box-sizing: border-box;
}

.presentation-table td {
  padding: 6.32px;
  border: 1px solid rgba(60, 70, 97, 0.5);
  vertical-align: top;
  background: rgba(255, 255, 255, 0.95);
  transition: color 0.4s ease, background-color 0.4s ease;
  line-height: 18.96px;
  color: rgb(60, 70, 97);
  cursor: pointer;
  box-sizing: border-box;
}

.presentation-row {
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.presentation-row:hover td {
  background-color: rgba(235, 240, 250, 0.4);
}

.col-code {
  width: 15%;
  font-weight: 500;
}

.col-title {
  width: 25%;
  font-weight: 500;
}

.col-notes {
  width: 60%;
  color: #000000;
  line-height: 1.6;
}

.table-element {
  display: inline-block;
  border: 1px solid rgba(60, 70, 97, 0.5);
  padding: 2px 4px;
  margin: 2px;
  background-color: rgba(255, 255, 255, 0.5);
}

.presentation-table th.col-code,
.presentation-table th.col-title,
.presentation-table th.col-notes,
.presentation-table td.col-code,
.presentation-table td.col-title,
.presentation-table td.col-notes {
  font-family: "PP Supply Mono", "PP Supply Mono Light", "JetBrains Mono", "Courier New", monospace;
}

.image-preview {
  position: fixed;
  right: 100px;
  width: 450px;
  max-height: 80vh;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.2s ease, top 0.2s ease;
  z-index: 10;
  background: transparent;
  box-shadow: none;
  border-radius: 0;
  overflow: hidden;
  margin: 0;
  padding: 0;
  transform: none;
  /* Top position will be set by JavaScript */
}

.image-preview.active {
  opacity: 1;
  pointer-events: auto;
}

.image-carousel {
  position: relative;
  width: 100%;
  height: 450px;
  min-height: 450px;
  transform-style: preserve-3d;
  transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
}

.image-carousel img {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: contain;
  object-position: center;
  backface-visibility: visible;
  opacity: 0;
  transform: rotateY(90deg) translateZ(250px);
  transition: opacity 0.3s ease, transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  transform-style: preserve-3d;
  transform-origin: center center;
  display: block;
  max-width: 100%;
  max-height: 100%;
}

.image-carousel img.active {
  opacity: 1;
  transform: rotateY(0deg) translateZ(0px);
  z-index: 2;
}

.image-carousel img.transitioning-out-left {
  opacity: 0;
  transform: rotateY(-90deg) translateZ(250px);
  z-index: 1;
}

.image-carousel img.transitioning-out-right {
  opacity: 0;
  transform: rotateY(90deg) translateZ(250px);
  z-index: 1;
}

.image-carousel img.transitioning-in-left {
  opacity: 1;
  transform: rotateY(90deg) translateZ(250px);
  z-index: 3;
}

.image-carousel img.transitioning-in-right {
  opacity: 1;
  transform: rotateY(-90deg) translateZ(250px);
  z-index: 3;
}

.image-caption {
  display: none;
}

.presentation-row:hover ~ .image-preview,
.presentation-row:hover .image-preview {
  opacity: 1;
}

@media (max-width: 1200px) {
  .image-preview {
    width: 400px;
    right: 20px;
  }
}

@media (max-width: 968px) {
  .image-preview {
    position: fixed !important;
    right: 20px !important;
    top: auto !important;
    transform: none !important;
    width: 100%;
    max-height: none;
    margin-top: 0 !important;
    display: none;
  }
  
  .image-preview.active {
    display: block;
  }
  
  .presentation-table {
    font-size: 12px;
  }
  
  .presentation-table th,
  .presentation-table td {
    padding: 12px 10px;
  }
  
  .col-code {
    width: 20%;
  }
  
  .col-title {
    width: 30%;
  }
  
  .col-notes {
    width: 50%;
  }
}

@media (max-width: 600px) {
  .presentation-container {
    padding: 0 10px;
    margin: 20px auto;
  }
  
  .presentation-table {
    font-size: 11px;
  }
  
  .presentation-table th,
  .presentation-table td {
    padding: 10px 8px;
  }
  
  .col-code {
    width: 25%;
  }
  
  .col-title {
    width: 75%;
  }
  
  .col-notes {
    display: none;
  }
}
</style>

<script>
// Register service worker for image caching
if ('serviceWorker' in navigator) {
  window.addEventListener('load', function() {
    navigator.serviceWorker.register('{{ "/sw.js" | relative_url }}')
      .then(function(registration) {
        console.log('ServiceWorker registration successful');
      })
      .catch(function(err) {
        console.log('ServiceWorker registration failed: ', err);
      });
  });
}

document.addEventListener('DOMContentLoaded', function() {
  // Change header title for photos page
  const siteTitle = document.querySelector('.site-header .site-title');
  if (siteTitle) {
    siteTitle.textContent = "ferdie jay's photos";
  }
  
  // Add grey borders around each bracketed element in table cells
  function addBordersToTableElements() {
    const tableCells = document.querySelectorAll('.presentation-table td.col-title, .presentation-table td.col-notes');
    tableCells.forEach(cell => {
      let content = cell.innerHTML;
      // Wrap each bracketed element [content] in a span with border class
      content = content.replace(/\[([^\]]+)\]/g, '<span class="table-element">[$1]</span>');
      cell.innerHTML = content;
    });
  }
  
  // Call the function to add borders
  addBordersToTableElements();
  
  // Project filter functionality
  const projectFilters = document.getElementById('projectFilters');
  const projectContainers = document.querySelectorAll('.project-container');
  const projectButtons = {};
  
  // Show first project by default
  if (projectContainers.length > 0) {
    projectContainers[0].style.display = 'block';
  }
  
  // Create filter buttons for each project (hidden, not used)
  projectContainers.forEach(container => {
    const projectName = container.dataset.project;
    const button = document.createElement('button');
    button.className = 'project-filter-btn';
    button.textContent = projectName;
    button.dataset.project = projectName;
    projectFilters.appendChild(button);
    projectButtons[projectName] = button;
    
    if (projectContainers[0] === container) {
      button.classList.add('active');
    }
    
    // Toggle project on button click
    button.addEventListener('click', function() {
      const isVisible = container.style.display !== 'none';
      const toggleBtn = container.querySelector('.project-toggle');
      
      if (isVisible) {
        container.style.display = 'none';
        button.classList.remove('active');
      } else {
        container.style.display = 'block';
        button.classList.add('active');
      }
    });
  });
  
  // Toggle button functionality
  document.querySelectorAll('.project-toggle').forEach(toggleBtn => {
    toggleBtn.addEventListener('click', function() {
      const projectName = this.dataset.project;
      const container = document.querySelector(`.project-container[data-project="${projectName}"]`);
      const filterBtn = projectButtons[projectName];
      
      if (container.style.display !== 'none') {
        container.style.display = 'none';
        if (filterBtn) filterBtn.classList.remove('active');
      } else {
        container.style.display = 'block';
        if (filterBtn) filterBtn.classList.add('active');
      }
    });
  });
  
  // Get elements - query rows from all containers (including hidden ones)
  const rows = document.querySelectorAll('.presentation-row');
  const preview = document.getElementById('imagePreview');
  const carousel = document.getElementById('imageCarousel');
  const previewCaption = document.getElementById('previewCaption');
  
  // Verify elements exist
  if (!preview || !carousel) {
    console.error('Image preview elements not found');
    return;
  }
  
  if (rows.length === 0) {
    console.warn('No presentation rows found');
  }
  
  // Get all photos from data
  const allPhotos = [
    {% for photo in site.data.photos %}
      {
        image: "{{ photo.image | relative_url }}",
        title: "{{ photo.title | default: 'Untitled' }}",
        notes: "{{ photo.notes | default: photo.caption | default: '' }}"
      }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ];
  
  let currentPhotoIndex = -1;
  let hoverTimeout = null;
  let isScrolling = false;
  let scrollTimeout = null;
  
  // Create a map of photo indices to rows for scroll tracking (initialize early)
  const photoIndexToRowMap = new Map();
  
  // Track if we're currently hovering (to prevent scroll handler from interfering)
  let isHovering = false;
  
  // Scroll handler - update preview position when scrolling
  let scrollRAF = null;
  window.addEventListener('scroll', function() {
    if (preview.classList.contains('active') && currentPhotoIndex >= 0) {
      const hoveredRow = photoIndexToRowMap.get(currentPhotoIndex);
      if (hoveredRow) {
        if (scrollRAF) cancelAnimationFrame(scrollRAF);
        scrollRAF = requestAnimationFrame(function() {
          const rowRect = hoveredRow.getBoundingClientRect();
          const topValue = Math.round(rowRect.top);
          preview.style.position = 'fixed';
          preview.style.top = topValue + 'px';
          preview.style.right = '100px';
          preview.style.left = 'auto';
          preview.style.margin = '0';
          preview.style.padding = '0';
          preview.style.transform = 'none';
          scrollRAF = null;
        });
      }
    }
  }, { passive: true });
  
  // Create image elements for carousel (lazy loading - don't set src until needed)
  const imageElements = [];
  const imageCache = new Map(); // Cache for loaded images
  let preloadIndex = 0;
  let isPreloading = false;
  
  // Clear carousel first
  carousel.innerHTML = '';
  imageElements.length = 0;
  
  allPhotos.forEach((photo, index) => {
    const img = document.createElement('img');
    img.alt = photo.title;
    img.loading = 'lazy'; // Native lazy loading
    img.dataset.src = photo.image; // Store source in data attribute
    img.style.display = 'none'; // Hide until loaded
    carousel.appendChild(img);
    imageElements.push(img);
  });
  
  console.log('Created', imageElements.length, 'image elements for', allPhotos.length, 'photos');
  
  // Function to load an image when needed
  function loadImage(index) {
    if (index < 0 || index >= imageElements.length) return;
    const img = imageElements[index];
    if (!img.src && img.dataset.src) {
      // Check if image is already cached
      if (imageCache.has(img.dataset.src)) {
        img.src = img.dataset.src;
        img.style.display = 'block';
        return;
      }
      
      img.src = img.dataset.src;
      img.style.display = 'block';
      // Cache the image once loaded
      img.onload = function() {
        img.style.display = 'block';
        imageCache.set(img.dataset.src, true);
      };
      img.onerror = function() {
        console.error('Failed to load image:', img.dataset.src);
      };
    } else if (img.src) {
      img.style.display = 'block';
    }
  }
  
  // Background preloading: Load images progressively after page load
  function preloadImages() {
    if (isPreloading || preloadIndex >= imageElements.length) return;
    isPreloading = true;
    
    // Preload images in batches to avoid overwhelming the browser
    const batchSize = 3; // Load 3 images at a time
    let loadedInBatch = 0;
    
    function preloadNext() {
      // Check bounds first
      if (preloadIndex >= imageElements.length) {
        isPreloading = false;
        return;
      }
      
      const img = imageElements[preloadIndex];
      preloadIndex++; // Increment before processing to prevent infinite recursion
      
      if (!img || !img.dataset.src) {
        // Skip if no image or no src, continue to next
        if (loadedInBatch < batchSize) {
          preloadNext();
        } else {
          loadedInBatch = 0;
          setTimeout(preloadNext, 100);
        }
        return;
      }
      
      if (img.src || imageCache.has(img.dataset.src)) {
        // Already loaded or cached, continue to next
        if (loadedInBatch < batchSize) {
          preloadNext();
        } else {
          loadedInBatch = 0;
          setTimeout(preloadNext, 100);
        }
        return;
      }
      
      // Create a new image element for preloading (doesn't affect display)
      const preloadImg = new Image();
      preloadImg.src = img.dataset.src;
      preloadImg.onload = function() {
        imageCache.set(img.dataset.src, true);
        // Update the actual img element's src if it hasn't been set yet
        if (!img.src) {
          img.src = img.dataset.src;
        }
        loadedInBatch++;
        if (preloadIndex < imageElements.length && loadedInBatch < batchSize) {
          preloadNext();
        } else {
          loadedInBatch = 0;
          if (preloadIndex < imageElements.length) {
            // Small delay between batches to avoid blocking
            setTimeout(preloadNext, 100);
          } else {
            isPreloading = false;
          }
        }
      };
      preloadImg.onerror = function() {
        loadedInBatch++;
        if (preloadIndex < imageElements.length && loadedInBatch < batchSize) {
          preloadNext();
        } else {
          loadedInBatch = 0;
          if (preloadIndex < imageElements.length) {
            setTimeout(preloadNext, 100);
          } else {
            isPreloading = false;
          }
        }
      };
    }
    
    // Start preloading after a short delay to let page render first
    setTimeout(() => {
      preloadNext();
    }, 500);
  }
  
  // Start background preloading after page is fully loaded
  if (document.readyState === 'complete') {
    preloadImages();
  } else {
    window.addEventListener('load', preloadImages);
  }
  
  function updateCarousel(index, previousIndex, direction) {
    const images = carousel.querySelectorAll('img');
    
    // Validate indices
    if (index < 0 || index >= images.length) return;
    if (previousIndex !== undefined && previousIndex !== -1 && (previousIndex < 0 || previousIndex >= images.length)) {
      previousIndex = -1;
    }
    
    // Load the image if not already loaded
    loadImage(index);
    
    // Determine rotation direction: 'left' (up) or 'right' (down)
    let rotationDirection = direction;
    if (previousIndex !== undefined && previousIndex !== -1 && previousIndex !== index && !isScrolling) {
      if (!rotationDirection) {
        // Auto-detect direction based on index comparison (reversed)
        rotationDirection = index < previousIndex ? 'right' : 'left';
      }
      
      // Animate out the previous image
      const prevImg = images[previousIndex];
      if (prevImg && prevImg.classList.contains('active')) {
        prevImg.classList.remove('active');
        prevImg.classList.add(rotationDirection === 'left' ? 'transitioning-out-left' : 'transitioning-out-right');
      }
      
      // Animate in the new image from the opposite direction
      const newImg = images[index];
      if (newImg) {
        // Wait for image to load before animating
        if (!newImg.complete || newImg.naturalWidth === 0) {
          newImg.onload = function() {
            animateImageIn(newImg, rotationDirection, index);
          };
        } else {
          animateImageIn(newImg, rotationDirection, index);
        }
      }
    } else {
      // First image or no previous - just show it
      images.forEach((img, i) => {
        if (i === index) {
          // Wait for image to load before showing
          if (!img.complete || img.naturalWidth === 0) {
            img.onload = function() {
              img.classList.remove('transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
              img.classList.add('active');
            };
          } else {
            img.classList.remove('transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
            img.classList.add('active');
          }
        } else {
          img.classList.remove('active', 'transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
        }
      });
    }
    
    if (previewCaption) {
      previewCaption.textContent = allPhotos[index].notes || allPhotos[index].title;
    }
  }
  
  function animateImageIn(newImg, rotationDirection, index) {
    // Remove all classes first
    newImg.classList.remove('active', 'transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
    // Start from the opposite side
    newImg.classList.add(rotationDirection === 'left' ? 'transitioning-in-left' : 'transitioning-in-right');
    
    // Transition to active after a brief delay to ensure the starting state is applied
    setTimeout(() => {
      // Double-check the image is still the intended one before making it active
      if (currentPhotoIndex === index && newImg) {
        newImg.classList.remove('transitioning-in-left', 'transitioning-in-right');
        newImg.classList.add('active');
      }
    }, 50);
  }
  
  // Create a map of image URLs to photo indices for fast lookup
  const photoIndexMap = new Map();
  allPhotos.forEach((photo, index) => {
    photoIndexMap.set(photo.image, index);
  });
  
  console.log('Setting up hover handlers for', rows.length, 'rows');
  
  rows.forEach((row, rowIndex) => {
    const imageUrl = row.getAttribute('data-image');
    // Get photo index from cached map
    const photoIndex = photoIndexMap.get(imageUrl);
    
    if (photoIndex === undefined) {
      console.warn('Photo not found for URL:', imageUrl);
      return;
    }
    
    // Store row reference for this photo index
    photoIndexToRowMap.set(photoIndex, row);
    
    row.addEventListener('mouseenter', function() {
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
      }
      
      hoverTimeout = setTimeout(function() {
        if (photoIndex >= 0 && photoIndex < allPhotos.length) {
          const previousIndex = currentPhotoIndex;
          let direction = null;
          if (previousIndex !== -1 && previousIndex !== photoIndex && previousIndex >= 0 && previousIndex < allPhotos.length) {
            direction = photoIndex < previousIndex ? 'right' : 'left';
          }
          currentPhotoIndex = photoIndex;
          
          // Ensure preview is in body (not nested in containers)
          if (preview.parentElement !== document.body) {
            document.body.appendChild(preview);
          }
          
          // Get row position immediately for faster response
          const rowRect = row.getBoundingClientRect();
          const topValue = Math.round(rowRect.top);
          preview.style.position = 'fixed';
          preview.style.top = topValue + 'px';
          preview.style.right = '100px';
          preview.style.left = 'auto';
          preview.style.margin = '0';
          preview.style.padding = '0';
          preview.style.transform = 'none';
          
          loadImage(photoIndex);
          updateCarousel(currentPhotoIndex, previousIndex, direction);
          preview.classList.add('active');
        }
        hoverTimeout = null;
      }, 0);
    });
    
    row.addEventListener('mouseleave', function() {
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
      }
      preview.classList.remove('active');
    });
  });
  
});
</script>
