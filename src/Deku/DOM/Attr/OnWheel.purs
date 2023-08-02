module Deku.DOM.Attr.OnWheel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnWheel = OnWheel

instance Attr anything OnWheel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnWheel bothValues = unsafeAttribute $ Both
    { key: "wheel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "wheel", value: cb' value })
instance Attr anything OnWheel  Cb  where
  attr OnWheel value = unsafeAttribute $ This
    { key: "wheel", value: cb' value }
instance Attr anything OnWheel (Event.Event  Cb ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "wheel", value: cb' value }

instance Attr anything OnWheel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnWheel bothValues = unsafeAttribute $ Both
    { key: "wheel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "wheel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnWheel  (Effect Unit)  where
  attr OnWheel value = unsafeAttribute $ This
    { key: "wheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWheel (Event.Event  (Effect Unit) ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWheel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnWheel bothValues = unsafeAttribute $ Both
    { key: "wheel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "wheel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnWheel  (Effect Boolean)  where
  attr OnWheel value = unsafeAttribute $ This
    { key: "wheel", value: cb' (Cb (const value)) }
instance Attr anything OnWheel (Event.Event  (Effect Boolean) ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const value)) }

type OnWheelEffect =
  forall element
   . Attr element OnWheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWheel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnWheel bothValues = unsafeAttribute $ Both
    { key: "wheel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "wheel", value: unset' })
instance Attr everything OnWheel  Unit  where
  attr OnWheel _ = unsafeAttribute $ This { key: "wheel", value: unset' }
instance Attr everything OnWheel (Event.Event  Unit ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "wheel", value: unset' }
