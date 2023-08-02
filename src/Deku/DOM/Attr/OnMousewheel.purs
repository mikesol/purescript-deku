module Deku.DOM.Attr.OnMousewheel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both
    { key: "mousewheel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mousewheel", value: cb' value })
instance Attr anything OnMousewheel  Cb  where
  attr OnMousewheel value = unsafeAttribute $ This
    { key: "mousewheel", value: cb' value }
instance Attr anything OnMousewheel (Event.Event  Cb ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' value }

instance Attr anything OnMousewheel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both
    { key: "mousewheel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousewheel  (Effect Unit)  where
  attr OnMousewheel value = unsafeAttribute $ This
    { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousewheel (Event.Event  (Effect Unit) ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousewheel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both
    { key: "mousewheel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousewheel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousewheel  (Effect Boolean)  where
  attr OnMousewheel value = unsafeAttribute $ This
    { key: "mousewheel", value: cb' (Cb (const value)) }
instance Attr anything OnMousewheel (Event.Event  (Effect Boolean) ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const value)) }

type OnMousewheelEffect =
  forall element
   . Attr element OnMousewheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousewheel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both
    { key: "mousewheel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mousewheel", value: unset' })
instance Attr everything OnMousewheel  Unit  where
  attr OnMousewheel _ = unsafeAttribute $ This
    { key: "mousewheel", value: unset' }
instance Attr everything OnMousewheel (Event.Event  Unit ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousewheel", value: unset' }
