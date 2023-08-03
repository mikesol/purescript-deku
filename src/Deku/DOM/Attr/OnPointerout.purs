module Deku.DOM.Attr.OnPointerout where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerout = OnPointerout

instance Attr anything OnPointerout (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerout", value: cb' value })
instance Attr anything OnPointerout  Cb  where
  attr OnPointerout value = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: cb' value }
instance Attr anything OnPointerout (Event.Event  Cb ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerout  (Effect Unit)  where
  attr OnPointerout value = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerout (Event.Event  (Effect Unit) ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerout  (Effect Boolean)  where
  attr OnPointerout value = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: cb' (Cb (const value)) }
instance Attr anything OnPointerout (Event.Event  (Effect Boolean) ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const value)) }

type OnPointeroutEffect =
  forall element
   . Attr element OnPointerout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerout (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerout", value: unset' })
instance Attr everything OnPointerout  Unit  where
  attr OnPointerout _ = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: unset' }
instance Attr everything OnPointerout (Event.Event  Unit ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerout", value: unset' }
