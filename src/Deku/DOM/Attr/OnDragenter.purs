module Deku.DOM.Attr.OnDragenter where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragenter = OnDragenter

instance Attr anything OnDragenter (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dragenter", value: cb' value })
instance Attr anything OnDragenter  Cb  where
  attr OnDragenter value = unsafeAttribute $ This
    { key: "dragenter", value: cb' value }
instance Attr anything OnDragenter (Event.Event  Cb ) where
  attr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragenter", value: cb' value }

instance Attr anything OnDragenter (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragenter  (Effect Unit)  where
  attr OnDragenter value = unsafeAttribute $ This
    { key: "dragenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragenter (Event.Event  (Effect Unit) ) where
  attr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragenter (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragenter  (Effect Boolean)  where
  attr OnDragenter value = unsafeAttribute $ This
    { key: "dragenter", value: cb' (Cb (const value)) }
instance Attr anything OnDragenter (Event.Event  (Effect Boolean) ) where
  attr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const value)) }

type OnDragenterEffect =
  forall element
   . Attr element OnDragenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragenter (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragenter", value: unset' })
instance Attr everything OnDragenter  Unit  where
  attr OnDragenter _ = unsafeAttribute $ This
    { key: "dragenter", value: unset' }
instance Attr everything OnDragenter (Event.Event  Unit ) where
  attr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragenter", value: unset' }
