module Deku.DOM.Attr.OnPointerleave where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerleave = OnPointerleave

instance Attr anything OnPointerleave (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerleave", value: cb' value })
instance Attr anything OnPointerleave  Cb  where
  attr OnPointerleave value = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerleave (Event.Event  Cb ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' value }

instance Attr anything OnPointerleave (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerleave  (Effect Unit)  where
  attr OnPointerleave value = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerleave (Event.Event  (Effect Unit) ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerleave (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerleave  (Effect Boolean)  where
  attr OnPointerleave value = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: cb' (Cb (const value)) }
instance Attr anything OnPointerleave (Event.Event  (Effect Boolean) ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) }

type OnPointerleaveEffect =
  forall element
   . Attr element OnPointerleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerleave (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerleave", value: unset' })
instance Attr everything OnPointerleave  Unit  where
  attr OnPointerleave _ = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: unset' }
instance Attr everything OnPointerleave (Event.Event  Unit ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerleave", value: unset' }
