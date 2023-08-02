module Deku.DOM.Attr.OnKeydown where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeydown = OnKeydown

instance Attr anything OnKeydown (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both
    { key: "keydown", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keydown", value: cb' value })
instance Attr anything OnKeydown  Cb  where
  attr OnKeydown value = unsafeAttribute $ This
    { key: "keydown", value: cb' value }
instance Attr anything OnKeydown (Event.Event  Cb ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keydown", value: cb' value }

instance Attr anything OnKeydown (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both
    { key: "keydown", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keydown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeydown  (Effect Unit)  where
  attr OnKeydown value = unsafeAttribute $ This
    { key: "keydown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeydown (Event.Event  (Effect Unit) ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeydown (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both
    { key: "keydown", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keydown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeydown  (Effect Boolean)  where
  attr OnKeydown value = unsafeAttribute $ This
    { key: "keydown", value: cb' (Cb (const value)) }
instance Attr anything OnKeydown (Event.Event  (Effect Boolean) ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const value)) }

type OnKeydownEffect =
  forall element
   . Attr element OnKeydown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeydown (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both
    { key: "keydown", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "keydown", value: unset' })
instance Attr everything OnKeydown  Unit  where
  attr OnKeydown _ = unsafeAttribute $ This
    { key: "keydown", value: unset' }
instance Attr everything OnKeydown (Event.Event  Unit ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keydown", value: unset' }
