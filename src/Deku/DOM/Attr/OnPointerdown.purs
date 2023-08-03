module Deku.DOM.Attr.OnPointerdown where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerdown = OnPointerdown

instance Attr anything OnPointerdown (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerdown", value: cb' value })
instance Attr anything OnPointerdown  Cb  where
  attr OnPointerdown value = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: cb' value }
instance Attr anything OnPointerdown (Event.Event  Cb ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' value }

instance Attr anything OnPointerdown (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerdown  (Effect Unit)  where
  attr OnPointerdown value = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerdown (Event.Event  (Effect Unit) ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerdown (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerdown  (Effect Boolean)  where
  attr OnPointerdown value = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: cb' (Cb (const value)) }
instance Attr anything OnPointerdown (Event.Event  (Effect Boolean) ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const value)) }

type OnPointerdownEffect =
  forall element
   . Attr element OnPointerdown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerdown (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerdown", value: unset' })
instance Attr everything OnPointerdown  Unit  where
  attr OnPointerdown _ = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: unset' }
instance Attr everything OnPointerdown (Event.Event  Unit ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerdown", value: unset' }
