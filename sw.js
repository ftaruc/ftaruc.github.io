// Service Worker for image caching
const CACHE_NAME = 'photos-cache-v1';
const IMAGE_CACHE_NAME = 'photos-images-v1';

// List of image paths to cache (will be populated dynamically)
const IMAGES_TO_CACHE = [];

// Install event - cache images
self.addEventListener('install', (event) => {
  console.log('Service Worker installing...');
  event.waitUntil(
    caches.open(IMAGE_CACHE_NAME).then((cache) => {
      console.log('Image cache opened');
      // Images will be cached on-demand via fetch event
      return cache.addAll([]);
    })
  );
  self.skipWaiting(); // Activate immediately
});

// Activate event - clean up old caches
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== IMAGE_CACHE_NAME && cacheName !== CACHE_NAME) {
            console.log('Deleting old cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
  return self.clients.claim();
});

// Fetch event - serve from cache, fallback to network
self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);
  
  // Only cache images
  if (url.pathname.match(/\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/i)) {
    event.respondWith(
      caches.match(event.request).then((response) => {
        // Return cached version if available
        if (response) {
          return response;
        }
        
        // Otherwise fetch from network and cache it
        return fetch(event.request).then((response) => {
          // Don't cache if not a valid response
          if (!response || response.status !== 200 || response.type !== 'basic') {
            return response;
          }
          
          // Clone the response
          const responseToCache = response.clone();
          
          caches.open(IMAGE_CACHE_NAME).then((cache) => {
            cache.put(event.request, responseToCache);
          });
          
          return response;
        }).catch(() => {
          // If fetch fails, return a placeholder or error
          return new Response('Image failed to load', {
            status: 408,
            headers: { 'Content-Type': 'text/plain' }
          });
        });
      })
    );
  }
});

