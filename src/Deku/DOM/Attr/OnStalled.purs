module Deku.DOM.Attr.OnStalled where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnStalled = OnStalled

instance Attr anything OnStalled (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stalled", value: cb' value })
instance Attr anything OnStalled  Cb  where
  attr OnStalled value = unsafeAttribute $ This
    { key: "stalled", value: cb' value }
instance Attr anything OnStalled (Event.Event  Cb ) where
  attr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stalled", value: cb' value }

instance Attr anything OnStalled (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stalled", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnStalled  (Effect Unit)  where
  attr OnStalled value = unsafeAttribute $ This
    { key: "stalled", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnStalled (Event.Event  (Effect Unit) ) where
  attr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnStalled (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stalled", value: cb' (Cb (const value)) }
    )
instance Attr anything OnStalled  (Effect Boolean)  where
  attr OnStalled value = unsafeAttribute $ This
    { key: "stalled", value: cb' (Cb (const value)) }
instance Attr anything OnStalled (Event.Event  (Effect Boolean) ) where
  attr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const value)) }

type OnStalledEffect =
  forall element
   . Attr element OnStalled (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnStalled (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "stalled", value: unset' })
instance Attr everything OnStalled  Unit  where
  attr OnStalled _ = unsafeAttribute $ This
    { key: "stalled", value: unset' }
instance Attr everything OnStalled (Event.Event  Unit ) where
  attr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stalled", value: unset' }
