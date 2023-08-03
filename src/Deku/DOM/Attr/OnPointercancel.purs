module Deku.DOM.Attr.OnPointercancel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointercancel = OnPointercancel

instance Attr anything OnPointercancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointercancel", value: cb' value })
instance Attr anything OnPointercancel  Cb  where
  attr OnPointercancel value = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: cb' value }
instance Attr anything OnPointercancel (Event.Event  Cb ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' value }

instance Attr anything OnPointercancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointercancel  (Effect Unit)  where
  attr OnPointercancel value = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointercancel (Event.Event  (Effect Unit) ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointercancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointercancel  (Effect Boolean)  where
  attr OnPointercancel value = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: cb' (Cb (const value)) }
instance Attr anything OnPointercancel (Event.Event  (Effect Boolean) ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' (Cb (const value)) }

type OnPointercancelEffect =
  forall element
   . Attr element OnPointercancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointercancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointercancel", value: unset' })
instance Attr everything OnPointercancel  Unit  where
  attr OnPointercancel _ = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: unset' }
instance Attr everything OnPointercancel (Event.Event  Unit ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "pointercancel", value: unset' }
