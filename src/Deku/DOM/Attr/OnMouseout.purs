module Deku.DOM.Attr.OnMouseout where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseout = OnMouseout

instance Attr anything OnMouseout (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both
    { key: "mouseout", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseout", value: cb' value })
instance Attr anything OnMouseout  Cb  where
  attr OnMouseout value = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: cb' value }
instance Attr anything OnMouseout (Event.Event  Cb ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseout", value: cb' value }

instance Attr anything OnMouseout (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both
    { key: "mouseout", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseout", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseout  (Effect Unit)  where
  attr OnMouseout value = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseout (Event.Event  (Effect Unit) ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseout (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both
    { key: "mouseout", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseout", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseout  (Effect Boolean)  where
  attr OnMouseout value = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: cb' (Cb (const value)) }
instance Attr anything OnMouseout (Event.Event  (Effect Boolean) ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const value)) }

type OnMouseoutEffect =
  forall element
   . Attr element OnMouseout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseout (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both
    { key: "mouseout", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseout", value: unset' })
instance Attr everything OnMouseout  Unit  where
  attr OnMouseout _ = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: unset' }
instance Attr everything OnMouseout (Event.Event  Unit ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseout", value: unset' }
