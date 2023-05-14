'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "b24a07baa1c3472ece09ff7a5b2c7974",
"index.html": "3ff1a6080de2bf2c38d2982395192d9c",
"/": "3ff1a6080de2bf2c38d2982395192d9c",
"main.dart.js": "7cb3e070482bc95f8b923e83a3648f73",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5b7f3006ff32c0bcc6a23b81b987c255",
"assets/AssetManifest.json": "71546672c634e750dc59a2806711f7d3",
"assets/NOTICES": "ff6ea8c38a165aa579b88d9619a860fb",
"assets/FontManifest.json": "7a47a227c95e172ddbba98a71f0ca606",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "7990dc539c868bfa43f3192dc59d572a",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/images/heroJump.png": "8a7d633a26871f7fda020b4e8cd5a73e",
"assets/assets/images/ui/buttonBack.png": "8bae1f9a60870d118b2805f7197f21ca",
"assets/assets/images/ui/buttonPause.png": "b4fc66a17cb495d972ed348e5af0e70a",
"assets/assets/images/ui/button.png": "7fdf79ec7b7c403da8af6e2f64f5f4b2",
"assets/assets/images/HappyCloud.png": "bd46d9332cf9ee465682a27e271ecae9",
"assets/assets/images/platforms/LandPiece_LightMulticolored.png": "3a180148ccde4f3cbbd63bfadc7fd6c6",
"assets/assets/images/platforms/HalfLandPiece_Right_Blue.png": "defcdedbef5689b11f91a9907757a273",
"assets/assets/images/platforms/HalfLandPiece_Right_Pink.png": "60cdc77bc1c15934f19596ece65c7cf8",
"assets/assets/images/platforms/LandPiece_LightGreen.png": "0df374756e71f7be1efdeff4bed4c3e9",
"assets/assets/images/platforms/LandPiece_DarkMulticolored.png": "69b407ff9a2c6be64de3819b886154d3",
"assets/assets/images/platforms/HalfLandPiece_Left_Blue.png": "58a4389ca6f30418176f2f223af3f378",
"assets/assets/images/platforms/HalfLandPiece_Left_Pink.png": "016a2d360608e9726254590fba78909e",
"assets/assets/images/platforms/HalfLandPiece_Right_Green.png": "981142f67da0573babd671614fd5e6db",
"assets/assets/images/platforms/HalfLandPiece_Left_Gray.png": "c7f0aaade75548ec33efa1fdcb853cc4",
"assets/assets/images/platforms/BrokenLandPiece_Beige.png": "edc0dd4503fbc477f0da51000a7c1636",
"assets/assets/images/platforms/HalfLandPiece_Right_Gray.png": "b70df5d3f49cf6caf4f00b0ed0a50281",
"assets/assets/images/platforms/HalfLandPiece_Left_Beige.png": "e5c2699d1bc612440e8a5741b9c60f4f",
"assets/assets/images/platforms/LandPiece_DarkBeige.png": "feab55bf62d2be32acf8bc6e43c7acae",
"assets/assets/images/platforms/LandPiece_LightBeige.png": "f1fe6155e6a687cda70a46cb2e15949e",
"assets/assets/images/platforms/HalfLandPiece_Right_Beige.png": "47683c08df9737496fe98b10d88d5a8e",
"assets/assets/images/platforms/HalfLandPiece_Left_Multicolored.png": "dda1290c40950a19bab97c71054ce867",
"assets/assets/images/platforms/BrokenLandPiece_Gray.png": "ea1bdb41d8230e451148d1eb953178a9",
"assets/assets/images/platforms/HalfLandPiece_Right_Multicolored.png": "77c7fcdb7242632c2a5b75d77e57dd95",
"assets/assets/images/platforms/LandPiece_DarkPink.png": "99bc393d5c955a41582347a5ca6531c8",
"assets/assets/images/platforms/LandPiece_DarkBlue.png": "7a7075d676bf4f9f12e5548342e195d1",
"assets/assets/images/platforms/LandPiece_LightGray.png": "7169f2d9e0d54cebb5fd23f067f19609",
"assets/assets/images/platforms/LandPiece_LightPink.png": "e4077f438eda534a7347797a7318af88",
"assets/assets/images/platforms/LandPiece_LightBlue.png": "e9f940481b3b0e94f21530839bbd0068",
"assets/assets/images/platforms/LandPiece_DarkGray.png": "859a9254b69943a75fa9710c6074aca9",
"assets/assets/images/platforms/HalfLandPiece_Left_Green.png": "be09cdf254aa2a90ed874967df238b10",
"assets/assets/images/platforms/LandPiece_DarkGreen.png": "a6e667a7f272a9e0b88dae78c95ee7a6",
"assets/assets/images/platforms/BrokenLandPiece_Green.png": "4e9637d1ce71233acd1b5fe16146254d",
"assets/assets/images/platforms/BrokenLandPiece_Pink.png": "6a50faa9d0099f345e0c54730aaf2a89",
"assets/assets/images/platforms/BrokenLandPiece_Blue.png": "c3f6f421d94fd088f2c5e2a8c70bb678",
"assets/assets/images/platforms/BrokenLandPiece_Multicolored.png": "4952eae817c0c30f20693a0f36abe732",
"assets/assets/images/title.png": "1ae622f2950b72c5a709a2bb4bb3c950",
"assets/assets/images/heroFall.png": "8b857a51a7859d404ad4aaf77b752ad3",
"assets/assets/images/background.png": "4bb32720507b07f3f4a80af1ca9a2d84",
"assets/assets/images/HearthEnemy1.png": "16e29cecc157e6ddf377d96a54ecbe42",
"assets/assets/images/HearthEnemy2.png": "51dffe0578a99a73ade93620d5172821",
"assets/assets/images/items/Bullet.png": "560c67bb3e2528e26aacdf4bb5627e0b",
"assets/assets/images/items/Jetpack_Big.png": "06e3ed9d1dff2881d49c46c6219ec33e",
"assets/assets/images/items/Bubble_Big.png": "0c6ef5a8cab9c10ea39b3faa4cafa51c",
"assets/assets/images/items/JetFire1.png": "47115b30d0ba2d64e05b0e07d55a8b1a",
"assets/assets/images/items/JetFire2.png": "985936bc12141b0a59c0ebd5fe9bc10d",
"assets/assets/images/items/Pistol.png": "7c9d959cc4a136aa7acd0c4bb199762b",
"assets/assets/images/items/Jetpack_Small.png": "6a7727374ab54fd08d83b758c2842292",
"assets/assets/images/items/Spring.png": "817e3776f8ba3f609a66dbc50be566b5",
"assets/assets/images/items/Lightning2.png": "c680b1992da8554568e3fdeef182d69b",
"assets/assets/images/items/Lightning1.png": "cefbc884e17e4ae3dc5bad03913dac11",
"assets/assets/images/items/Bubble_Small.png": "f64dc0d290134ba86ca02d015ffd9f8a",
"assets/assets/images/items/Coin.png": "1cb819f2580cddc7031d84801834e508",
"assets/assets/images/AngryCloud.png": "e4d5daf0363362cd3cb34d5482c1ba07",
"assets/assets/fonts/DaveysDoodleface.ttf": "944a2b6f684512b360f91e72d8812cbc",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
