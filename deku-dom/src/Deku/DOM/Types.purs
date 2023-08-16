module Deku.DOM.Types where

import Prelude

import Data.Newtype as Data.Newtype
import Deku.Attribute (Attribute, AttributeValue(..), unsafeAttribute, unsafeUnAttribute)
import Effect (Effect)
import FRP.Event (Event)
import Web.Event.Internal.Types as Web.Event.Internal.Types

newtype Keyword (v :: Symbol) = Keyword String

type role Keyword phantom

derive instance Data.Newtype.Newtype (Keyword v) _
type EventEffect = Web.Event.Internal.Types.Event -> Effect Unit

-- | Converts an `Attribute` constructor to an `Attribute` unsetter.
-- | 
-- | ```purescript
-- | div [ _class "selected" selected, unset _class unselected ] [ text "button" ]
-- | ```
_unset
  :: forall e a r
   . Monoid a
  => (Event a -> Event (Attribute r))
  -> Event e
  -> Event (Attribute r)
_unset attr trigger =
  unsafeAttribute <<< _ { value = Unset' } <<< unsafeUnAttribute <$> attr
    (const mempty <$> trigger)
