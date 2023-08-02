module Deku.DOM.Attr.OnMouseup where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseup = OnMouseup

instance Attr anything OnMouseup (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both
    { key: "mouseup", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseup", value: cb' value })
instance Attr anything OnMouseup  Cb  where
  attr OnMouseup value = unsafeAttribute $ This
    { key: "mouseup", value: cb' value }
instance Attr anything OnMouseup (Event.Event  Cb ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseup", value: cb' value }

instance Attr anything OnMouseup (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both
    { key: "mouseup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseup  (Effect Unit)  where
  attr OnMouseup value = unsafeAttribute $ This
    { key: "mouseup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseup (Event.Event  (Effect Unit) ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseup (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both
    { key: "mouseup", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseup  (Effect Boolean)  where
  attr OnMouseup value = unsafeAttribute $ This
    { key: "mouseup", value: cb' (Cb (const value)) }
instance Attr anything OnMouseup (Event.Event  (Effect Boolean) ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const value)) }

type OnMouseupEffect =
  forall element
   . Attr element OnMouseup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseup (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both
    { key: "mouseup", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseup", value: unset' })
instance Attr everything OnMouseup  Unit  where
  attr OnMouseup _ = unsafeAttribute $ This
    { key: "mouseup", value: unset' }
instance Attr everything OnMouseup (Event.Event  Unit ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseup", value: unset' }
