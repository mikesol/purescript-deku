module Deku.DOM.Attr.OnMousemove where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousemove = OnMousemove

instance Attr anything OnMousemove (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mousemove", value: cb' value })
instance Attr anything OnMousemove  Cb  where
  attr OnMousemove value = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: cb' value }
instance Attr anything OnMousemove (Event.Event  Cb ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousemove", value: cb' value }

instance Attr anything OnMousemove (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousemove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousemove  (Effect Unit)  where
  attr OnMousemove value = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousemove (Event.Event  (Effect Unit) ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousemove (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousemove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousemove  (Effect Boolean)  where
  attr OnMousemove value = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: cb' (Cb (const value)) }
instance Attr anything OnMousemove (Event.Event  (Effect Boolean) ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const value)) }

type OnMousemoveEffect =
  forall element
   . Attr element OnMousemove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousemove (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mousemove", value: unset' })
instance Attr everything OnMousemove  Unit  where
  attr OnMousemove _ = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: unset' }
instance Attr everything OnMousemove (Event.Event  Unit ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousemove", value: unset' }
