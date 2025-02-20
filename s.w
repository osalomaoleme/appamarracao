// sw.js atualizado para usar o link do Google Drive
// substituindo "./icon-192.png" e "./icon-512.png" pelo mesmo link

self.addEventListener("install", (event) => {
  console.log("[Service Worker] Instalado!");
  event.waitUntil(
    caches.open("app-cache").then((cache) => {
      return cache.addAll([
        "./index.html", // Mantenha se o index.html estiver no mesmo local
        "./manifest.json", // Mantenha se o manifest.json estiver no mesmo local

        // Ícones do Google Drive (mesmo link para 192x192 e 512x512, se desejar)
        "https://drive.google.com/uc?export=view&id=1RQjNjPZxp3MzXdBFvlMKvCZJv7F1Pu08",
        "https://drive.google.com/uc?export=view&id=1RQjNjPZxp3MzXdBFvlMKvCZJv7F1Pu08"
      ]);
    })
  );
});

self.addEventListener("fetch", (event) => {
  // Intercepta requisições. Se estiver no cache, retorna do cache.
  // Caso contrário, faz fetch na rede.
  event.respondWith(
    caches.match(event.request).then((cachedResponse) => {
      return cachedResponse || fetch(event.request);
    })
  );
});
