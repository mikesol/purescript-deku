module Deku.DOM.Attr.OnKeypress where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeypress = OnKeypress

instance Attr anything OnKeypress (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keypress", value: cb' value })
instance Attr anything OnKeypress  Cb  where
  attr OnKeypress value = unsafeAttribute $ This $ pure $
    { key: "keypress", value: cb' value }
instance Attr anything OnKeypress (Event.Event  Cb ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' value }

instance Attr anything OnKeypress (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeypress  (Effect Unit)  where
  attr OnKeypress value = unsafeAttribute $ This $ pure $
    { key: "keypress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeypress (Event.Event  (Effect Unit) ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeypress (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeypress  (Effect Boolean)  where
  attr OnKeypress value = unsafeAttribute $ This $ pure $
    { key: "keypress", value: cb' (Cb (const value)) }
instance Attr anything OnKeypress (Event.Event  (Effect Boolean) ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const value)) }

type OnKeypressEffect =
  forall element
   . Attr element OnKeypress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeypress (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "keypress", value: unset' })
instance Attr everything OnKeypress  Unit  where
  attr OnKeypress _ = unsafeAttribute $ This $ pure $
    { key: "keypress", value: unset' }
instance Attr everything OnKeypress (Event.Event  Unit ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keypress", value: unset' }
