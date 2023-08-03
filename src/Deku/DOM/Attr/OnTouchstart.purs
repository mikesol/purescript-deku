module Deku.DOM.Attr.OnTouchstart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchstart = OnTouchstart

instance Attr anything OnTouchstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "touchstart", value: cb' value })
instance Attr anything OnTouchstart  Cb  where
  attr OnTouchstart value = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: cb' value }
instance Attr anything OnTouchstart (Event.Event  Cb ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' value }

instance Attr anything OnTouchstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchstart  (Effect Unit)  where
  attr OnTouchstart value = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchstart (Event.Event  (Effect Unit) ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchstart  (Effect Boolean)  where
  attr OnTouchstart value = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: cb' (Cb (const value)) }
instance Attr anything OnTouchstart (Event.Event  (Effect Boolean) ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const value)) }

type OnTouchstartEffect =
  forall element
   . Attr element OnTouchstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchstart", value: unset' })
instance Attr everything OnTouchstart  Unit  where
  attr OnTouchstart _ = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: unset' }
instance Attr everything OnTouchstart (Event.Event  Unit ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchstart", value: unset' }
