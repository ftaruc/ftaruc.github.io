---
layout: page
title: 
permalink: /photos/
---

<div class="presentation-container">
  <div class="project-filters" id="projectFilters">
    <!-- Project buttons will be dynamically inserted here -->
  </div>
  
  {% assign projects = site.data.photos | group_by_exp: "photo", "photo.code | split: '-' | first" %}
  {% for project_group in projects %}
    {% assign project_name = project_group.name %}
    <div class="project-container" data-project="{{ project_name }}" style="display: none;">
      <div class="project-header">
        <h2 class="project-title">{{ project_name }}</h2>
        <button class="project-toggle" data-project="{{ project_name }}">Hide</button>
      </div>
      <table class="presentation-table">
        <thead>
          <tr>
            <th class="col-code">No.</th>
            <th class="col-title">Title</th>
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
              <td class="col-title">{{ photo.title | default: 'Untitled' }}</td>
              <td class="col-notes">{{ photo.notes | default: photo.caption | default: '' }}</td>
            </tr>
          {% endfor %}
        </tbody>
      </table>
    </div>
  {% endfor %}
  
  <div class="image-preview" id="imagePreview">
    <div class="image-carousel" id="imageCarousel">
      <!-- Images will be dynamically inserted here -->
    </div>
    <div class="image-caption" id="previewCaption"></div>
  </div>
</div>

<style>
/* Override wrapper and page-content for photos page only */
body .page-content {
  max-width: 100% !important;
  padding: 0 !important;
  margin: 0 !important;
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
  margin-bottom: 0 !important;
  min-height: 56px !important;
  padding: 0 !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
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
  font-family: 'Courier New', monospace !important;
  font-size: 14px !important;
  font-weight: 400 !important;
  letter-spacing: 0 !important;
  line-height: 56px !important;
  padding: 0 !important;
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

.project-filters {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 30px;
  padding: 20px 0;
  justify-content: center;
}

.project-filter-btn {
  padding: 10px 20px;
  background-color: #000000;
  color: #ffffff;
  border: 1px solid #000000;
  cursor: pointer;
  font-family: 'Courier New', monospace;
  font-size: 14px;
  font-weight: 400;
  letter-spacing: 0;
  transition: all 0.2s ease;
}

.project-filter-btn:hover {
  background-color: #ffffff;
  color: #000000;
}

.project-filter-btn.active {
  background-color: #ffffff;
  color: #000000;
}

.project-container {
  margin-bottom: 40px;
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #000000;
}

.project-title {
  font-family: 'Courier New', monospace;
  font-size: 14px;
  font-weight: 400;
  letter-spacing: 0;
  margin: 0;
  text-transform: capitalize;
}

.project-toggle {
  padding: 5px 15px;
  background-color: transparent;
  color: #000000;
  border: 1px solid #000000;
  cursor: pointer;
  font-family: 'Courier New', monospace;
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
  font-family: 'Courier New', monospace;
  font-size: 14px;
  font-weight: 400;
  letter-spacing: 0;
  background: transparent;
}

.presentation-table thead {
  border-bottom: 1px solid #000;
}

.presentation-table th {
  text-align: left;
  padding: 15px 20px;
  font-weight: normal;
  text-transform: none;
  letter-spacing: 0;
  font-size: 14px;
}

.presentation-table td {
  padding: 20px;
  border-bottom: 1px solid #e0e0e0;
  vertical-align: top;
  background: rgba(255, 255, 255, 0.95);
  transition: background 0.2s ease;
}

.presentation-row {
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.presentation-row:hover td {
  background-color: rgba(255, 255, 255, 0.98);
}

.col-code {
  width: 15%;
  font-weight: 500;
  font-family: 'Courier New', monospace;
}

.col-title {
  width: 25%;
  font-weight: 500;
}

.col-notes {
  width: 60%;
  color: #666;
  line-height: 1.6;
}

.image-preview {
  position: fixed;
  right: 40px;
  top: 50%;
  transform: translateY(-50%);
  width: 500px;
  max-height: 80vh;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.3s ease;
  z-index: 10;
  background: transparent;
  box-shadow: none;
  border-radius: 0;
  overflow: visible;
  perspective: 1500px;
  perspective-origin: center center;
}

.image-preview.active {
  opacity: 1;
  pointer-events: auto;
}

.image-carousel {
  position: relative;
  width: 100%;
  height: 500px;
  transform-style: preserve-3d;
  transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.image-carousel img {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: contain;
  backface-visibility: visible;
  filter: grayscale(100%);
  opacity: 0;
  transform: rotateY(90deg) translateZ(250px);
  transition: opacity 0.8s ease, transform 1.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
  transform-style: preserve-3d;
  transform-origin: center center;
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
    position: relative;
    right: auto;
    top: auto;
    transform: none;
    width: 100%;
    max-height: none;
    margin-top: 30px;
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
document.addEventListener('DOMContentLoaded', function() {
  // Change header title for photos page
  const siteTitle = document.querySelector('.site-header .site-title');
  if (siteTitle) {
    siteTitle.textContent = "ferdie jay taruc's photos";
  }
  
  // Project filter functionality
  const projectFilters = document.getElementById('projectFilters');
  const projectContainers = document.querySelectorAll('.project-container');
  const projectButtons = {};
  
  // Create filter buttons for each project
  projectContainers.forEach(container => {
    const projectName = container.dataset.project;
    const button = document.createElement('button');
    button.className = 'project-filter-btn';
    button.textContent = projectName;
    button.dataset.project = projectName;
    projectFilters.appendChild(button);
    projectButtons[projectName] = button;
    
    // Show first project by default
    if (projectContainers[0] === container) {
      container.style.display = 'block';
      button.classList.add('active');
      // Set toggle button to "Hide" for visible projects
      const toggleBtn = container.querySelector('.project-toggle');
      if (toggleBtn) {
        toggleBtn.textContent = 'Hide';
      }
    } else {
      // Set toggle button to "Show" for hidden projects
      const toggleBtn = container.querySelector('.project-toggle');
      if (toggleBtn) {
        toggleBtn.textContent = 'Show';
      }
    }
    
    // Toggle project on button click
    button.addEventListener('click', function() {
      const isVisible = container.style.display !== 'none';
      const toggleBtn = container.querySelector('.project-toggle');
      
      if (isVisible) {
        container.style.display = 'none';
        button.classList.remove('active');
        if (toggleBtn) toggleBtn.textContent = 'Show';
      } else {
        container.style.display = 'block';
        button.classList.add('active');
        if (toggleBtn) toggleBtn.textContent = 'Hide';
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
        this.textContent = 'Show';
        if (filterBtn) filterBtn.classList.remove('active');
      } else {
        container.style.display = 'block';
        this.textContent = 'Hide';
        if (filterBtn) filterBtn.classList.add('active');
      }
    });
  });
  
  const rows = document.querySelectorAll('.presentation-row');
  const preview = document.getElementById('imagePreview');
  const carousel = document.getElementById('imageCarousel');
  const previewCaption = document.getElementById('previewCaption');
  
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
  
  // Track scrolling to prevent direction errors
  window.addEventListener('scroll', function() {
    isScrolling = true;
    // Clear any pending hover timeouts during scroll
    if (hoverTimeout) {
      clearTimeout(hoverTimeout);
      hoverTimeout = null;
    }
    // Reset scrolling flag after scroll ends
    clearTimeout(scrollTimeout);
    scrollTimeout = setTimeout(function() {
      isScrolling = false;
    }, 150);
  }, { passive: true });
  
  // Create image elements for carousel
  allPhotos.forEach((photo, index) => {
    const img = document.createElement('img');
    img.src = photo.image;
    img.alt = photo.title;
    carousel.appendChild(img);
  });
  
  function updateCarousel(index, previousIndex, direction) {
    const images = carousel.querySelectorAll('img');
    
    // Validate indices
    if (index < 0 || index >= images.length) return;
    if (previousIndex !== undefined && previousIndex !== -1 && (previousIndex < 0 || previousIndex >= images.length)) {
      previousIndex = -1;
    }
    
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
    } else {
      // First image or no previous - just show it
      images.forEach((img, i) => {
        if (i === index) {
          img.classList.remove('transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
          img.classList.add('active');
        } else {
          img.classList.remove('active', 'transitioning-out-left', 'transitioning-out-right', 'transitioning-in-left', 'transitioning-in-right');
        }
      });
    }
    
    if (previewCaption) {
      previewCaption.textContent = allPhotos[index].notes || allPhotos[index].title;
    }
  }
  
  rows.forEach((row, rowIndex) => {
    const imageUrl = row.getAttribute('data-image');
    const photoIndex = rowIndex;
    
    row.addEventListener('mouseenter', function() {
      // Clear any pending timeout
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
        hoverTimeout = null;
      }
      
      // Add a slight delay before showing the photo
      hoverTimeout = setTimeout(function() {
        // Don't update if still scrolling
        if (isScrolling) {
          hoverTimeout = null;
          return;
        }
        
        if (imageUrl && photoIndex >= 0 && photoIndex < allPhotos.length) {
          const previousIndex = currentPhotoIndex;
          // Determine direction: if moving to a row above (lower index), rotate right; if below (higher index), rotate left (reversed)
          let direction = null;
          if (previousIndex !== -1 && previousIndex !== photoIndex && previousIndex >= 0 && previousIndex < allPhotos.length) {
            direction = photoIndex < previousIndex ? 'right' : 'left';
          }
          currentPhotoIndex = photoIndex;
          updateCarousel(currentPhotoIndex, previousIndex, direction);
          preview.classList.add('active');
        }
        hoverTimeout = null;
      }, 150); // 150ms delay
    });
    
    row.addEventListener('mouseleave', function() {
      // Clear timeout if user leaves before delay completes
      if (hoverTimeout) {
        clearTimeout(hoverTimeout);
        hoverTimeout = null;
      }
      preview.classList.remove('active');
    });
  });
  
});
</script>
