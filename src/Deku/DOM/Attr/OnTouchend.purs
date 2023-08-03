module Deku.DOM.Attr.OnTouchend where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchend = OnTouchend

instance Attr anything OnTouchend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "touchend", value: cb' value })
instance Attr anything OnTouchend  Cb  where
  attr OnTouchend value = unsafeAttribute $ This $ pure $
    { key: "touchend", value: cb' value }
instance Attr anything OnTouchend (Event.Event  Cb ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' value }

instance Attr anything OnTouchend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchend  (Effect Unit)  where
  attr OnTouchend value = unsafeAttribute $ This $ pure $
    { key: "touchend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchend (Event.Event  (Effect Unit) ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchend  (Effect Boolean)  where
  attr OnTouchend value = unsafeAttribute $ This $ pure $
    { key: "touchend", value: cb' (Cb (const value)) }
instance Attr anything OnTouchend (Event.Event  (Effect Boolean) ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const value)) }

type OnTouchendEffect =
  forall element
   . Attr element OnTouchend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchend", value: unset' })
instance Attr everything OnTouchend  Unit  where
  attr OnTouchend _ = unsafeAttribute $ This $ pure $
    { key: "touchend", value: unset' }
instance Attr everything OnTouchend (Event.Event  Unit ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchend", value: unset' }
