module Deku.DOM.Attr.OnPointerlockerror where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerlockerror = OnPointerlockerror

instance Attr anything OnPointerlockerror (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerlockerror bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockerror", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerlockerror", value: cb' value })
instance Attr anything OnPointerlockerror  Cb  where
  attr OnPointerlockerror value = unsafeAttribute $ This $ pure $
    { key: "pointerlockerror", value: cb' value }
instance Attr anything OnPointerlockerror (Event.Event  Cb ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointerlockerror", value: cb' value }

instance Attr anything OnPointerlockerror (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerlockerror bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockerror"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockerror", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerlockerror  (Effect Unit)  where
  attr OnPointerlockerror value = unsafeAttribute $ This $ pure $
    { key: "pointerlockerror", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerlockerror (Event.Event  (Effect Unit) ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "pointerlockerror", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockerror (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerlockerror bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockerror", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockerror", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerlockerror  (Effect Boolean)  where
  attr OnPointerlockerror value = unsafeAttribute $ This $ pure $
    { key: "pointerlockerror", value: cb' (Cb (const value)) }
instance Attr anything OnPointerlockerror (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointerlockerror", value: cb' (Cb (const value)) }

type OnPointerlockerrorEffect =
  forall element
   . Attr element OnPointerlockerror (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockerror (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerlockerror bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockerror", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerlockerror", value: unset' })
instance Attr everything OnPointerlockerror  Unit  where
  attr OnPointerlockerror _ = unsafeAttribute $ This $ pure $
    { key: "pointerlockerror", value: unset' }
instance Attr everything OnPointerlockerror (Event.Event  Unit ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "pointerlockerror", value: unset' }
