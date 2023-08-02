module Deku.DOM.Attr.OnTouchcancel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "touchcancel", value: cb' value })
instance Attr anything OnTouchcancel  Cb  where
  attr OnTouchcancel value = unsafeAttribute $ This
    { key: "touchcancel", value: cb' value }
instance Attr anything OnTouchcancel (Event.Event  Cb ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' value }

instance Attr anything OnTouchcancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchcancel  (Effect Unit)  where
  attr OnTouchcancel value = unsafeAttribute $ This
    { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchcancel (Event.Event  (Effect Unit) ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchcancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchcancel  (Effect Boolean)  where
  attr OnTouchcancel value = unsafeAttribute $ This
    { key: "touchcancel", value: cb' (Cb (const value)) }
instance Attr anything OnTouchcancel (Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const value)) }

type OnTouchcancelEffect =
  forall element
   . Attr element OnTouchcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchcancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchcancel", value: unset' })
instance Attr everything OnTouchcancel  Unit  where
  attr OnTouchcancel _ = unsafeAttribute $ This
    { key: "touchcancel", value: unset' }
instance Attr everything OnTouchcancel (Event.Event  Unit ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchcancel", value: unset' }
