module Deku.DOM.Attr.OnPointerover where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerover = OnPointerover

instance Attr anything OnPointerover (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerover", value: cb' value })
instance Attr anything OnPointerover  Cb  where
  attr OnPointerover value = unsafeAttribute $ This
    { key: "pointerover", value: cb' value }
instance Attr anything OnPointerover (Event.Event  Cb ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerover  (Effect Unit)  where
  attr OnPointerover value = unsafeAttribute $ This
    { key: "pointerover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerover (Event.Event  (Effect Unit) ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerover  (Effect Boolean)  where
  attr OnPointerover value = unsafeAttribute $ This
    { key: "pointerover", value: cb' (Cb (const value)) }
instance Attr anything OnPointerover (Event.Event  (Effect Boolean) ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const value)) }

type OnPointeroverEffect =
  forall element
   . Attr element OnPointerover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerover (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerover", value: unset' })
instance Attr everything OnPointerover  Unit  where
  attr OnPointerover _ = unsafeAttribute $ This
    { key: "pointerover", value: unset' }
instance Attr everything OnPointerover (Event.Event  Unit ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerover", value: unset' }
