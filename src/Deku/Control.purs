module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  ) where

import Prelude hiding (map)

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Foldable (foldl)
import Data.Functor as F
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element, Element')
import Deku.Rendered (RootDOMElement(..))
import FRP.Behavior (sample_)
import FRP.Event (Event, keepLatest)
import Web.DOM as Web.DOM

----
unsafeElement
  :: forall dom engine
   . DOMInterpret dom engine
  -> String
  -> String
  -> String
  -> dom
  -> engine
unsafeElement (DOMInterpret { makeElement }) id parent tag = makeElement
  { id, parent, tag }

unsafeText
  :: forall dom engine
   . DOMInterpret dom engine
  -> String
  -> String
  -> dom
  -> engine
unsafeText (DOMInterpret { makeText }) id parent = makeText
  { id, parent }

unsafeSetText
  :: forall dom engine
   . DOMInterpret dom engine
  -> String
  -> Event String
  -> Element' dom engine
unsafeSetText (DOMInterpret { setText }) id txt = F.map
  (setText <<< { id, text: _ }) txt

unsafeSetAttribute
  :: forall element dom engine
   . DOMInterpret dom engine
  -> String
  -> Event (Attribute element)
  -> Element' dom engine
unsafeSetAttribute (DOMInterpret { setAttribute }) id atts = F.map
  (setAttribute <<< (\{ key, value} -> { id, key, value  }) <<< unsafeUnAttribute)
  (atts)

elementify
  :: forall element dom engine
   . String
  -> (Event (Attribute element))
  -> Array (Element dom engine)
  -> Element dom engine
elementify tag atts children parent di@(DOMInterpret { ids }) = keepLatest
  ( (sample_ ids (pure unit)) <#> \me ->
      foldl (<|>) empty $
        [ pure (unsafeElement di me parent tag)
        , unsafeSetAttribute di me atts
        ]
          <> (F.map (\kid -> kid me di) children)
  )

text
  :: forall dom engine
   . Event String
  -> Element dom engine
text txt parent di@(DOMInterpret { ids }) = keepLatest
  ( (sample_ ids (pure unit)) <#> \me ->
      foldl (<|>) empty $
        [ pure (unsafeText di me parent)
        , unsafeSetText di me txt
        ]
  )

text_
  :: forall dom engine
   . String
  -> Element dom engine
text_ txt = text (pure txt)

deku
  :: forall dom engine
   . Web.DOM.Element
  -> Array (Element dom engine)
  -> DOMInterpret dom engine
  -> Event (dom -> engine)
deku root elts di@(DOMInterpret { ids, makeRoot }) = keepLatest
  ( (sample_ ids (pure unit)) <#> \me ->
      foldl (<|>) empty $
        [ pure (makeRoot { id: me, root: (RootDOMElement root) })
        ]
          <> (F.map (\kid -> kid me di) elts)
  )