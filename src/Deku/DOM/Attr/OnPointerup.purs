module Deku.DOM.Attr.OnPointerup where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerup = OnPointerup

instance Attr anything OnPointerup (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerup bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerup", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerup", value: cb' value })
instance Attr anything OnPointerup  Cb  where
  attr OnPointerup value = unsafeAttribute $ This $ pure $
    { key: "pointerup", value: cb' value }
instance Attr anything OnPointerup (Event.Event  Cb ) where
  attr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerup", value: cb' value }

instance Attr anything OnPointerup (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerup bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerup  (Effect Unit)  where
  attr OnPointerup value = unsafeAttribute $ This $ pure $
    { key: "pointerup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerup (Event.Event  (Effect Unit) ) where
  attr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerup (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerup bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerup", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerup  (Effect Boolean)  where
  attr OnPointerup value = unsafeAttribute $ This $ pure $
    { key: "pointerup", value: cb' (Cb (const value)) }
instance Attr anything OnPointerup (Event.Event  (Effect Boolean) ) where
  attr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const value)) }

type OnPointerupEffect =
  forall element
   . Attr element OnPointerup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerup (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerup bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerup", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerup", value: unset' })
instance Attr everything OnPointerup  Unit  where
  attr OnPointerup _ = unsafeAttribute $ This $ pure $
    { key: "pointerup", value: unset' }
instance Attr everything OnPointerup (Event.Event  Unit ) where
  attr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerup", value: unset' }
