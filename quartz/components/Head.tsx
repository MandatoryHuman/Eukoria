import { i18n } from "../i18n"
import { FullSlug, getFileExtension, joinSegments, pathToRoot } from "../util/path"
import { CSSResourceToStyleElement, JSResourceToScriptElement } from "../util/resources"
import { googleFontHref, googleFontSubsetHref } from "../util/theme"
import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { unescapeHTML } from "../util/escape"
import { CustomOgImagesEmitterName } from "../plugins/emitters/ogImage"

export default (() => {
  const Head: QuartzComponent = ({
    cfg,
    fileData,
    externalResources,
    ctx,
  }: QuartzComponentProps) => {
    const titleSuffix = cfg.pageTitleSuffix ?? ""
    const title =
      (fileData.frontmatter?.title ?? i18n(cfg.locale).propertyDefaults.title) + titleSuffix
    const description =
      fileData.frontmatter?.socialDescription ??
      fileData.frontmatter?.description ??
      unescapeHTML(fileData.description?.trim() ?? i18n(cfg.locale).propertyDefaults.description)

    const { css, js, additionalHead } = externalResources

    const url = new URL(`https://${cfg.baseUrl ?? "example.com"}`)
    const path = url.pathname as FullSlug
    const baseDir = fileData.slug === "404" ? path : pathToRoot(fileData.slug!)
    const iconPath = joinSegments(baseDir, "static/icon.png")

    // Url of current page
    const socialUrl =
      fileData.slug === "404" ? url.toString() : joinSegments(url.toString(), fileData.slug!)

    const usesCustomOgImage = ctx.cfg.plugins.emitters.some(
      (e) => e.name === CustomOgImagesEmitterName,
    )
    const ogImageDefaultPath = `https://${cfg.baseUrl}/static/og-image.png`

    return (
      <head>
        <title>{title}</title>
        <meta charSet="utf-8" />
        {cfg.theme.cdnCaching && cfg.theme.fontOrigin === "googleFonts" && (
          <>
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" />
            <link rel="stylesheet" href={googleFontHref(cfg.theme)} />
            {cfg.theme.typography.title && (
              <link rel="stylesheet" href={googleFontSubsetHref(cfg.theme, cfg.pageTitle)} />
            )}
          </>
        )}
        <link rel="preconnect" href="https://cdnjs.cloudflare.com" crossOrigin="anonymous" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <meta name="og:site_name" content={cfg.pageTitle}></meta>
        <meta property="og:title" content={title} />
        <meta property="og:type" content="website" />
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content={title} />
        <meta name="twitter:description" content={description} />
        <meta property="og:description" content={description} />
        <meta property="og:image:alt" content={description} />

        {!usesCustomOgImage && (
          <>
            <meta property="og:image" content={ogImageDefaultPath} />
            <meta property="og:image:url" content={ogImageDefaultPath} />
            <meta name="twitter:image" content={ogImageDefaultPath} />
            <meta
              property="og:image:type"
              content={`image/${getFileExtension(ogImageDefaultPath) ?? "png"}`}
            />
          </>
        )}

        {cfg.baseUrl && (
          <>
            <meta property="twitter:domain" content={cfg.baseUrl}></meta>
            <meta property="og:url" content={socialUrl}></meta>
            <meta property="twitter:url" content={socialUrl}></meta>
          </>
        )}

        <link rel="icon" href={iconPath} />
        <meta name="description" content={description} />
        <meta name="generator" content="Quartz" />

        {css.map((resource) => CSSResourceToStyleElement(resource, true))}
        {js
          .filter((resource) => resource.loadTime === "beforeDOMReady")
          .map((res) => JSResourceToScriptElement(res, true))}
        {additionalHead.map((resource) => {
          if (typeof resource === "function") {
            return resource(fileData)
          } else {
            return resource
          }
        })}

        {/* --- Dataview Pills Parser --- */}
        <script dangerouslySetInnerHTML={{ __html: `
          document.addEventListener("nav", () => {
            const article = document.querySelector('article');
            if (!article) return;

            // This regex looks for [Key:: Value] but smartly ignores anything inside code blocks
            const regex = /(<code[^>]*>[\\s\\S]*?<\\/code>)|\\[([^\\]:]+)::\\s*([^\\]]+)\\]/g;

            article.innerHTML = article.innerHTML.replace(regex, (match, codeBlock, key, value) => {
              if (codeBlock) return codeBlock; // Skip code blocks
              return '<span class="pill"><span class="pill-key">' + key.trim() + '</span><span class="pill-val">' + value.trim() + '</span></span>';
            });
          });
        `}}></script>

        {/* --- Leaflet CSS & JS --- */}
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossOrigin="anonymous"/>
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossOrigin="anonymous"></script>      
        
        {/* --- Obsidian Leaflet to Quartz Parser (With Wikilink Markers) --- */}
        <script dangerouslySetInnerHTML={{ __html: `
          document.addEventListener("nav", () => {
            const blocks = document.querySelectorAll('code.language-leaflet');
            if (blocks.length === 0) return;

            blocks.forEach(block => {
              const text = block.innerText;
              
              const getVal = (key) => {
                const match = text.match(new RegExp(key + ':\\s*(.+)'));
                return match ? match[1].trim() : null;
              };

              const id = getVal('id') || 'map-' + Math.random().toString(36).substr(2, 9);
              const height = getVal('height') || '500px';
              const rawImage = getVal('image');
              
              let imageSrc = '';
              if (rawImage) {
                const imgMatch = rawImage.match(/\\[\\[(.+)\\]\\]/);
                imageSrc = imgMatch ? imgMatch[1] : rawImage;
                imageSrc = encodeURI(imageSrc); 
              }

              const boundsStr = getVal('bounds');
              let bounds = [[0,0], [1000, 1000]];
              if (boundsStr) {
                try { bounds = JSON.parse(boundsStr); } catch(e){}
              }

              const mapDiv = document.createElement('div');
              mapDiv.id = id;
              mapDiv.style.height = height;
              mapDiv.style.width = '100%';
              mapDiv.style.borderRadius = '8px';
              mapDiv.style.zIndex = '1'; 
              
              const pre = block.parentElement;
              pre.parentNode.replaceChild(mapDiv, pre);

              if (typeof L !== 'undefined') {
                
                delete L.Icon.Default.prototype._getIconUrl;
                L.Icon.Default.mergeOptions({
                  iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
                  iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
                  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
                });

                const map = L.map(id, {
                  crs: L.CRS.Simple,
                  minZoom: parseInt(getVal('minZoom') || '-4'),
                  maxZoom: parseInt(getVal('maxZoom') || '2'),
                  zoomSnap: parseFloat(getVal('zoomDelta') || '1'),
                });

                L.imageOverlay(imageSrc, bounds).addTo(map);

                const lat = parseFloat(getVal('lat'));
                const long = parseFloat(getVal('long'));
                const defaultZoom = parseFloat(getVal('defaultZoom') || '0');

                if (!isNaN(lat) && !isNaN(long)) {
                    map.setView([lat, long], defaultZoom);
                } else {
                    map.fitBounds(bounds);
                }

                // --- Marker Parsing Logic with Wikilinks ---
                const lines = text.split('\\n');
                lines.forEach(line => {
                  if (line.trim().startsWith('marker:')) {
                    const parts = line.replace('marker:', '').split(',').map(s => s.trim());
                    
                    if (parts.length >= 3) {
                      const mLat = parseFloat(parts[1]);
                      const mLong = parseFloat(parts[2]);
                      
                      if (!isNaN(mLat) && !isNaN(mLong)) {
                         const marker = L.marker([mLat, mLong]).addTo(map);
                         
                         if (parts[3]) {
                           let titleText = parts[3];
                           
                           const linkMatch = titleText.match(/\\[\\[(.*?)\\]\\]/);
                           if (linkMatch) {
                             const innerLink = linkMatch[1];
                             let targetPage = innerLink;
                             let displayText = innerLink;
                             
                             if (innerLink.includes('|')) {
                               const split = innerLink.split('|');
                               targetPage = split[0].trim();
                               displayText = split[1].trim();
                             }
                             
                             const urlPath = "./" + targetPage.replace(/\\s+/g, '-').toLowerCase();
                             
                             const htmlLink = '<a href="' + urlPath + '" style="color: #6fbaff; text-decoration: none;">' + displayText + '</a>';
                             titleText = titleText.replace(linkMatch[0], htmlLink);
                           }
                           
                           marker.bindPopup('<b>' + titleText + '</b>');
                         }
                      }
                    }
                  }
                });
              }
            });
          });
        `}}></script>
      </head>
    )
  }

  return Head
}) satisfies QuartzComponentConstructor