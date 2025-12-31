---
layout: page
title: 
permalink: /photos/
---

<div class="presentation-container">
  <div class="photos-nav">
    <a href="{{ '/' | relative_url }}" class="home-button">home</a>
  </div>
  <!-- Instagram-style random photo display -->
  <div class="instagram-photo-container" id="instagramPhotoContainer">
    <div class="instagram-photo-box">
      <!-- Instagram-style header -->
      <div class="instagram-header">
        <div class="instagram-profile">
          <div class="instagram-avatar">
            <img src="{{ '/images/archive photos/ig.jpg' | relative_url }}" alt="Profile" id="instagramAvatar">
          </div>
          <a href="https://www.instagram.com/ferdie.jpg/" target="_blank" rel="noopener noreferrer" class="instagram-username">ferdie.jpeg</a>
        </div>
        <div class="instagram-menu">
          <span class="instagram-menu-dots">⋯</span>
        </div>
      </div>
      
      <!-- Photo section -->
      <div class="instagram-photo-section">
        <div class="instagram-photo-wrapper" id="instagramPhotoWrapper">
          <img class="instagram-photo" id="instagramPhoto" src="" alt="Random photo">
          <div class="instagram-photo-overlay">
            <div class="instagram-photo-info">
              <span class="instagram-photo-code" id="instagramPhotoCode"></span>
              <span class="instagram-photo-timestamp" id="instagramPhotoTimestamp"></span>
            </div>
          </div>
        </div>
        <div class="instagram-photo-next" id="instagramPhotoNext">
          <img class="instagram-photo" src="" alt="Next photo">
        </div>
      </div>
      
      <!-- Instagram-style actions (optional, for future use) -->
      <div class="instagram-actions">
        <div class="instagram-action-icons">
          <svg class="instagram-icon" aria-label="Like" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" height="24" role="img" viewBox="0 0 24 24" width="24">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
          </svg>
          <svg class="instagram-icon" aria-label="Comment" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24">
            <path d="M20.656 17.008a9.993 9.993 0 1 0-3.59 3.615L22 22Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
          </svg>
          <svg class="instagram-icon" aria-label="Share" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24">
            <line fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2" x1="22" x2="9.218" y1="3" y2="10.082"></line>
            <polygon fill="none" points="11.698 20.334 22 3 2 3 9.218 10.084 11.698 20.334" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon>
          </svg>
        </div>
        <div class="instagram-nav-dots" id="instagramNavDots">
          <!-- Navigation dots will be dynamically inserted here -->
        </div>
        <div class="instagram-action-save">
          <svg class="instagram-icon" aria-label="Save" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24">
            <polygon fill="none" points="20 21 12 13.44 4 21 4 3 20 3 20 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></polygon>
          </svg>
        </div>
      </div>
    </div>
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
      <div class="project-container" data-project="{{ project_name }}">
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

<!-- Full-size image modal -->
<div class="instagram-fullsize-modal" id="instagramFullsizeModal">
  <div class="instagram-fullsize-overlay"></div>
  <div class="instagram-fullsize-container">
    <img class="instagram-fullsize-image" id="instagramFullsizeImage" src="" alt="Full size photo">
    <button class="instagram-fullsize-close" id="instagramFullsizeClose">×</button>
  </div>
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
  padding: 0 20px 300px 20px; /* Add more bottom padding to push footer further down */
  position: relative;
}

/* Fixed footer at bottom of viewport */
.site-footer {
  position: fixed !important;
  bottom: 0 !important;
  left: 0 !important;
  right: 0 !important;
  width: 100% !important;
  z-index: 1000 !important;
  background-color: #f5f5f5 !important;
  border-top: none !important; /* Removed line break */
  padding: 10px 0 !important;
  margin: 0 !important;
  margin-bottom: 100px !important; /* Move footer further down */
}

.site-footer .wrapper {
  max-width: 1400px !important;
  margin: 0 auto !important;
  padding: 0 20px !important;
  text-align: center !important;
}

.site-footer p {
  margin: 0 !important;
  padding: 0 !important;
  font-size: 12px !important;
  color: #666666 !important;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif !important;
}

.photos-nav {
  margin-bottom: 20px;
  padding: 0;
}

/* Instagram-style random photo display */
.instagram-photo-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 30px auto 45px auto;
  width: 100%;
  max-width: 525px; /* Reduced size (75% of 700px) */
}

.instagram-photo-box {
  position: relative;
  width: 100%;
  max-width: 525px; /* Reduced size (75% of 700px) */
  background-color: #f5f5f5; /* Match page background */
  border: none; /* Removed border for seamless blending */
  border-radius: 0; /* Removed border radius */
  overflow: hidden;
  box-shadow: none; /* Removed shadow for seamless blending */
}

/* Instagram header */
.instagram-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 15px; /* Reduced padding (75%) */
  border-bottom: none; /* Removed border for seamless blending */
  background-color: #f5f5f5; /* Match page background */
}

.instagram-profile {
  display: flex;
  align-items: center;
  gap: 12px; /* Reduced gap (75%) */
}

.instagram-avatar {
  width: 32px; /* Reduced size (75% of 42px) */
  height: 32px; /* Reduced size (75% of 42px) */
  border-radius: 50%;
  overflow: hidden;
  border: 1px solid #dbdbdb;
  flex-shrink: 0;
}

.instagram-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.instagram-username {
  font-size: 12px; /* Reduced font size (75% of 16px) */
  font-weight: 600;
  color: #262626 !important; /* Keep original color */
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
  letter-spacing: -0.01em;
  user-select: none;
  -webkit-user-select: none;
  text-decoration: none !important; /* Remove underline */
  cursor: pointer;
  transition: opacity 0.2s ease;
}

.instagram-username:hover {
  opacity: 0.6;
  color: #262626 !important; /* Keep original color on hover */
}

.instagram-username:visited {
  color: #262626 !important; /* Keep original color when visited */
}

.instagram-username:active {
  color: #262626 !important; /* Keep original color when clicked */
}

.instagram-menu {
  cursor: pointer;
  padding: 4.5px; /* Reduced padding (75%) */
}

.instagram-menu-dots {
  font-size: 18px; /* Reduced size (75% of 24px) */
  color: #262626;
  line-height: 1;
  user-select: none;
  -webkit-user-select: none;
  cursor: pointer;
  transition: opacity 0.2s ease;
}

.instagram-menu-dots:hover {
  opacity: 0.7;
}

/* Photo section */
.instagram-photo-section {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 10; /* Slightly taller rectangular format (landscape) */
  overflow: hidden;
  cursor: pointer;
}

.instagram-photo-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.instagram-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
  user-select: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  pointer-events: none;
}

.instagram-photo-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.7) 0%, rgba(0, 0, 0, 0.4) 50%, transparent 100%);
  padding: 20px 15px 15px 15px;
  opacity: 0;
  transition: opacity 0.3s ease;
  pointer-events: none;
  visibility: hidden;
}

.instagram-photo-overlay.show {
  opacity: 1;
  visibility: visible;
}

/* Instagram actions bar */
.instagram-actions {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 15px; /* Reduced padding (75%) */
  border-top: none; /* Removed border for seamless blending */
  background-color: #f5f5f5; /* Match page background */
}

.instagram-action-icons {
  display: flex;
  align-items: center;
  gap: 15px; /* Reduced gap (75%) */
}

.instagram-nav-dots {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  flex: 1;
  position: relative;
  overflow: hidden; /* Hide dots that shift outside */
}

.instagram-nav-dots-wrapper {
  display: flex;
  align-items: center;
  gap: 6px;
  position: relative;
  transition: transform 0.3s ease;
}

/* Swiping animation classes for dots - matches photo animation timing */
.instagram-nav-dots-wrapper.swiping-forward {
  animation: swipeDotsLeft 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.instagram-nav-dots-wrapper.swiping-backward {
  animation: swipeDotsRight 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

@keyframes swipeDotsLeft {
  0% {
    transform: translateX(12px); /* Start shifted right (one dot width + gap) */
    opacity: 0.5;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

@keyframes swipeDotsRight {
  0% {
    transform: translateX(-12px); /* Start shifted left (one dot width + gap) */
    opacity: 0.5;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

.instagram-nav-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background-color: #8e8e8e;
  cursor: pointer;
  position: relative;
  z-index: 1;
  transition: background-color 0.3s ease;
}

.instagram-nav-dot.active {
  opacity: 0; /* Completely hide active dot to prevent double dot appearance */
  pointer-events: none; /* Disable clicks on hidden dot */
  background-color: transparent; /* Make sure no background shows */
}

/* Full-size image modal */
.instagram-fullsize-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 10000;
  display: none;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.instagram-fullsize-modal.active {
  display: flex;
  opacity: 1;
}

.instagram-fullsize-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.9);
  cursor: pointer;
}

.instagram-fullsize-container {
  position: relative;
  max-width: 90vw;
  max-height: 90vh;
  z-index: 10001;
  display: flex;
  align-items: center;
  justify-content: center;
}

.instagram-fullsize-image {
  max-width: 100%;
  max-height: 90vh;
  object-fit: contain;
  display: block;
}

.instagram-fullsize-close {
  position: absolute;
  top: -40px;
  right: 0;
  background: none;
  border: none;
  color: #ffffff;
  font-size: 40px;
  cursor: pointer;
  padding: 0;
  width: 40px;
  height: 40px;
  line-height: 1;
  z-index: 10002;
  transition: opacity 0.2s ease;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
}

.instagram-fullsize-close:hover {
  opacity: 0.7;
}

.instagram-nav-dot-indicator {
  position: absolute;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background-color: #0095f6;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  transform-origin: center center;
  z-index: 10; /* Higher z-index to ensure it's above dots */
  transition: none; /* Instant transition, no animation */
  pointer-events: none;
}

.instagram-action-save {
  display: flex;
  align-items: center;
}

.instagram-icon {
  width: 21px; /* Reduced icon size (75% of 28px) */
  height: 21px; /* Reduced icon size (75% of 28px) */
  color: #262626;
  cursor: pointer;
  user-select: none;
  -webkit-user-select: none;
  line-height: 1;
  transition: opacity 0.2s ease;
  display: inline-block;
  vertical-align: middle;
}

.instagram-icon:hover {
  opacity: 0.6;
}

.instagram-photo-info {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.instagram-photo-code {
  color: #ffffff;
  font-size: 10px; /* Reduced font size (75% of 13px) */
  font-weight: 500;
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
  letter-spacing: 0.4px; /* Reduced letter spacing */
}

.instagram-photo-timestamp {
  color: rgba(255, 255, 255, 0.9);
  font-size: 8px; /* Reduced font size (75% of 11px) */
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
}

.instagram-photo-next {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  pointer-events: none;
  transform: translateX(100%);
  opacity: 0;
  transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.instagram-photo-next img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Swipe animation classes */
.instagram-photo-wrapper.swiping-left {
  animation: swipeLeft 0.5s cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

.instagram-photo-wrapper.swiping-right {
  animation: swipeRight 0.5s cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

.instagram-photo-next.swiping-in-left {
  animation: swipeInLeft 0.5s cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

.instagram-photo-next.swiping-in-right {
  animation: swipeInRight 0.5s cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

@keyframes swipeLeft {
  0% {
    transform: translateX(0);
    opacity: 1;
  }
  100% {
    transform: translateX(-100%);
    opacity: 0;
  }
}

@keyframes swipeRight {
  0% {
    transform: translateX(0);
    opacity: 1;
  }
  100% {
    transform: translateX(100%);
    opacity: 0;
  }
}

@keyframes swipeInLeft {
  0% {
    transform: translateX(100%);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

@keyframes swipeInRight {
  0% {
    transform: translateX(-100%);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
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
  display: none; /* Hide all containers by default */
  visibility: visible;
  opacity: 1;
  height: auto;
  min-height: 0;
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
  padding-bottom: 0;
  border-bottom: 1px solid #666666; /* Slightly lighter black for line break */
}

.project-title {
  display: none;
}

.project-toggle {
  padding: 5px 15px;
  background-color: #f5f5f5;
  color: #666666; /* Slightly lighter black for button text */
  border: 1px solid #666666; /* Slightly lighter black for button border */
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
  position: fixed !important;
  width: 450px;
  max-height: 80vh;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.4s ease;
  /* Explicitly disable transitions on position properties */
  transition-property: opacity !important;
  z-index: 9999;
  background: transparent;
  box-shadow: none;
  border-radius: 0;
  overflow: hidden;
  margin: 0 !important;
  padding: 0 !important;
  transform: none !important;
  /* Position will be set by JavaScript at cursor */
  /* Ensure no parent transforms affect this - fixed positioning relative to viewport */
  isolation: isolate;
  /* Force positioning relative to viewport, not any parent */
  inset: unset !important; /* Remove inset to allow left/top to work */
  /* left and top will be set dynamically by JavaScript */
  right: auto !important;
  bottom: auto !important;
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
  transition: transform 0.8s cubic-bezier(0.4, 0, 0.2, 1);
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
  transition: opacity 0.6s ease, transform 0.8s cubic-bezier(0.4, 0, 0.2, 1);
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
  
  .instagram-photo-container {
    margin: 30px auto 40px auto;
    max-width: 90%;
  }
  
  .instagram-photo-box {
    max-width: 100%;
  }
  
  .instagram-header {
    padding: 8px 10px; /* Reduced for mobile */
  }
  
  .instagram-avatar {
    width: 24px; /* Reduced for mobile */
    height: 24px; /* Reduced for mobile */
  }
  
  .instagram-username {
    font-size: 10px; /* Reduced for mobile */
  }
  
  .instagram-menu-dots {
    font-size: 14px; /* Reduced for mobile */
  }
  
  .instagram-actions {
    padding: 8px 10px; /* Reduced for mobile */
  }
  
  .instagram-icon {
    width: 17px; /* Reduced for mobile */
    height: 17px; /* Reduced for mobile */
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
  
  .site-footer {
    padding: 8px 0 !important;
  }
  
  .site-footer .wrapper {
    padding: 0 10px !important;
  }
  
  .site-footer p {
    font-size: 11px !important;
  }
  
  .presentation-container {
    padding-bottom: 50px !important; /* Reduce bottom padding on mobile */
  }
}

@media (max-width: 600px) {
  .presentation-container {
    padding: 0 10px 300px 10px; /* Add more bottom padding to push footer further down */
    margin: 20px auto;
  }
  
  .instagram-photo-container {
    margin: 20px auto 30px auto;
    max-width: 95%;
  }
  
  .instagram-header {
    padding: 8px 10px;
  }
  
  .instagram-avatar {
    width: 24px;
    height: 24px;
  }
  
  .instagram-username {
    font-size: 9px; /* Further reduced for small mobile */
  }
  
  .instagram-menu-dots {
    font-size: 14px; /* Further reduced for small mobile */
  }
  
  .instagram-actions {
    padding: 6px 8px; /* Further reduced for small mobile */
  }
  
  .instagram-icon {
    width: 15px; /* Further reduced for small mobile */
    height: 15px; /* Further reduced for small mobile */
  }
  
  .instagram-action-icons {
    gap: 12px;
  }
  
  .instagram-photo-overlay {
    padding: 15px 10px 10px 10px;
  }
  
  .instagram-photo-code {
    font-size: 9px; /* Reduced for mobile */
  }
  
  .instagram-photo-timestamp {
    font-size: 8px; /* Reduced for mobile */
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
  
  .site-footer {
    padding: 6px 0 !important;
  }
  
  .site-footer p {
    font-size: 10px !important;
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
  
  // Instagram-style random photo display
  const instagramContainer = document.getElementById('instagramPhotoContainer');
  const instagramWrapper = document.getElementById('instagramPhotoWrapper');
  const instagramPhoto = document.getElementById('instagramPhoto');
  const instagramPhotoNext = document.getElementById('instagramPhotoNext');
  const instagramPhotoCode = document.getElementById('instagramPhotoCode');
  const instagramPhotoTimestamp = document.getElementById('instagramPhotoTimestamp');
  const instagramPhotoSection = instagramContainer ? instagramContainer.querySelector('.instagram-photo-section') : null;
  const instagramPhotoOverlay = instagramContainer ? instagramContainer.querySelector('.instagram-photo-overlay') : null;
  const instagramFullsizeModal = document.getElementById('instagramFullsizeModal');
  const instagramFullsizeImage = document.getElementById('instagramFullsizeImage');
  const instagramFullsizeClose = document.getElementById('instagramFullsizeClose');
  const instagramMenuDots = instagramContainer ? instagramContainer.querySelector('.instagram-menu-dots') : null;
  
  if (instagramContainer && instagramPhoto) {
    // Get all photos from data
    const allPhotosRaw = [
      {% for photo in site.data.photos %}
        {
          image: "{{ photo.image | relative_url }}",
          code: "{{ photo.code }}",
          timestamp: "{{ photo.timestamp | default: '' }}",
          title: "{{ photo.title | default: 'Untitled' }}"
        }{% unless forloop.last %},{% endunless %}
      {% endfor %}
    ];
    
    // Create randomized carousel array (different order each page load)
    const photoCarousel = [...allPhotosRaw].sort(() => Math.random() - 0.5);
    
    let currentCarouselPosition = 0; // Position in the carousel (0-indexed)
    let isAnimating = false;
    const navDots = document.getElementById('instagramNavDots');
    
    // Function to get number of dots based on position
    function getDotCount(position) {
      if (position === 0) return 3; // First photo: 3 dots
      if (position === 1) return 4; // Second photo: 4 dots
      return 5; // Third and beyond: 5 dots
    }
    
    // Function to get active dot index based on position
    function getActiveDotIndex(position) {
      if (position === 0) return 0; // First dot for first photo
      if (position === 1) return 1; // Second dot for second photo
      return 2; // Third dot for positions 3+
    }
    
    // Store previous position and active index for animation
    let previousCarouselPosition = 0;
    let previousActiveIndex = 0;
    let currentIndicatorPosition = null; // Store current indicator position
    
    // Function to update navigation dots
    function updateNavDots(direction) {
      if (!navDots) return;
      
      const dotCount = getDotCount(currentCarouselPosition);
      const activeIndex = getActiveDotIndex(currentCarouselPosition);
      
      // Check if we need to animate (position changed)
      const needsAnimation = previousCarouselPosition !== currentCarouselPosition;
      const previousDotCount = getDotCount(previousCarouselPosition);
      const previousActiveIndex = getActiveDotIndex(previousCarouselPosition);
      
      // Get or create wrapper
      let wrapper = navDots.querySelector('.instagram-nav-dots-wrapper');
      if (!wrapper) {
        wrapper = document.createElement('div');
        wrapper.className = 'instagram-nav-dots-wrapper';
        navDots.innerHTML = '';
        navDots.appendChild(wrapper);
      }
      
      // Add swiping animation class immediately (before clearing dots) to sync with photo animation
      if (needsAnimation && direction) {
        // Remove any existing animation classes
        wrapper.classList.remove('swiping-forward', 'swiping-backward');
        
        // Force reflow to ensure classes are applied
        void wrapper.offsetWidth;
        
        // Add the appropriate swiping class immediately
        if (direction === 'forward') {
          wrapper.classList.add('swiping-forward');
        } else if (direction === 'backward') {
          wrapper.classList.add('swiping-backward');
        }
        
        // Remove animation class after animation completes (matches photo animation duration)
        setTimeout(function() {
          wrapper.classList.remove('swiping-forward', 'swiping-backward');
        }, 500);
      }
      
      // Clear existing dots
      wrapper.innerHTML = '';
      
      // Create sliding indicator (outside wrapper so it stays fixed)
      let indicator = navDots.querySelector('.instagram-nav-dot-indicator');
      if (!indicator) {
        indicator = document.createElement('div');
        indicator.className = 'instagram-nav-dot-indicator';
        navDots.appendChild(indicator);
      }
      
      // Create all dots inside wrapper (skip the active one - blue indicator will be there instead)
      for (let i = 0; i < dotCount; i++) {
        // Skip creating the active dot - the blue indicator will be in its place
        if (i === activeIndex) {
          // Create a placeholder spacer to maintain layout (invisible, no click handler)
          const spacer = document.createElement('div');
          spacer.className = 'instagram-nav-dot';
          spacer.style.opacity = '0';
          spacer.style.pointerEvents = 'none';
          spacer.style.width = '6px';
          spacer.style.height = '6px';
          wrapper.appendChild(spacer);
          continue;
        }
        
        const dot = document.createElement('div');
        dot.className = 'instagram-nav-dot';
        
        // Calculate target position based on dot index
        let targetPosition = currentCarouselPosition;
        if (i < activeIndex) {
          // Clicking a dot to the left - go backward
          targetPosition = currentCarouselPosition - (activeIndex - i);
        } else if (i > activeIndex) {
          // Clicking a dot to the right - go forward
          targetPosition = currentCarouselPosition + (i - activeIndex);
        }
        
        dot.addEventListener('click', function(e) {
          e.stopPropagation(); // Prevent photo click
          // Prevent going backward from first position
          if (targetPosition !== currentCarouselPosition && targetPosition >= 0 && targetPosition < photoCarousel.length) {
            // Don't allow backward navigation from position 0
            if (currentCarouselPosition === 0 && targetPosition < currentCarouselPosition) {
              return;
            }
            const navDirection = targetPosition > currentCarouselPosition ? 'forward' : 'backward';
            navigateToPosition(targetPosition, navDirection);
          }
        });
        wrapper.appendChild(dot);
      }
      
      // Calculate pixel positions
      const dotSize = 6;
      const gap = 6;
      const totalDotWidth = dotSize + gap;
      
      // Wait for DOM to update, then calculate positions
      setTimeout(function() {
        const containerWidth = navDots.offsetWidth;
        const dotsWidth = (dotCount * dotSize) + ((dotCount - 1) * gap);
        const startOffset = (containerWidth - dotsWidth) / 2;
        
        // Calculate center position of the active dot
        const dotCenterPosition = startOffset + (activeIndex * totalDotWidth) + (dotSize / 2);
        // Adjust to center the indicator (indicator is 6px wide, so shift left by 3px to center)
        const indicatorPosition = dotCenterPosition - 3;
        
        // Calculate shift amount for wrapper based on direction
        let shiftAmount = 0;
        if (needsAnimation && direction && previousCarouselPosition >= 0) {
          // Calculate the shift needed to keep active dot centered
          const previousDotCount = getDotCount(previousCarouselPosition);
          const previousActiveIndex = getActiveDotIndex(previousCarouselPosition);
          const previousDotsWidth = (previousDotCount * dotSize) + ((previousDotCount - 1) * gap);
          const previousStartOffset = (containerWidth - previousDotsWidth) / 2;
          const previousDotCenter = previousStartOffset + (previousActiveIndex * totalDotWidth) + (dotSize / 2);
          
          // Calculate shift: positive = right, negative = left
          // When going forward: new dot is to the right, shift left (negative) to center it
          // When going backward: new dot is to the left, shift right (positive) to center it
          shiftAmount = previousDotCenter - dotCenterPosition;
        }
        
        // Animation class is added before setTimeout to sync with photo animation
        
        // Set wrapper position (centered)
        wrapper.style.transition = 'none';
        wrapper.style.transform = 'translateX(0)';
        
        // Set indicator position instantly (no scale to match dot size exactly)
        indicator.style.transition = 'none';
        indicator.style.transform = `translateX(${indicatorPosition}px) translateY(-50%)`;
        // Update stored position
        currentIndicatorPosition = dotCenterPosition;
      }, 0);
      
      // Update previous values
      previousCarouselPosition = currentCarouselPosition;
    }
    
    // Function to navigate to a specific position
    function navigateToPosition(newPosition, direction) {
      if (isAnimating || newPosition < 0 || newPosition >= photoCarousel.length) return;
      
      // Prevent backward navigation from first position
      if (currentCarouselPosition === 0 && newPosition < currentCarouselPosition) {
        return;
      }
      
      // Determine direction if not provided
      if (!direction) {
        direction = newPosition > currentCarouselPosition ? 'forward' : 'backward';
      }
      
      currentCarouselPosition = newPosition;
      const photo = photoCarousel[currentCarouselPosition];
      
      // Preload next photo
      const nextImg = new Image();
      nextImg.src = photo.image;
      
      nextImg.onload = function() {
        // Set next photo in the hidden container
        const nextImgElement = instagramPhotoNext.querySelector('img');
        nextImgElement.src = photo.image;
        
        // Determine animation classes based on direction
        const isForward = direction === 'forward';
        const wrapperClass = isForward ? 'swiping-left' : 'swiping-right';
        const nextClass = isForward ? 'swiping-in-left' : 'swiping-in-right';
        
        // Reset any previous animation classes
        instagramWrapper.classList.remove('swiping-left', 'swiping-right');
        instagramPhotoNext.classList.remove('swiping-in-left', 'swiping-in-right');
        
        // Set initial position for next photo based on direction
        if (isForward) {
          instagramPhotoNext.style.transform = 'translateX(100%)';
        } else {
          instagramPhotoNext.style.transform = 'translateX(-100%)';
        }
        instagramPhotoNext.style.opacity = '1';
        
        // Start animation
        isAnimating = true;
        
        // Update navigation dots immediately to sync animation with photo
        updateNavDots(direction);
        
        instagramWrapper.classList.add(wrapperClass);
        instagramPhotoNext.classList.add(nextClass);
        
        // After animation completes, swap the images
        setTimeout(function() {
          // Update current photo
          instagramPhoto.src = photo.image;
          instagramPhotoCode.textContent = photo.code || '';
          instagramPhotoTimestamp.textContent = photo.timestamp || '';
          
          // Reset animation classes
          instagramWrapper.classList.remove('swiping-left', 'swiping-right');
          instagramWrapper.style.transform = '';
          instagramPhotoNext.classList.remove('swiping-in-left', 'swiping-in-right');
          instagramPhotoNext.style.transform = 'translateX(100%)';
          instagramPhotoNext.style.opacity = '0';
          
          // Navigation dots already updated before animation started
          isAnimating = false;
        }, 500);
      };
      
      nextImg.onerror = function() {
        console.error('Failed to load photo:', photo.image);
        isAnimating = false;
      };
    }
    
    // Function to navigate forward
    function navigateForward() {
      if (currentCarouselPosition < photoCarousel.length - 1) {
        navigateToPosition(currentCarouselPosition + 1, 'forward');
      }
    }
    
    // Function to navigate backward
    function navigateBackward() {
      if (currentCarouselPosition > 0) {
        navigateToPosition(currentCarouselPosition - 1, 'backward');
      }
    }
    
    // Initialize with first photo in carousel
    if (photoCarousel.length > 0) {
      const initialPhoto = photoCarousel[0];
      
      // Preload image before setting it
      const img = new Image();
      img.onload = function() {
        instagramPhoto.src = initialPhoto.image;
        instagramPhotoCode.textContent = initialPhoto.code || '';
        instagramPhotoTimestamp.textContent = initialPhoto.timestamp || '';
        
        // Update navigation dots (no animation on initial load)
        updateNavDots();
      };
      img.onerror = function() {
        console.error('Failed to load photo:', initialPhoto.image);
      };
      img.src = initialPhoto.image;
      
      // Avatar is now set to fixed image in HTML, no need to change it
      
      // Comment button click handler to toggle metadata
      const commentButton = instagramContainer.querySelector('svg[aria-label="Comment"]');
      if (commentButton && instagramPhotoOverlay) {
        commentButton.addEventListener('click', function(e) {
          e.stopPropagation(); // Prevent photo click
          instagramPhotoOverlay.classList.toggle('show');
        });
      }
      
      // Menu dots click handler to show full-size image
      if (instagramMenuDots && instagramFullsizeModal && instagramFullsizeImage) {
        instagramMenuDots.addEventListener('click', function(e) {
          e.stopPropagation(); // Prevent photo click
          if (photoCarousel.length > 0 && currentCarouselPosition >= 0) {
            const currentPhoto = photoCarousel[currentCarouselPosition];
            instagramFullsizeImage.src = currentPhoto.image;
            instagramFullsizeModal.classList.add('active');
            // Prevent body scroll when modal is open
            document.body.style.overflow = 'hidden';
          }
        });
      }
      
      // Close full-size modal
      if (instagramFullsizeModal && instagramFullsizeClose) {
        // Close button
        instagramFullsizeClose.addEventListener('click', function(e) {
          e.stopPropagation();
          instagramFullsizeModal.classList.remove('active');
          document.body.style.overflow = '';
        });
        
        // Click overlay to close
        const overlay = instagramFullsizeModal.querySelector('.instagram-fullsize-overlay');
        if (overlay) {
          overlay.addEventListener('click', function() {
            instagramFullsizeModal.classList.remove('active');
            document.body.style.overflow = '';
          });
        }
        
        // ESC key to close
        document.addEventListener('keydown', function(e) {
          if (e.key === 'Escape' && instagramFullsizeModal.classList.contains('active')) {
            instagramFullsizeModal.classList.remove('active');
            document.body.style.overflow = '';
          }
        });
      }
    }
    
    // Click handler for navigating left/right through carousel
    if (instagramPhotoSection) {
      instagramPhotoSection.addEventListener('click', function(e) {
        if (isAnimating || photoCarousel.length === 0) return;
        
        // Get the click position relative to the photo section
        const rect = instagramPhotoSection.getBoundingClientRect();
        const clickX = e.clientX - rect.left;
        const photoWidth = rect.width;
        const middleX = photoWidth / 2;
        
        // Determine if click was on left or right side
        if (clickX < middleX) {
          // Left side - navigate backward (only if not at first position)
          if (currentCarouselPosition > 0) {
            navigateBackward();
          }
          // Don't allow going backward from first position - do nothing
        } else {
          // Right side - navigate forward
          if (currentCarouselPosition < photoCarousel.length - 1) {
            navigateForward();
          } else {
            // Wrap around to beginning
            navigateToPosition(0, 'forward');
          }
        }
      });
    }
    
    // Add keyboard navigation (optional)
    document.addEventListener('keydown', function(e) {
      if (isAnimating || !instagramContainer || !instagramContainer.contains(document.activeElement)) return;
      
      if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
        e.preventDefault();
        if (currentCarouselPosition < photoCarousel.length - 1) {
          navigateForward();
        } else {
          navigateToPosition(0, 'forward');
        }
      } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
        e.preventDefault();
        // Don't allow going backward from first position
        if (currentCarouselPosition > 0) {
          navigateBackward();
        }
      }
    });
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
  
  // Show all projects by default (CSS handles this, but ensure it's set)
  // Don't set inline styles here - let CSS handle it, JavaScript will override when needed
  
  // Create filter buttons for each project (hidden, not used)
  projectContainers.forEach(container => {
    const projectName = container.dataset.project;
    const button = document.createElement('button');
    button.className = 'project-filter-btn';
    button.textContent = projectName;
    button.dataset.project = projectName;
    projectFilters.appendChild(button);
    projectButtons[projectName] = button;
    
    // Don't set any project as active by default - all are hidden initially
    
    // Toggle project on button click
    button.addEventListener('click', function() {
      const currentDisplay = container.style.getPropertyValue('display');
      const computedDisplay = window.getComputedStyle(container).display;
      const isVisible = computedDisplay !== 'none' && currentDisplay !== 'none';
      
      if (isVisible) {
        container.style.setProperty('display', 'none', 'important');
        button.classList.remove('active');
      } else {
        container.style.setProperty('display', 'block', 'important');
        button.classList.add('active');
      }
    });
  });
  
  // Toggle button functionality
  document.querySelectorAll('.project-toggle').forEach(toggleBtn => {
    toggleBtn.addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      const projectName = this.dataset.project;
      const container = document.querySelector(`.project-container[data-project="${projectName}"]`);
      const filterBtn = projectButtons[projectName];
      
      if (!container) {
        console.error('Container not found for project:', projectName);
        return;
      }
      
      // Toggle visibility - check current state
      const currentDisplay = container.style.getPropertyValue('display');
      const computedDisplay = window.getComputedStyle(container).display;
      const isVisible = computedDisplay !== 'none' && currentDisplay !== 'none';
      
      console.log('Toggle clicked for', projectName, '- Current display:', computedDisplay, '- Will toggle to:', isVisible ? 'hidden' : 'visible');
      
      if (isVisible) {
        container.style.setProperty('display', 'none', 'important');
        if (filterBtn) filterBtn.classList.remove('active');
      } else {
        container.style.setProperty('display', 'block', 'important'); // Explicitly set to block to show
        if (filterBtn) filterBtn.classList.add('active');
      }
    });
  });
  
  // Get preview elements first
  const preview = document.getElementById('imagePreview');
  
  // Immediately move preview to html (not body) to avoid body's position:relative creating containing block
  // body has position:relative from head_custom.html which breaks fixed positioning
  if (preview && preview.parentElement !== document.documentElement) {
    document.documentElement.appendChild(preview);
  }
  
  // Initialize preview position off-screen to prevent it from appearing at top
  // But don't override opacity - let CSS handle that
  if (preview) {
    preview.style.setProperty('position', 'fixed', 'important');
    preview.style.setProperty('left', '-9999px', 'important');
    preview.style.setProperty('top', '-9999px', 'important');
  }
  const carousel = document.getElementById('imageCarousel');
  const previewCaption = document.getElementById('previewCaption');
  
  // Verify elements exist
  if (!preview || !carousel) {
    console.error('Image preview elements not found');
    return;
  }
  
  // Query rows AFTER ensuring containers are visible - use a small delay to ensure DOM is ready
  setTimeout(function() {
    const rows = document.querySelectorAll('.presentation-row');
    
    if (rows.length === 0) {
      console.error('No presentation rows found - check if containers are visible');
      return;
    }
    
    console.log('Found', rows.length, 'presentation rows');
    
    // Setup photo preview handlers - rows are now available
    setupPhotoPreviewHandlers(rows);
  }, 100);
  
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
  let isScrolling = false;
  let scrollTimeout = null;
  
  // Create a map of photo indices to rows (used for reference)
  const photoIndexToRowMap = new Map();
  
  // Function to update preview position at cursor (viewport coordinates)
  function updatePreviewPosition(x, y) {
    // Validate coordinates (viewport coordinates)
    if (typeof x !== 'number' || typeof y !== 'number' || x < 0 || y < 0) {
      return;
    }
    
    // Ensure preview is in html (not body) to avoid body's position:relative creating containing block
    // body has position:relative from head_custom.html which breaks fixed positioning
    if (preview.parentElement !== document.documentElement) {
      document.documentElement.appendChild(preview);
    }
    
    const previewWidth = 450;
    const previewHeight = 450;
    const offset = 20; // Offset from cursor
    
    // Get viewport dimensions (what's actually visible)
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;
    
    // Calculate position - place preview above and to the right of cursor
    let left = x + 200; // Offset to the right by 250px
    let top = y - 250; // Offset upward by 250px so preview appears above cursor
    
    // Keep preview within visible viewport bounds horizontally
    if (left + previewWidth > viewportWidth) {
      left = viewportWidth - previewWidth - 10; // Shift left if it would overflow right
    }
    if (left < 0) {
      left = 10; // Keep within left edge
    }
    
    // For vertical positioning, prioritize cursor position
    // Only adjust if preview would be completely off-screen (more than 90% off)
    if (top < -previewHeight * 0.9) {
      top = 10; // Show from top if mostly above viewport
    }
    // Allow preview to extend below viewport - only clamp if more than 90% is off-screen
    if (top + previewHeight > viewportHeight + previewHeight * 0.9) {
      top = viewportHeight - previewHeight * 0.1; // Show top 10% if mostly below viewport
    }
    
    // Set position using fixed positioning (relative to viewport, not page)
    // Fixed positioning is relative to the viewport, not any parent container
    // Use setProperty with !important to override any CSS that might interfere
    preview.style.setProperty('position', 'fixed', 'important');
    preview.style.removeProperty('inset'); // Remove inset completely
    preview.style.setProperty('left', Math.round(left) + 'px', 'important');
    preview.style.setProperty('top', Math.round(top) + 'px', 'important');
    preview.style.removeProperty('right'); // Remove right completely
    preview.style.removeProperty('bottom'); // Remove bottom completely
    preview.style.setProperty('margin', '0', 'important');
    preview.style.setProperty('padding', '0', 'important');
    preview.style.setProperty('transform', 'none', 'important');
    
    // Force a reflow to ensure the position is applied
    void preview.offsetHeight;
    
    // Ensure position persists - set it again in next frame to override any transitions
    requestAnimationFrame(function() {
      preview.style.setProperty('left', Math.round(left) + 'px', 'important');
      preview.style.setProperty('top', Math.round(top) + 'px', 'important');
    });
  }
  
  // Track mouse position globally for preview positioning
  let lastX = window.innerWidth / 2; // Last mouse X position
  let lastY = window.innerHeight / 2; // Last mouse Y position  
  let lastScrolled = 0; // Last scroll position
  let currentHoveredRow = null;
  
  // Track mouse position globally - use capture phase to catch all mouse movements
  document.addEventListener('mousemove', function(e) {
    // Update last position (using viewport coordinates for fixed positioning)
    lastX = e.clientX;
    lastY = e.clientY;
    
    // Update preview position if active, but not immediately after a click
    if (preview.classList.contains('active') && !justClicked) {
      updatePreviewPosition(lastX, lastY);
    }
  }, true);
  
  // Update preview position during scroll - fixed positioning is viewport-relative,
  // so we just need to ensure it stays at the cursor position (which is viewport-relative)
  window.addEventListener('scroll', function() {
    if (preview.classList.contains('active') && lastX > 0 && lastY > 0) {
      // clientX/clientY are viewport-relative, so fixed positioning naturally stays aligned
      // Just ensure the preview position is updated to current cursor (viewport coordinates)
      updatePreviewPosition(lastX, lastY);
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
    img.loading = 'eager'; // Eager loading for preloading/caching
    img.dataset.src = photo.image; // Store source in data attribute
    img.style.display = 'block'; // Display block but opacity 0 via CSS
    img.style.opacity = '0'; // Start hidden
    carousel.appendChild(img);
    imageElements.push(img);
  });
  
  console.log('Created', imageElements.length, 'image elements for', allPhotos.length, 'photos');
  console.log('Preview element:', preview);
  console.log('Carousel element:', carousel);
  console.log('First few photos:', allPhotos.slice(0, 3));
  
  // Function to load an image when needed
  function loadImage(index) {
    if (index < 0 || index >= imageElements.length) {
      console.warn('loadImage: Invalid index', index, 'out of', imageElements.length);
      return;
    }
    const img = imageElements[index];
    if (!img) {
      console.warn('loadImage: No image element at index', index);
      return;
    }
    
    if (!img.src && img.dataset.src) {
      // Check if image is already cached
      if (imageCache.has(img.dataset.src)) {
        img.src = img.dataset.src;
        img.style.display = 'block';
        img.style.opacity = '1';
        return;
      }
      
      console.log('Loading image:', img.dataset.src);
      img.src = img.dataset.src;
      img.style.display = 'block';
      img.style.opacity = '1';
      // Cache the image once loaded
      img.onload = function() {
        console.log('Image loaded:', img.src);
        img.style.display = 'block';
        img.style.opacity = '1';
        imageCache.set(img.dataset.src, true);
      };
      img.onerror = function() {
        console.error('Failed to load image:', img.dataset.src);
        img.style.display = 'none';
      };
    } else if (img.src) {
      img.style.display = 'block';
      img.style.opacity = '1';
    }
  }
  
  // Background preloading: Load images progressively after page load
  function preloadImages() {
    if (isPreloading || preloadIndex >= imageElements.length) return;
    isPreloading = true;
    
    // Preload images in batches to avoid overwhelming the browser
    const batchSize = 5; // Load 5 images at a time (increased for faster caching)
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
            // Reduced delay between batches for faster caching
            setTimeout(preloadNext, 50);
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
    
    // Start preloading immediately (reduced delay for faster caching)
    setTimeout(() => {
      preloadNext();
    }, 100);
  }
  
  // Start background preloading immediately when DOM is ready (don't wait for all assets)
  if (document.readyState === 'complete' || document.readyState === 'interactive') {
    preloadImages();
  } else {
    document.addEventListener('DOMContentLoaded', preloadImages);
    // Also try on load as fallback
    window.addEventListener('load', function() {
      if (!isPreloading || preloadIndex < imageElements.length) {
        preloadImages();
      }
    });
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
  
  // Function to setup photo preview handlers (called after rows are found)
  function setupPhotoPreviewHandlers(rows) {
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
      
      row.addEventListener('mouseenter', function(e) {
        if (photoIndex >= 0 && photoIndex < allPhotos.length) {
          const previousIndex = currentPhotoIndex;
          let direction = null;
          if (previousIndex !== -1 && previousIndex !== photoIndex && previousIndex >= 0 && previousIndex < allPhotos.length) {
            direction = photoIndex < previousIndex ? 'right' : 'left';
          }
          currentPhotoIndex = photoIndex;
          
          // Ensure preview is in html (not body) to avoid containing block issues
          if (preview.parentElement !== document.documentElement) {
            document.documentElement.appendChild(preview);
          }
          
          // Position at cursor coordinates (viewport-relative)
          const mouseX = e.clientX; // Viewport X coordinate
          const mouseY = e.clientY; // Viewport Y coordinate
          
          // Update stored position
          lastX = mouseX;
          lastY = mouseY;
          
          // Set position immediately
          updatePreviewPosition(mouseX, mouseY);
          
          // Load image and update carousel BEFORE showing preview
          loadImage(photoIndex);
          updateCarousel(currentPhotoIndex, previousIndex, direction);
          
          // Show preview
          requestAnimationFrame(function() {
            preview.classList.add('active');
            preview.style.setProperty('opacity', '1', 'important');
          });
        }
      });
      
      row.addEventListener('mouseleave', function() {
        preview.classList.remove('active');
        preview.style.setProperty('opacity', '0', 'important');
      });
    });
    
  }
});
</script>
