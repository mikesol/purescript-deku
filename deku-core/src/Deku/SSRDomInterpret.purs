module Deku.SSRDomInterpret where

import Prelude

import Deku.Core (DekuElement, toDekuElement)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Effect (Effect)
import Effect.Uncurried (mkEffectFn5)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM (Comment, Element)
import Web.DOM.Document (createComment)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window (document)

pursx = "pur$x" :: String

makePursxPlaceholder :: Effect DekuElement
makePursxPlaceholder = do
  doc <- window >>= document
  cm <- createComment pursx (toDocument doc)
  pure (toDekuElement $ (unsafeCoerce :: Comment -> Element) cm)

-- return a comment that's the placeholder
ssrDOMInterpret :: Core.DOMInterpret
ssrDOMInterpret = Core.DOMInterpret t
  where
  Core.DOMInterpret n = fullDOMInterpret
  t = n { makePursx = mkEffectFn5 \_ _ _ _ _ -> makePursxPlaceholder}  