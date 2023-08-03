module Deku.DOM.Attr.OnMouseleave where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseleave = OnMouseleave

instance Attr anything OnMouseleave (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseleave", value: cb' value })
instance Attr anything OnMouseleave  Cb  where
  attr OnMouseleave value = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: cb' value }
instance Attr anything OnMouseleave (Event.Event  Cb ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' value }

instance Attr anything OnMouseleave (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseleave  (Effect Unit)  where
  attr OnMouseleave value = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseleave (Event.Event  (Effect Unit) ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseleave (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseleave  (Effect Boolean)  where
  attr OnMouseleave value = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: cb' (Cb (const value)) }
instance Attr anything OnMouseleave (Event.Event  (Effect Boolean) ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const value)) }

type OnMouseleaveEffect =
  forall element
   . Attr element OnMouseleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseleave (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseleave", value: unset' })
instance Attr everything OnMouseleave  Unit  where
  attr OnMouseleave _ = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: unset' }
instance Attr everything OnMouseleave (Event.Event  Unit ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseleave", value: unset' }
