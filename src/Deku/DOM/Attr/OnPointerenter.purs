module Deku.DOM.Attr.OnPointerenter where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerenter", value: cb' value })
instance Attr anything OnPointerenter  Cb  where
  attr OnPointerenter value = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: cb' value }
instance Attr anything OnPointerenter (Event.Event  Cb ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerenter  (Effect Unit)  where
  attr OnPointerenter value = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerenter (Event.Event  (Effect Unit) ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerenter  (Effect Boolean)  where
  attr OnPointerenter value = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: cb' (Cb (const value)) }
instance Attr anything OnPointerenter (Event.Event  (Effect Boolean) ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const value)) }

type OnPointerenterEffect =
  forall element
   . Attr element OnPointerenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerenter (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerenter", value: unset' })
instance Attr everything OnPointerenter  Unit  where
  attr OnPointerenter _ = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: unset' }
instance Attr everything OnPointerenter (Event.Event  Unit ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerenter", value: unset' }
