module Deku.Control
  ( elementify
  , text
  , text_
  , many
  , deku
  , flatten
  ) where

import Prelude

import Control.Plus (class Plus)
import Data.Distributive (distribute)
import Data.Foldable (oneOf)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element(..))
import FRP.Behavior (sample_)
import FRP.Event (class IsEvent, Event, keepLatest)
import Web.DOM as Web.DOM

----
unsafeElement
  :: forall event payload
   . DOMInterpret event payload
  -> String
  -> String
  -> String
  -> payload
unsafeElement (DOMInterpret { makeElement }) id parent tag = makeElement
  { id, parent, tag }

unsafeText
  :: forall event payload
   . DOMInterpret event payload
  -> String
  -> String
  -> payload
unsafeText (DOMInterpret { makeText }) id parent = makeText
  { id, parent }

unsafeSetText
  :: forall event payload
   . Functor event
  => DOMInterpret event payload
  -> String
  -> event String
  -> event payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall element event payload
   . Functor event
  => DOMInterpret event payload
  -> String
  -> event (Attribute element)
  -> event payload
unsafeSetAttribute (DOMInterpret { setAttribute }) id atts = map
  ( setAttribute <<< (\{ key, value } -> { id, key, value }) <<<
      unsafeUnAttribute
  )
  (atts)

elementify
  :: forall element event payload
   . IsEvent event
  => String
  -> (event (Attribute element))
  -> Array (Element event payload)
  -> Element event payload
elementify tag atts children = Element go
  where
  go parent di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        oneOf $
          [ pure (unsafeElement di me parent tag)
          , unsafeSetAttribute di me atts
          ]
            <>
              ( map (\kid -> kid me di)
                  (map (\y -> let (Element x) = y in x) children)
              )
    )

text
  :: forall event payload
   . IsEvent event
  => event String
  -> Element event payload
text txt = Element go
  where
  go parent di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        oneOf
          [ pure (unsafeText di me parent)
          , unsafeSetText di me txt
          ]
    )

text_ :: forall event payload. IsEvent event => String -> Element event payload
text_ txt = text (pure txt)

deku
  :: forall event payload
   . IsEvent event
  => Web.DOM.Element
  -> Element event payload
  -> DOMInterpret event payload
  -> event payload
deku root elts di@(DOMInterpret { ids, makeRoot }) =
  keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        oneOf $
          [ pure (makeRoot { id: me, root })
          , (((\y -> let Element x = y in x) elts) me di)
          ]
    )

many :: forall a b. Event a -> (a -> Array b) -> Event b
many event f = keepLatest
  (event <#> \e -> oneOf (map pure (f e)))

flatten
  :: forall event payload
   . Plus event
  => Array (Element event payload)
  -> Element event payload
flatten a = Element $ (map <<< map) oneOf
  (map distribute (distribute $ map (\y -> let (Element x) = y in x) a))