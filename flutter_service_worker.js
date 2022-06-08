'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "1bcde0f62dad12196505d7a5c3b08f77",
"index.html": "e22e0d37c2868dc18b3f9c4e3c348f50",
"/": "e22e0d37c2868dc18b3f9c4e3c348f50",
"main.dart.js": "2b49ad5ffaeee7f2bc3989df798dc942",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "f44542794377d3b381b5336bf7b7be8e",
"assets/AssetManifest.json": "993cf827623952bbbb769fe758053413",
"assets/NOTICES": "50170805196c9a33a843875702ef6161",
"assets/FontManifest.json": "c5de447c3c7b7f9c1a1e37ef6423168f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttericon/lib/fonts/Octicons.ttf": "7242d2fe9e36eb4193d2bc7e521779bf",
"assets/packages/fluttericon/lib/fonts/Maki.ttf": "9ecdcd7d24a2461a55d532b86b2740bd",
"assets/packages/fluttericon/lib/fonts/Brandico.ttf": "791921e9b25210e2551b6eda3f86c733",
"assets/packages/fluttericon/lib/fonts/Entypo.ttf": "58edfaf27b1032ea4778b69297c02b5a",
"assets/packages/fluttericon/lib/fonts/Fontelico.ttf": "3a1e1cecf0a3eae6be5cba3677379ba2",
"assets/packages/fluttericon/lib/fonts/Iconic.ttf": "34e12214307f5f7cf7bc62086fbf55a3",
"assets/packages/fluttericon/lib/fonts/LineariconsFree.ttf": "276b1d61e45eb9b2dde9482545d9e3ac",
"assets/packages/fluttericon/lib/fonts/RpgAwesome.ttf": "99232001effca5cf2b5aa92cc3f3e892",
"assets/packages/fluttericon/lib/fonts/Typicons.ttf": "3386cae1128e52caf268508d477fb660",
"assets/packages/fluttericon/lib/fonts/FontAwesome.ttf": "799bb4e5c577847874f20bd0e9b38a9d",
"assets/packages/fluttericon/lib/fonts/Zocial.ttf": "c29d6e34d8f703a745c6f18d94ce316d",
"assets/packages/fluttericon/lib/fonts/WebSymbols.ttf": "4fd66aa74cdc6e5eaff0ec916ac269c6",
"assets/packages/fluttericon/lib/fonts/Linecons.ttf": "2d0ac407ed11860bf470cb01745fb144",
"assets/packages/fluttericon/lib/fonts/FontAwesome5.ttf": "221b27a41202ddd33990e299939e4504",
"assets/packages/fluttericon/lib/fonts/Elusive.ttf": "23f24df0388819e94db2b3c19841841c",
"assets/packages/fluttericon/lib/fonts/MfgLabs.ttf": "09daa533ea11600a98e3148b7531afe3",
"assets/packages/fluttericon/lib/fonts/Meteocons.ttf": "8b9c7982496155bb39c67eaf2a243731",
"assets/packages/fluttericon/lib/fonts/ModernPictograms.ttf": "5046c536516be5b91c15eb7795e0352d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/MyHeroAcademia.otf": "fab8fb009e26281572e811051fe28b80",
"assets/assets/villains/background/twice-crying.jpeg": "4568b9e21ae3e245869ff7cfa34008ce",
"assets/assets/villains/background/my-hero-academia-villains.jpeg": "5e2608cc37adfab4e8b3b932df477fc8",
"assets/assets/villains/background/some-villains.jpeg": "39194a6f6e4f70f0a4a23387f8323110",
"assets/assets/villains/all-for-one2.png": "0a04599df3893336308f767081e22278",
"assets/assets/villains/all_for_one_flying.png": "61aeab563e9af1605459d46c95a817b7",
"assets/assets/villains/all-for-one.png": "3cb0257458eefea4fc11e354dfcfeebd",
"assets/assets/villains/all-for-one-helping.png": "78496b15ebf64fb6919acc10a3990c1c",
"assets/assets/villains/all_for_one.png": "f2503ed277ea37b5b325a6c90aac0976",
"assets/assets/heroes/background/DekuCrying1.mp4": "6ae55ca4f7ee05576811a12409673810",
"assets/assets/heroes/background/midoriya5.png": "d01957c2b1b96645d1d17eaf38b6ecfa",
"assets/assets/heroes/background/midoriya4.png": "f59d4fc28565e71d676635a955d9e04b",
"assets/assets/heroes/background/my-hero-academia-heroes-background.png": "7cbdaa8ab926eebdd86cca40d1357cbb",
"assets/assets/heroes/background/midoriya1.png": "96e062a7955e3509ad697002fa07fb02",
"assets/assets/heroes/background/all-might-midoriya-bakugo.png": "86c3d84f17104f8856729e3c60ef9571",
"assets/assets/heroes/background/DekuCrying1.gif": "8172c9a6495812726a9b49dfe2aba784",
"assets/assets/heroes/background/midoriya3.png": "e2845d02dd2dc74a25fd2696c085bcdd",
"assets/assets/heroes/background/midoriya2.png": "824a45a282915290c4e4ba31a460c34c",
"assets/assets/heroes/background/DekuCrying2.gif": "83b8e68b8f227fcd64a75a7c434c73f0",
"assets/assets/heroes/background/all-might-background.png": "1dc0fd678cb97075ec0686121bcf1773",
"assets/assets/heroes/background/My-Hero-Academia-Season-6.jpeg": "b40ed9e9e9f176d8c3151532996da293",
"assets/assets/heroes/background/all-might.png": "c99fe734687cb663dc3ba0c417ab4b9b",
"assets/assets/heroes/background/all-might-heroes.png": "77a64d9c2e4d275ca6d8a28eba038448",
"assets/assets/heroes/background/my_hero_background.png": "9e6f1a1c676bde32c28ed02fd1b95fcd",
"assets/assets/heroes/background/all-might2.jpg": "b22163de87af698436af2f2d91e254fa",
"assets/assets/heroes/midoriya4.png": "96e062a7955e3509ad697002fa07fb02",
"assets/assets/heroes/midoriya1.png": "824a45a282915290c4e4ba31a460c34c",
"assets/assets/heroes/midoriya3.png": "96e062a7955e3509ad697002fa07fb02",
"assets/assets/heroes/midoriya2.png": "871b30110ce6c4d6d8dfa60350358540",
"assets/assets/heroes/all-might.png": "f3c6ea5568b865c25c1c34b4eefd3f3f",
"assets/assets/logo/my_hero_academia_logo.png": "c5b50b102eb628d72f19a7fd6d3a09af"
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
