module Deku.DOM.Attr.OnMousedown where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousedown = OnMousedown

instance Attr anything OnMousedown (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mousedown", value: cb' value })
instance Attr anything OnMousedown  Cb  where
  attr OnMousedown value = unsafeAttribute $ This
    { key: "mousedown", value: cb' value }
instance Attr anything OnMousedown (Event.Event  Cb ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' value }

instance Attr anything OnMousedown (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousedown  (Effect Unit)  where
  attr OnMousedown value = unsafeAttribute $ This
    { key: "mousedown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousedown (Event.Event  (Effect Unit) ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousedown (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousedown  (Effect Boolean)  where
  attr OnMousedown value = unsafeAttribute $ This
    { key: "mousedown", value: cb' (Cb (const value)) }
instance Attr anything OnMousedown (Event.Event  (Effect Boolean) ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const value)) }

type OnMousedownEffect =
  forall element
   . Attr element OnMousedown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousedown (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mousedown", value: unset' })
instance Attr everything OnMousedown  Unit  where
  attr OnMousedown _ = unsafeAttribute $ This
    { key: "mousedown", value: unset' }
instance Attr everything OnMousedown (Event.Event  Unit ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousedown", value: unset' }
