module Deku.DOM.Attr.OnKeypress where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeypress = OnKeypress

instance Attr anything OnKeypress Cb where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keypress", value: cb' value })
  pureAttr OnKeypress value = unsafeAttribute $ This
    { key: "keypress", value: cb' value }
  unpureAttr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' value }

instance Attr anything OnKeypress (Effect Unit) where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnKeypress value = unsafeAttribute $ This
    { key: "keypress", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeypress (Effect Boolean) where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const value)) }
    )
  pureAttr OnKeypress value = unsafeAttribute $ This
    { key: "keypress", value: cb' (Cb (const value)) }
  unpureAttr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const value)) }

type OnKeypressEffect =
  forall element
   . Attr element OnKeypress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeypress Unit where
  attr OnKeypress bothValues = unsafeAttribute $ Both
    { key: "keypress", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "keypress", value: unset' })
  pureAttr OnKeypress _ = unsafeAttribute $ This
    { key: "keypress", value: unset' }
  unpureAttr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keypress", value: unset' }
