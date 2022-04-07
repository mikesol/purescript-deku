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
import FRP.Event.Phantom (Proof0)
import Web.DOM as Web.DOM

----
unsafeElement
  :: forall event proof payload
   . DOMInterpret event proof payload
  -> String
  -> String
  -> String
  -> payload
unsafeElement (DOMInterpret { makeElement }) id parent tag = makeElement
  { id, parent, tag }

unsafeText
  :: forall event proof payload
   . DOMInterpret event proof payload
  -> String
  -> String
  -> payload
unsafeText (DOMInterpret { makeText }) id parent = makeText
  { id, parent }

unsafeSetText
  :: forall event proof payload
   . Functor (event proof)
  => DOMInterpret event proof payload
  -> String
  -> event proof String
  -> event proof payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall element event proof payload
   . Functor (event proof)
  => DOMInterpret event proof payload
  -> String
  -> event proof (Attribute element)
  -> event proof payload
unsafeSetAttribute (DOMInterpret { setAttribute }) id atts = map
  ( setAttribute <<< (\{ key, value } -> { id, key, value }) <<<
      unsafeUnAttribute
  )
  (atts)

elementify
  :: forall element event proof payload
   . IsEvent (event proof)
  => String
  -> (event proof (Attribute element))
  -> Array (Element event proof payload)
  -> Element event proof payload
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
  :: forall event proof payload
   . IsEvent (event proof)
  => event proof String
  -> Element event proof payload
text txt = Element go
  where
  go parent di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        oneOf
          [ pure (unsafeText di me parent)
          , unsafeSetText di me txt
          ]
    )

text_
  :: forall event proof payload
   . IsEvent (event proof)
  => String
  -> Element event proof payload
text_ txt = text (pure txt)

deku
  :: forall event payload
   . IsEvent (event Proof0)
  => Web.DOM.Element
  -> Element event Proof0 payload
  -> DOMInterpret event Proof0 payload
  -> event Proof0 payload
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
  :: forall event proof payload
   . Plus (event proof)
  => Array (Element event proof payload)
  -> Element event proof payload
flatten a = Element $ (map <<< map) oneOf
  (map distribute (distribute $ map (\y -> let (Element x) = y in x) a))