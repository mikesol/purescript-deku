module Deku.DOM.Attr.OnTouchmove where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "touchmove", value: cb' value })
instance Attr anything OnTouchmove  Cb  where
  attr OnTouchmove value = unsafeAttribute $ This
    { key: "touchmove", value: cb' value }
instance Attr anything OnTouchmove (Event.Event  Cb ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' value }

instance Attr anything OnTouchmove (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchmove  (Effect Unit)  where
  attr OnTouchmove value = unsafeAttribute $ This
    { key: "touchmove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchmove (Event.Event  (Effect Unit) ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchmove  (Effect Boolean)  where
  attr OnTouchmove value = unsafeAttribute $ This
    { key: "touchmove", value: cb' (Cb (const value)) }
instance Attr anything OnTouchmove (Event.Event  (Effect Boolean) ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const value)) }

type OnTouchmoveEffect =
  forall element
   . Attr element OnTouchmove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchmove (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchmove", value: unset' })
instance Attr everything OnTouchmove  Unit  where
  attr OnTouchmove _ = unsafeAttribute $ This
    { key: "touchmove", value: unset' }
instance Attr everything OnTouchmove (Event.Event  Unit ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchmove", value: unset' }
