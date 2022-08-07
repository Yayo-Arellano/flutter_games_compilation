'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "7ae4b933aad88f0fd125fba98db1622f",
"index.html": "ef9d2afc5e57799cfbf4fb2e07a0e24c",
"/": "ef9d2afc5e57799cfbf4fb2e07a0e24c",
"main.dart.js": "d2a04d6333af6e37c18ca5fc6cba22e3",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "71142b6de871fec267ffa54caff4bf1a",
"assets/AssetManifest.json": "48d13cf087a8594c69c11630a417497c",
"assets/NOTICES": "3e9a151ad3e6722681edd08bfd3343ab",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/ball.png": "cade14ea705addadcd7deb4397b0525a",
"assets/assets/images/platform.png": "a6e667a7f272a9e0b88dae78c95ee7a6",
"assets/assets/images/robot/robot_idle.png": "54e87e9bccaaacd94a25554158b92f56",
"assets/assets/images/robot/robot_fall.png": "53591ab8fa28a5070a7c28775588e2d2",
"assets/assets/images/robot/robot_walk7.png": "34aa3a0eb05d206f02fc7d4008a81392",
"assets/assets/images/robot/robot_walk6.png": "5c52c47f23bf96e57fa2f1bb87129366",
"assets/assets/images/robot/robot_walk4.png": "77fa9122c36f0c3b6c783bd9cb279de3",
"assets/assets/images/robot/robot_walk5.png": "dbee22c8966313d22db1799471a6e42f",
"assets/assets/images/robot/robot_walk1.png": "40b2dca07631a4a4ee9e17edbb204ad3",
"assets/assets/images/robot/robot_jump.png": "e44b0541964b47835714f35ac0d6ac23",
"assets/assets/images/robot/robot_walk0.png": "5b6ef54278b1ae173cc773daea205a67",
"assets/assets/images/robot/robot_walk2.png": "7e7912d3cc7dd93532f01dacd3650b4b",
"assets/assets/images/robot/robot_duck.png": "cc098d4f1b0d0abbdb2fff292a199ac3",
"assets/assets/images/robot/robot_walk3.png": "c24889edb48d381234042bb4fd717d68",
"assets/assets/images/coin/coin9.png": "624fc79c70e7f2013c8f98c677d5b283",
"assets/assets/images/coin/coin8.png": "356d9929e54fac0f7fad0a65dff9ae24",
"assets/assets/images/coin/coin6.png": "c7a5d8e562d357411d2f1ea5622c4b8d",
"assets/assets/images/coin/coin7.png": "155437408a1e5f94d2437a7c85c2fd79",
"assets/assets/images/coin/coin5.png": "9997868f69445e67baf19748a48a376a",
"assets/assets/images/coin/coin4.png": "1ff698c28f692f59dbde6767b8b76537",
"assets/assets/images/coin/coin1.png": "060230ac1beabc26850b414dc1e16d0e",
"assets/assets/images/coin/coin3.png": "8a9f075339346316652794cd279d5a42",
"assets/assets/images/coin/coin2.png": "067a983e1822b1ffca6ea53d033b60a8",
"assets/assets/images/explosion/explosion8.png": "f77b912e8d7d3d05b9a013dd459b9807",
"assets/assets/images/explosion/explosion9.png": "2678053972bab42c9b4e1a4febdd4e1b",
"assets/assets/images/explosion/explosion19.png": "4f509774982eee736e412b927a8cbbc4",
"assets/assets/images/explosion/explosion18.png": "ad03cf09d8e7043656f85c4f1b39def4",
"assets/assets/images/explosion/explosion1.png": "61cc62abe0729b8c497317a7b6640f73",
"assets/assets/images/explosion/explosion13.png": "9776b6c9239efb29c9d2bd01eb75d505",
"assets/assets/images/explosion/explosion12.png": "4a7f71564defa1f7633cc70054cc842d",
"assets/assets/images/explosion/explosion2.png": "38ddc9ec3836298d94bc15c2900e3ad2",
"assets/assets/images/explosion/explosion10.png": "328e7a0c86a72567ebf64086639686fc",
"assets/assets/images/explosion/explosion11.png": "23807e6027d2f3c58298fe0cf6be8763",
"assets/assets/images/explosion/explosion3.png": "c57c6306ccd466d4f9b96b55ed723784",
"assets/assets/images/explosion/explosion7.png": "f7a6af6671d7465fdc0e35f11cf4810e",
"assets/assets/images/explosion/explosion15.png": "8dde7b7a8bfbce4d64562bb08c73d323",
"assets/assets/images/explosion/explosion14.png": "dcf19b45596f196a47f78fdfe1b93998",
"assets/assets/images/explosion/explosion6.png": "3b0ef489ec18a35039957da1b0f34a08",
"assets/assets/images/explosion/explosion4.png": "f211bd20454a002712747b1b05638deb",
"assets/assets/images/explosion/explosion16.png": "13447ca104609a6312a7c399c4e2db76",
"assets/assets/images/explosion/explosion17.png": "3a6041c2e47a411a86f1da3e4f23948d",
"assets/assets/images/explosion/explosion5.png": "7eb70bc80f6bae9030309a2b9432297d",
"assets/assets/images/box.png": "4bf40099be02b24fcc84bfab83c4fb2d",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
