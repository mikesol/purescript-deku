module Deku.Graph.DOM
  ( atta'bute
  , atta'butWithSpice
  , Atta'buteF
  , Atta'bute
  , te'xt
  , te'xtWithSpice
  , Te'xtF
  , Te'xt
  , (@@)
  , (~~)
  , text
  -- codegen 7
  -- codegen 7
  -- codegen 0
  -- codegen 0
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..))
import Data.Tuple (curry, uncurry)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Graph.Attribute (Attribute, unsafeUnAttributeArray)
import Deku.Interpret (class DOMInterpret, connectXToY, makeElement, makeText, setAttributes, setText)
import FRP.Behavior (Behavior, sample_)
import FRP.Event (Event, keepLatest)

newtype Atta'buteF element a = Atta'buteF
  (Event a /\ (a -> Array (Attribute element)))

type Atta'bute element = Exists (Atta'buteF element)

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

----
newtype Te'xtF a = Te'xtF (Event a /\ (a -> String))

type Te'xt = Exists Te'xtF

te'xt
  :: (forall a. Event a /\ (a -> String) -> Te'xt)
te'xt = mkExists <<< Te'xtF
te'xtWithSpice
  :: (forall a. Event a -> (a -> String) -> Te'xt)
te'xtWithSpice = curry te'xt

infix 5 te'xtWithSpice as ~~

----
type Element' dom engine = Event (dom -> engine)
type Element dom engine =
  Behavior (String /\ Maybe String) -> Event (dom -> engine)

unsafeElement
  :: forall dom engine
   . DOMInterpret dom engine
  => String
  -> String
  -> dom
  -> engine
unsafeElement id tag = makeElement { id, tag }

unsafeText
  :: forall dom engine
   . DOMInterpret dom engine
  => String
  -> String
  -> dom
  -> engine
unsafeText id t = makeText { id, text: t }

unsafeSetText
  :: forall dom engine
   . DOMInterpret dom engine
  => String
  -> Te'xt
  -> Element' dom engine
unsafeSetText id txt = map
  (setText <<< { id, text: _ })
  (runExists (\(Te'xtF (e /\ f)) -> map f e) txt)

unsafeConnection
  :: forall dom engine
   . DOMInterpret dom engine
  => String
  -> String
  -> dom
  -> engine
unsafeConnection fromId toId = connectXToY { fromId, toId }

unsafeAttribute
  :: forall element dom engine
   . DOMInterpret dom engine
  => String
  -> Atta'bute element
  -> Element' dom engine
unsafeAttribute id atts = map
  (setAttributes <<< { id, attributes: _ } <<< unsafeUnAttributeArray)
  (runExists (\(Atta'buteF (e /\ f)) -> map f e) atts)

elementify
  :: forall element dom engine
   . DOMInterpret dom engine
  => String
  -> Atta'bute element
  -> Array (Element dom engine)
  -> Element dom engine
elementify tag atts children ids = keepLatest
  ( meAndParent <#> \(me /\ parent) ->
      foldl (<|>) empty $
        [ pure (unsafeElement me tag)
        , unsafeAttribute me atts
        ]
          <> (map ((#) ((map <<< map) (const $ Just me) ids)) children)
          <> case parent of
            Just parent' -> [ pure (unsafeConnection me parent') ]
            Nothing -> []
  )
  where
  meAndParent = sample_ ids (pure unit)

text
  :: forall dom engine
   . DOMInterpret dom engine
  => Te'xt
  -> String
  -> Element dom engine
text txt orig ids = keepLatest
  ( meAndParent <#> \(me /\ parent) ->
      foldl (<|>) empty $
        [ pure (unsafeText me orig)
        , unsafeSetText me txt
        ]
          <> case parent of
            Just parent' -> [ pure (unsafeConnection me parent') ]
            Nothing -> []
  )
  where
  meAndParent = sample_ ids (pure unit)

-- codegen 8
-- codegen 8
-- codegen 1
-- codegen 1
