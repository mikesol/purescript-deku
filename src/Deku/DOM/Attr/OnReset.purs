module Deku.DOM.Attr.OnReset where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnReset = OnReset

instance Attr anything OnReset (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnReset bothValues = unsafeAttribute $ Both
    { key: "reset", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "reset", value: cb' value })
instance Attr anything OnReset  Cb  where
  attr OnReset value = unsafeAttribute $ This $ pure $
    { key: "reset", value: cb' value }
instance Attr anything OnReset (Event.Event  Cb ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reset", value: cb' value }

instance Attr anything OnReset (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnReset bothValues = unsafeAttribute $ Both
    { key: "reset", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "reset", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnReset  (Effect Unit)  where
  attr OnReset value = unsafeAttribute $ This $ pure $
    { key: "reset", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnReset (Event.Event  (Effect Unit) ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnReset (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnReset bothValues = unsafeAttribute $ Both
    { key: "reset", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "reset", value: cb' (Cb (const value)) }
    )
instance Attr anything OnReset  (Effect Boolean)  where
  attr OnReset value = unsafeAttribute $ This $ pure $
    { key: "reset", value: cb' (Cb (const value)) }
instance Attr anything OnReset (Event.Event  (Effect Boolean) ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const value)) }

type OnResetEffect =
  forall element
   . Attr element OnReset (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnReset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnReset bothValues = unsafeAttribute $ Both
    { key: "reset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "reset", value: unset' })
instance Attr everything OnReset  Unit  where
  attr OnReset _ = unsafeAttribute $ This $ pure $ { key: "reset", value: unset' }
instance Attr everything OnReset (Event.Event  Unit ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "reset", value: unset' }
