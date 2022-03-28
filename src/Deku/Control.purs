module Deku.Control
  ( elementify
  , text
  , text_
  , many
  , firstThen
  , deku
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Foldable (foldl)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element, Element')
import Deku.Rendered (RootDOMElement(..))
import FRP.Behavior (sample_)
import FRP.Event (Event, fold, keepLatest)
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
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall element dom engine
   . DOMInterpret dom engine
  -> String
  -> Event (Attribute element)
  -> Element' dom engine
unsafeSetAttribute (DOMInterpret { setAttribute }) id atts = map
  ( setAttribute <<< (\{ key, value } -> { id, key, value }) <<<
      unsafeUnAttribute
  )
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
          <> (map (\kid -> kid me di) children)
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
deku root elts di@(DOMInterpret { ids, makeRoot, identifyAsTerminus }) =
  keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        foldl (<|>) empty $
          [ pure (makeRoot { id: me, root: (RootDOMElement root) })
          , pure (identifyAsTerminus { id: me })
          ]
            <> (map (\kid -> kid me di) elts)
    )

{-
firstThen :: forall a b. Event a -> (a -> Array b) -> (a -> Array b) -> Event b
firstThen e f s = fix \i -> { input: {false, }, output: }
-}
firstThen :: forall a b. Event a -> (a -> Array b) -> (a -> Array b) -> Event b
firstThen e f s = keepLatest
  ( map (foldl (<|>) empty)
      ( (\tf e' -> map pure (if tf then f e' else s e'))
          <$> map (_ < 0) (fold (\_ x -> (x - 1)) e 1)
          <*> e
      )
  )

many :: forall a b. Event a -> (a -> Array b) -> Event b
many event f = keepLatest
  (event <#> \e -> foldl (<|>) empty (map pure (f e)))