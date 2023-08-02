module Deku.DOM.Attr.OnDragend where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragend = OnDragend

instance Attr anything OnDragend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dragend", value: cb' value })
instance Attr anything OnDragend  Cb  where
  attr OnDragend value = unsafeAttribute $ This
    { key: "dragend", value: cb' value }
instance Attr anything OnDragend (Event.Event  Cb ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' value }

instance Attr anything OnDragend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragend  (Effect Unit)  where
  attr OnDragend value = unsafeAttribute $ This
    { key: "dragend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragend (Event.Event  (Effect Unit) ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragend  (Effect Boolean)  where
  attr OnDragend value = unsafeAttribute $ This
    { key: "dragend", value: cb' (Cb (const value)) }
instance Attr anything OnDragend (Event.Event  (Effect Boolean) ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const value)) }

type OnDragendEffect =
  forall element
   . Attr element OnDragend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragend", value: unset' })
instance Attr everything OnDragend  Unit  where
  attr OnDragend _ = unsafeAttribute $ This
    { key: "dragend", value: unset' }
instance Attr everything OnDragend (Event.Event  Unit ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragend", value: unset' }
