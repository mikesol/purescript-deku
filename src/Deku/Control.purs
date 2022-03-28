module Deku.Control
  ( atta'bute
  , atta'butWithSpice
  , te'xt
  , te'xtWithSpice
  , elementify
  , (@@)
  , (~~)
  , text
  , text_
  , deku
  ) where

import Prelude hiding (map)

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Either (Either)
import Data.Exists (mkExists, runExists)
import Data.Foldable (foldl)
import Data.Functor as F
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute (Attribute, unsafeUnAttributeArray)
import Deku.Core (Atta'bute, Atta'buteF(..), DOMInterpret(..), Element, Element', Te'xt, Te'xtF(..))
import Deku.Rendered (RootDOMElement(..))
import FRP.Behavior (sample_)
import FRP.Event (Event, fix, keepLatest)
import Web.DOM as Web.DOM

atta'bute
  :: forall element
   . ( forall a
        . Event a /\ (a -> Array (Attribute element))
       -> Atta'bute element
     )
atta'bute = mkExists <<< Atta'buteF

atta'butWithSpice
  :: forall element
   . ( forall a
        . Event a
       -> (a -> Array (Attribute element))
       -> Atta'bute element
     )
atta'butWithSpice = curry atta'bute

infix 5 atta'butWithSpice as @@

te'xt
  :: (forall a. Event a /\ (a -> String) -> Te'xt)
te'xt = mkExists <<< Te'xtF
te'xtWithSpice
  :: (forall a. Event a -> (a -> String) -> Te'xt)
te'xtWithSpice = curry te'xt

infix 5 te'xtWithSpice as ~~

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
  -> Te'xt
  -> Element' dom engine
unsafeSetText (DOMInterpret { setText }) id txt = F.map
  (setText <<< { id, text: _ })
  (runExists (\(Te'xtF (e /\ f)) -> F.map f e) txt)

unsafeSetAttribute
  :: forall element dom engine
   . DOMInterpret dom engine
  -> String
  -> Atta'bute element
  -> Element' dom engine
unsafeSetAttribute (DOMInterpret { setAttributes }) id atts = F.map
  (setAttributes <<< { id, attributes: _ } <<< unsafeUnAttributeArray)
  (runExists (\(Atta'buteF (e /\ f)) -> F.map f e) atts)

elementify
  :: forall element dom engine
   . String
  -> Atta'bute element
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
   . Te'xt
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
text_ txt = text (pure unit ~~ const txt)

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